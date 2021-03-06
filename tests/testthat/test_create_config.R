test_that("create_config builds a valid json file.", {
  temp_dir <- file.path(tempdir(), "utils")
  if (!dir.exists(temp_dir)) dir.create(temp_dir)
  file.create(file.path(temp_dir, "config.cfg"))

  create_config("myapp", dirname(temp_dir),
                pkgs = c("jsonlite", "shiny", "magrittr"))
  config <- jsonlite::fromJSON(file.path(tempdir(), 'utils/config.cfg'))

  expect_is(config, 'list')
})

test_that("create_config accepts only bitbucket and github repos.", {
  expect_error(create_config("myapp", "3.3.2", "app", pkgs = c("jsonlite", "shiny", "magrittr"), app_repo_url = "www.myrepo.com"))
})
