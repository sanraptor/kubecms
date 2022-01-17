{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if eq $name .Release.Name -}}
  {{- $name | trunc 63 | trimSuffix "-" -}}
{{- else -}}  
  {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "docker-image" -}}
{{- if hasKey .Values "dockerSha" -}}
  {{- printf "%s@%s" .Values.dockerImage .Values.dockerSha | quote -}}
{{- else if hasKey .Values "dockerTag" -}}
  {{- printf "%s:%s" .Values.dockerImage .Values.dockerTag | quote -}}
{{- else -}}  
  {{- printf "%s:latest" .Values.dockerImage | quote -}} 
{{- end -}}
{{- end -}}