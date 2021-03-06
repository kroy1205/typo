Feature: Article Merging
  As a blog administrator
  In order to consolidate similar articles
  I want to be able to combine different articles into one

  Background:
    Given the blog is set up
    And I am logged into the admin panel

    And the following articles exist:
    | id | allow_comments | type    | body     | author  | title | published |
    | 3  | true           | Article | Content0 | Author0 | Test0 | true      |
    | 4  | true           | Article | Content1 | Author1 | Test1 | true      |

    

  Scenario: Successfully merge two articles
    Given I am on the edit page for the article with ID 3
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Articles were successfully merged together"
    Then I should see "Test0"
    When I follow "Test0"
    Then I should see "Content0"
    And I should see "Content1"
