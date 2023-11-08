param (
    $SourceTag
)

git config --global user.name 'Anilathmacloudeqs' 
git config --global user.email 'anilathma@cloudeqs.com'
git config pull.rebase false

git config --list
git branch

Write-Host "Testing the git tag list"
git tag

Write-Host "##change Executing git pull on $($SourceTag)"
git pull origin $SourceTag --allow-unrelated-histories

Write-Host "Getting commit ID for $($SourceTag)"
$commitid = git log -n 1 --pretty=format:"%H" --grep="$SourceTag" -- main.py

Write-Host "Commit ID for main.py with tag $($SourceTag): $commitid"

echo "COMMIT_ID=$commitid" >> $env:GITHUB_ENV
