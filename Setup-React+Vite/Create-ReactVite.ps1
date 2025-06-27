Add-Type -AssemblyName System.Windows.Forms

# プロジェクト名を入力
$projectName = Read-Host "プロジェクト名を入力してください"

# フォルダー選択ダイアログ
$dialog = New-Object System.Windows.Forms.FolderBrowserDialog
$dialog.Description = "展開するフォルダを選択してください"

if ($dialog.ShowDialog() -eq "OK") {
    $targetDir = $dialog.SelectedPath
    Write-Output "選択されたフォルダ: $targetDir"
} else {
    Write-Output "フォルダが選択されていません。終了します。"
    exit
}

# 移動
Set-Location -Path $targetDir

# Vite + React プロジェクトを作成
Write-Output "プロジェクト $projectName を作成します..."
npm create vite@latest $projectName -- --template react

if (!$?) {
    Write-Output "プロジェクト作成に失敗しました。"
    exit
}

# プロジェクトフォルダに移動
Set-Location -Path (Join-Path $targetDir $projectName)

# 依存関係インストール
Write-Output "依存関係をインストールします..."
npm install

# VSCode がインストールされているか確認
if (Get-Command code -ErrorAction SilentlyContinue) {
    Write-Output "VSCode を起動します..."
    code .
} else {
    Write-Output "VSCode のコマンドが見つかりません。手動でフォルダを開いてください。"
}

Write-Output "✅ 完了！"
Write-Output "cd '$targetDir\$projectName' で移動して npm run dev で開始できます。"