# Github Action to Create a Release

The TierraOS Release Creator creates a release when it finds
a specific keyword in the commit message.

## Environment Variables
- `EXTREME_GITHUB_TOKEN` *(Required)* - Allows the action to
  authenticate with Github to create the release

## Arguments
- User specified keyword *(Required)* - The keyword whic, if found 
  in the commit message, triggers release creation. This is case
  insensitive, but uppercase with underscores is recommended.

## Example
Here is an example that uses the TierraOS Release Creator action.
It is triggered by a `PUSH` event and looks for the keyword
`CREATE_RELEASE`.

```
name: release-creator
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: automate6500/github-actions-ch5@main
      env:
        EXTREME_GITHUB_TOKEN ${{ secrets.EXTREME_GITHUB_TOKEN }}
      with:
        args: 'CREATE_RELEASE'
```
