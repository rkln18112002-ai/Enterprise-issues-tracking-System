CLASS lhc_ZI_ISSUE_22CS086 DEFINITION
  INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations
      FOR zi_issue_22cs086 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zi_issue_22cs086.

    METHODS create FOR MODIFY
  IMPORTING entities FOR CREATE zi_issue_22cs086.
    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi_issue_22cs086.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_issue_22cs086.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_issue_22cs086 RESULT result.

ENDCLASS.
CLASS lhc_ZI_ISSUE_22CS086 IMPLEMENTATION.

  METHOD lock.
  ENDMETHOD.


  METHOD get_instance_authorizations.

    result = VALUE #(
      FOR key IN keys (
        %tky = key-%tky
      )
    ).

  ENDMETHOD.


 METHOD create.

  DATA lv_issue TYPE n LENGTH 10.
  DATA ls_issue TYPE zissue_22cs086.

  LOOP AT entities INTO DATA(entity).

    SELECT MAX( issue_id )
      FROM zissue_22cs086
      INTO @lv_issue.

    lv_issue = lv_issue + 1.

    CLEAR ls_issue.

    ls_issue-mandt          = sy-mandt.
    ls_issue-issue_id       = lv_issue.
    ls_issue-title          = entity-%data-title.
    ls_issue-description    = entity-%data-description.
    ls_issue-issue_type     = entity-%data-issue_type.
    ls_issue-category       = entity-%data-category.
    ls_issue-status         = entity-%data-status.
    ls_issue-priority       = entity-%data-priority.
    ls_issue-severity       = entity-%data-severity.
    ls_issue-reporter       = entity-%data-reporter.
    ls_issue-assignee       = entity-%data-assignee.
    ls_issue-due_date       = entity-%data-due_date.
    ls_issue-workflow_status = entity-%data-workflow_status.

    ls_issue-created_by     = sy-uname.
    ls_issue-created_on     = sy-datum.

    INSERT zissue_22cs086 FROM @ls_issue.

  ENDLOOP.

ENDMETHOD.

  METHOD update.

    LOOP AT entities INTO DATA(entity).

      UPDATE zissue_22cs086
        SET title       = @entity-%data-title,
            description = @entity-%data-description,
            status      = @entity-%data-status,
            priority    = @entity-%data-priority
        WHERE issue_id = @entity-%data-issue_id.

    ENDLOOP.

  ENDMETHOD.


  METHOD delete.

    LOOP AT keys INTO DATA(key).

      DELETE FROM zissue_22cs086
        WHERE issue_id = @key-issue_id.

    ENDLOOP.

  ENDMETHOD.


 METHOD read.

    IF keys IS INITIAL.
      RETURN.
    ENDIF.

    SELECT *
      FROM zissue_22cs086
      FOR ALL ENTRIES IN @keys
      WHERE issue_id = @keys-issue_id
      INTO CORRESPONDING FIELDS OF TABLE @result.

  ENDMETHOD.

ENDCLASS.
