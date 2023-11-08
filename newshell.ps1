git config --global user.name 'Anilathmacloudeqs' 
git config --global user.email 'anilathma@cloudeqs.com'
git config pull.rebase false 
git config --list
git branch
Write-Host "testing the git tag list"
git tag
Write-Host "testing after git tag"
Write-Host "##change Executing git pull on $($env:SourceTag)"
git pull origin $env:SourceTag --allow-unrelated-histories

Write-Host "getting commit id for $($env:SourceTag)"
$commitid = (git log -n 1 --pretty=format:"%H")

Write-Host "Commit ID: $commitid"

# Set the commit id as an environment variable
$env:COMMIT_ID = $commitid
