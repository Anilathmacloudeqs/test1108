param (
    # Name of the Source Tag
    $SourceTag
)

git config --global user.name 'Anilathmacloudeqs' 
git config --global user.email 'anilathma@cloudeqs.com'
git config pull.rebase false 
git config --list
git branch

Write-Host "Testing the git tag list"
git tag
Write-Host "Testing after git tag"

Write-Host "## Change: Executing git pull on $($SourceTag)"
git pull origin $SourceTag --allow-unrelated-histories

Write-Host "Getting commit id for $($SourceTag)"
$commitid = git log -n 1 --pretty=format:"%H"
Write-Host "Commit ID: $commitid"

# Print the commit ID to check if it's being captured
Write-Host "COMMIT_ID=$commitid"

# Set the COMMIT_ID as an environment variable
echo "COMMIT_ID=$commitid" >> $env:GITHUB_ENV
