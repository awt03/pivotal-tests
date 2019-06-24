Feature: tasks
Background: precondition
  Given I start a connection with the API
    And I log in as user 1
    And I send a POST request to projects with data
    '''
    {"name": "(prefix)_project_(current_date_time)"}
    '''
    And I send a POST request to stories with data
    '''
    {"name": "(prefix)_story_(current_date_time)"}
    '''

#  Basic operations
  Scenario: Task POST
     When I send a POST request to tasks with data
    '''
    {"description": "(prefix)_task_(current_date_time)"}
    '''
     Then I expect status code is 200
      And I expect the single response contains
      '''
      {"description": "(prefix)_task_(current_date_time)"}
      '''
	  And I expect the response id is not null

  Scenario: Task DELETE
     When I send a POST request to tasks with data
          '''
          {"description": "(prefix)_task_(current_date_time)"}
          '''
      And I send a DELETE request to tasks
     Then I expect status code is 204

  Scenario: Task PUT a new description
     When I send a POST request to tasks with data
          '''
          {"description": "(prefix)_task_(current_date_time)"}
          '''
      And I send a PUT request to tasks with data
          '''
          {"description": "(prefix)_new_description_(current_date_time)"}
          '''
     Then I expect the single response contains
          '''
          {"description": "(prefix)_new_description_(current_date_time)"}
          '''
      And I expect status code is 200

  Scenario: Task GET a task information
     When I send a POST request to tasks with data
          '''
          {"description": "(prefix)_task_(current_date_time)"}
          '''
      And I send a GET request to tasks
     Then I expect the single response contains
          '''
          {"description": "(prefix)_task_(current_date_time)"}
          '''
      And I expect status code is 200

  Scenario: Task GET all tasks in story
     When I send a GET request to tasks
     Then I expect the response is a list
      And I expect status code is 200
