{{/*
Expand the name of the chart.
*/}}
{{- define "helm-webapp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "helm-webapp.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "helm-webapp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "helm-webapp.labels" -}}
helm.sh/chart: {{ include "helm-webapp.chart" . }}
{{ include "helm-webapp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "helm-webapp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "helm-webapp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "helm-webapp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "helm-webapp.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create a regcred secret form values
*/}}
{{- define "imagePullSecret" }}
{{- with .Values.imageCredentials }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" .registry .username .password .email (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- end }}

{{/*
Return Laravel APP_KEY
*/}}
{{- define "laravel.app_key" -}}
{{- if not (empty .Values.secrets.webapp.APP_KEY) -}}
    {{- .Values.secrets.webapp.APP_KEY -}}
{{- else -}}
    {{"base64:"}} {{- randAlphaNum 32 | b64enc -}}
{{- end -}}
{{- end -}}


{{/*
Detect if `.Values.tags.production` or `.Values.tags.staging` is set
Returns true if it is a boolean,
Return false in any other case.
*/}}
{{- define "prodstaging" -}}
{{- $prodValue := and (hasKey .Values.tags "production") (kindIs "bool" .Values.tags.production)  }}
{{- $stagingValue := and (hasKey .Values.tags "staging") (kindIs "bool" .Values.tags.staging)  }}
{{- if or $prodValue $stagingValue }}
{{- (or .Values.tags.production .Values.tags.staging) }}
{{- end }}
{{- end }}


{{/*
Return if environment is staging or production
*/}}
{{- define "dynamiclocal" -}}
{{- $dynamicValue := and (hasKey .Values.tags "dynamic") (kindIs "bool" .Values.tags.dynamic)  }}
{{- $localValue := and (hasKey .Values.tags "local") (kindIs "bool" .Values.tags.local)  }}
{{- if or $dynamicValue $localValue }}
{{- (or .Values.tags.dynamic .Values.tags.local) }}
{{- end -}}
{{- end }}

{{/*
Return the appropriate apiVersion for networkpolicy.
*/}}
{{- define "networkPolicy.apiVersion" -}}
{{- if semverCompare ">=1.14, <1.19" .Capabilities.KubeVersion.GitVersion -}}
{{- print "networking.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "networking.k8s.io/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Return Image Tag
*/}}
{{- define "imageTag" -}}
{{- if not (empty .Values.imageTag) -}}
    {{- .Values.imageTag -}}
{{- else -}}
    {{- .Chart.AppVersion -}}
{{- end -}}
{{- end -}}
