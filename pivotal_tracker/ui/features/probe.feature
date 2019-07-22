Feature: Create projects
  Background: preconditions
    Given I login the app as owner

  Scenario: Verify that new projects are displayed correctly
    When I create a project with
        | key           | value                                |
        | project_name  | (prefix)_project_(current_date_time) |
        | account       | (prefix)_account                     |
        | privacy       | public                               |
    Then I verify project_name is displayed on header_name
    And I go to ProjectMain->More
    #And I verify project settings were created according to characteristics
    And I modify project settings with
      | key          | value |
      | enable_tasks | true  |
    And I go to ProjectMain->Stories
    #And I verify project_name is displayed on projects_dashboard
    #And I go to AllProjects
    #And I verify project_name is displayed on projects_list
