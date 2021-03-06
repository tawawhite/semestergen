:nofooter:
{{- range $key, $value := .Assignments}}
{{- range $value.Links}}
:{{.Slug}}: link:{{.URL}}
{{- end}}
{{- end}}

[%header,format=psv,cols="^20h,^20h,<60d"]
|===
| Given  | Due Date    | Assignment
{{range $key, $value := .Assignments}}
|  {{getDate $value.Assigned $value.AssignedDate}}   | {{getDate $value.Due $value.DueDate}}   | {{$value.Title}}: {{range $idx, $el := $value.Links}}{{if $idx}}; {{end}}{{$el.Slug | printf "{%s}"}}[{{$el.Title}}]{{end}}
{{end}}
|===

{{if .ICalLink }}
These events are in a public calendar you may add to your own calendar software: link:{{.ICalLink}}[Published iCal Link]
{{end}}
