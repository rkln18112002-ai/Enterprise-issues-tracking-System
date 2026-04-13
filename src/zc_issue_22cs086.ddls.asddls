@EndUserText.label: 'Issue Projection View'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define root view entity ZC_ISSUE_22CS086
  as projection on ZI_ISSUE_22CS086
{
  key issue_id,
      title,
      description,
      issue_type,
      category,
      status,
      priority,
      severity,
      reporter,
      assignee,
      created_by,
      created_on,
      created_time,
      updated_by,
      updated_on,
      updated_time,
      due_date,
      resolution,
      workflow_status
}
