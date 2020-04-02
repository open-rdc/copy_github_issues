require "octokit"

source_repository      = "source_organization/source_repository"
destination_repository = "destination_organization/destination_repository"

client = Octokit::Client.new login: "username", password: "password"
client.auto_paginate = true

options = {
  state: :all,
}

issues_rev = client.list_issues source_repository, options
issues = issues_rev.reverse

issues.each.with_index(1) do |issue, index|
  p "#{issue.number} #{issue.title}"
  client.create_issue(destination_repository, issue.title, issue.body)
  comments = client.issue_comments source_repository, issue.number, options
  comments.each.with_index(1) do |comment, index|
    p "#{comment.body}"
    client.add_comment(destination_repository, issue.number, comment.body)
    sleep(3)
  end
end

