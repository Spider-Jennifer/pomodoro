$raw = [Console]::In.ReadToEnd()
if (-not $raw) {
    return ""
}
$data = $raw | ConvertFrom-Json
$cwd = $data.workspace.current_dir
$model = $data.model.display_name
$used = if ($data.context_window.used_percentage) {
    [math]::Round($data.context_window.used_percentage, 0)
} else {
    0
}
"$cwd  |  $model  |  Context: ${used}%"
