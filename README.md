# copy_github_issues

This script copies issues from the source repository to the destination repository on GitHub.  
The issue of the destination repository must be empty.

### prepare

gem install octokit

### copy issues

1) create a new repository
2) modify the script  
source_repository  
destination_repository (the new repository)  
login name  
password  
3) execute the script
ruby copy_github_issues.rb

[caution] Confirm the repository name carefully.
