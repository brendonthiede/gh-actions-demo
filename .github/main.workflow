workflow "Just Build It" {
  on = "push"
  resolves = ["Build the app"]
}

action "Install npm dependencies" {
  uses = "actions/npm@master"
  args = "ci"
}

action "Lint the code" {
  uses = "actions/npm@master"
  needs = ["Install npm dependencies"]
  args = "run lint"
}

action "Build the app" {
  uses = "actions/npm@master"
  needs = ["Lint the code"]
  args = "run build"
}
