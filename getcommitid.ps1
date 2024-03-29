param (
    # Name of the Source Tag
    $SourceTag
)
git config --global user.name 'Anilathmacloudeqs' 
git config --global user.email 'anilathma@cloudeqs.com'
git config pull.rebase false 
git config --list
git branch
Write-Host "testing the git tag list"
git tag
Write-Host "testing after git tag"
Write-Host "##change Executing git pull on $($SourceTag)"
git pull origin $SourceTag --allow-unrelated-histories
#git checkout $SourceTag

Write-Host "getting commit id for $($SourceTag)"
git log -n 1 

$commitid = (git log -n 1 )[0].split(" ")[-1]


git log -n 1 

#$commitid = (git log -n 1 $SourceTag)[0].split(" ")[-1]
$commitid = git log -n 1 $SourceTag


#echo "COMMIT_ID=$commitid" >> $GITHUB_ENV
#echo "::set-output name=COMMIT_ID::$commitid"
echo "COMMIT_ID=$commitid" >> $env:GITHUB_ENV
