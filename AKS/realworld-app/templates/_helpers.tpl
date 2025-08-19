{{/*
Return the fully qualified name of the release
*/}}
{{- define "my-nginx.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return the name of the chart
*/}}
{{- define "my-nginx.name" -}}
{{- .Chart.Name -}}
{{- end }}
