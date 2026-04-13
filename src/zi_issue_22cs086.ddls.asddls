@EndUserText.label: 'Enterprise Issue Tracking Interface'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define root view entity ZI_ISSUE_22CS086
  as select from zissue_22cs086
{
  @EndUserText.label: 'Issue ID'
  key issue_id,

  @EndUserText.label: 'Title'
  title,

  @EndUserText.label: 'Description'
  description,

  @EndUserText.label: 'Issue Type'
  issue_type,

  @EndUserText.label: 'Category'
  category,

  @EndUserText.label: 'Status'
  status,

  @EndUserText.label: 'Priority'
  priority,

  @EndUserText.label: 'Severity'
  severity,

  @EndUserText.label: 'Reporter'
  reporter,

  @EndUserText.label: 'Assignee'
  assignee,

  @EndUserText.label: 'Created By'
  created_by,

  @EndUserText.label: 'Created Date'
  created_on,

  @EndUserText.label: 'Created Time'
  created_time,

  @EndUserText.label: 'Updated By'
  updated_by,

  @EndUserText.label: 'Updated Date'
  updated_on,

  @EndUserText.label: 'Updated Time'
  updated_time,

  @EndUserText.label: 'Due Date'
  due_date,

  @EndUserText.label: 'Resolution'
  resolution,

  @EndUserText.label: 'Workflow Status'
  workflow_status
}
