param (
    $SourceTag
)

# Configure Git user information
git config --global user.name 'Anilathmacloudeqs' 
git config --global user.email 'anilathma@cloudeqs.com'
git config pull.rebase false

# List Git configuration settings and branches
git config --list
git branch

# List Git tags
Write-Host "Testing the git tag list"
git tag

# Pull changes from the specified tag (assuming the tag exists)
Write-Host "##change Executing git pull on $($SourceTag)"
git pull origin $SourceTag --allow-unrelated-histories

# Get the commit ID for the specified file at the tag
Write-Host "Getting commit ID for $($SourceTag)"
$commitid = git log -n 1 --pretty=format:"%H" --grep="$SourceTag" -- main.py

# Print the commit ID
Write-Host "Commit ID for main.py with tag $SourceTag: $commitid"

# Store the commit ID as a GitHub Environment variable
echo "COMMIT_ID=$commitid" >> $env:GITHUB_ENV


#$commitid = (git log -n 1 $SourceTag)[0].split(" ")[-1]
$commitid = git log -n 1 $SourceTag


#echo "COMMIT_ID=$commitid" >> $GITHUB_ENV
#echo "::set-output name=COMMIT_ID::$commitid"
echo "COMMIT_ID=$commitid" >> $env:GITHUB_ENV
