// DTOs for Redmine API
// - Redmine exposes some of its data through a REST API. This API provides
// access and basic CRUD operations (create, update, delete) for the resources
// described below. The API supports both XML and JSON formats.
// - version 3.5
unit openapi.dto;

{$I mormot.defines.inc}

interface

{
  ----------------------------------------------------------------------
  REDMINE API DTOs

  Generated 29 Apr 2025 by via mopenapi - DO NOT MODIFY BY HAND!
  ----------------------------------------------------------------------
}

uses
  classes,
  sysutils,
  mormot.core.base,
  mormot.core.rtti,
  mormot.core.json;

type

{ ************ Enumerations and Sets }

  TEnumOpenapi1 = (
    eoNone, eoAll, eoNone2, eoOnlyAssigned, eoOnlyMyEvents, eoOnlyOwner, eoSelected);
  TEnumOpenapi2 = (
    eo2None, eo2Asc, eo2Desc);
  TEnumOpenapi3 = (
    eo3None, eo3Monospace, eo3Proportional);
  TEnumOpenapi4 = (
    eo4None, eo4Changesets, eo4History, eo4LastTabVisited, eo4Notes, eo4Properties,
    eo4TimeEntries);
  TEnumOpenapi5 = (
    eo5None, eo5Document, eo5DocumentCategory, eo5Group, eo5Issue, eo5IssuePriority,
    eo5Project, eo5TimeEntry, eo5TimeEntryActivity, eo5User, eo5Version);
  TEnumOpenapi6 = (
    eo6None, eo6Attachment, eo6Bool, eo6Date, eo6Enumeration, eo6Float, eo6Int,
    eo6Link, eo6List, eo6String, eo6Text, eo6User, eo6Version);
  TEnumOpenapi7 = (
    eo7None, eo7Blocked, eo7Blocks, eo7CopiedFrom, eo7CopiedTo, eo7Duplicated,
    eo7Duplicates, eo7Follows, eo7Precedes, eo7Relates);
  TEnumOpenapi8 = (
    eo8None, eo8Boards, eo8Calendar, eo8Documents, eo8Files, eo8Gantt, eo8IssueTracking,
    eo8News, eo8Repository, eo8TimeTracking, eo8Wiki);
  TEnumOpenapi8Set = set of TEnumOpenapi8;
  TEnumOpenapi9 = (
    eo9None, eo9Closed, eo9Locked, eo9Open);
  TEnumOpenapi10 = (
    eo10None, eo10Descendants, eo10Hierarchy, eo10None3, eo10System, eo10Tree);
  TEnumOpenapi11 = (
    eo11None, eo11Csv, eo11Json, eo11Xml);
  TEnumOpenapi12 = (
    eo12None, eo12Attachments, eo12Relations);
  TEnumOpenapi12Set = set of TEnumOpenapi12;
  TEnumOpenapi13 = (
    eo13None, eo131, eo132);
  // allowed_statuses - Since 5.0.x, Returns the available allowed statuses (the
  // same values as provided in the issue edit form) based on:
  // * the issue's current tracker, the issue's current status, and the member's
  // role (the defined workflow);
  // * the existence of any open subtask(s);
  // * the existence of any open blocking issue(s);
  // * the existence of a closed parent issue.
  TEnumOpenapi14 = (
    eo14None, eo14AllowedStatuses, eo14Attachments, eo14Changesets, eo14Children,
    eo14Journals, eo14Relations, eo14Watchers);
  TEnumOpenapi14Set = set of TEnumOpenapi14;
  TEnumOpenapi15 = (
    eo15None, eo15Memberships, eo15Users);
  TEnumOpenapi15Set = set of TEnumOpenapi15;
  TEnumOpenapi16 = (
    eo16None, eo160, eo161, eo162, eo163);
  // memberships - adds extra information about user's memberships and roles on
  // the projects
  // groups - adds extra information about user's groups
  TEnumOpenapi17 = (
    eo17None, eo17Groups, eo17Memberships);
  TEnumOpenapi17Set = set of TEnumOpenapi17;
  TEnumOpenapi18 = (
    eo18None, eo18DocumentCategories, eo18IssuePriorities, eo18TimeEntryActivities);
  TEnumOpenapi19 = (
    eo19None, eo19EnabledModules, eo19IssueCategories, eo19IssueCustomFields,
    eo19TimeEntryActivities, eo19Trackers);
  TEnumOpenapi19Set = set of TEnumOpenapi19;
  // 'search all projects', 'search assigned projects', 'include subproject when
  // project specified'
  TEnumOpenapi20 = (
    eo20None, eo20All, eo20MyProject, eo20Subprojects);


{ ************ Data Transfert Objects }

  // from #/components/schemas/IdName
  TIdName = packed record
    Id: integer;
    Name: string;
  end;
  PIdName = ^TIdName;
  TIdNameDynArray = array of TIdName;

  // from #/components/schemas/Attachment
  TAttachment = packed record
    Id: integer;
    Filename: string;
    Filesize: integer;
    ContentType: string;
    Description: string;
    ContentUrl: string;
    Author: TIdName;
    CreatedOn: TDateTime;
  end;
  PAttachment = ^TAttachment;
  TAttachmentDynArray = array of TAttachment;

  // from #/components/schemas/CustomField
  TCustomField = packed record
    Id: integer;
    Name: string;
    Multiple: boolean;
    Value: variant;
  end;
  PCustomField = ^TCustomField;
  TCustomFieldDynArray = array of TCustomField;

  // from #/components/schemas/FieldValue
  TFieldValue = packed record
    Name: string;
    Value: string;
  end;
  PFieldValue = ^TFieldValue;

  TDtoOpenapi1 = packed record
    Login: string;
    Admin: boolean;
    Password: string;
    Firstname: string;
    Lastname: string;
    Mail: string;
    Language: string;
    AuthSourceId: integer;
    MailNotification: TEnumOpenapi1;
    NotifiedProjectIds: TIntegerDynArray;
    MustChangePasswd: boolean;
    GeneratePassword: boolean;
    // a numeric id representing the status of the user, visible for admins only (added
    // in 2.4.0). STATUS_ANONYMOUS = 0; STATUS_ACTIVE=1; STATUS_REGISTERED=2; STATUS_LOCKED=3
    Status: integer;
    CustomFields: TCustomFieldDynArray;
    CustomFieldValues: TFieldValue;
    GroupIds: TIntegerDynArray;
  end;
  PDtoOpenapi1 = ^TDtoOpenapi1;

  TDtoOpenapi2 = packed record
    HideMail: boolean;
    TimeZone: string;
    CommentsSorting: TEnumOpenapi2;
    WarnOnLeavingUnsaved: boolean;
    NoSelfNotified: boolean;
    NotifyAboutHighPriorityIssues: boolean;
    TextareaFont: TEnumOpenapi3;
    RecentlyUsedProjects: integer;
    HistoryDefaultTab: TEnumOpenapi4;
    ToolbarLanguageOptions: string;
    DefaultIssueQuery: integer;
    DefaultProjectQuery: integer;
    AutoWatchOn: string;
  end;
  PDtoOpenapi2 = ^TDtoOpenapi2;

  // from #/components/schemas/AccountUpdate
  TAccountUpdate = packed record
    User: TDtoOpenapi1;
    Pref: TDtoOpenapi2;
  end;
  PAccountUpdate = ^TAccountUpdate;

  TDtoOpenapi3 = packed record
    Id: integer;
    Login: string;
    Admin: boolean;
    Firstname: string;
    Lastname: string;
    Mail: string;
    CreatedOn: TDateTime;
    LastLoginOn: TDateTime;
    ApiKey: string;
    CustomFields: TCustomFieldDynArray;
  end;
  PDtoOpenapi3 = ^TDtoOpenapi3;

  // from #/components/schemas/AccountShow
  TAccountShow = packed record
    User: TDtoOpenapi3;
  end;
  PAccountShow = ^TAccountShow;

  // from #/components/schemas/ChangeSet
  TChangeSet = packed record
    Revision: string;
    User: TIdName;
    Comments: string;
    CommittedOn: string;
  end;
  PChangeSet = ^TChangeSet;
  TChangeSetDynArray = array of TChangeSet;

  // from #/components/schemas/CheckList
  TCheckList = packed record
    Id: integer;
    IssueId: integer;
    Subject: string;
    IsDone: boolean;
    Position: integer;
    IsSection: boolean;
    CreatedAt: string;
    UpdatedAt: string;
  end;
  PCheckList = ^TCheckList;
  TCheckListDynArray = array of TCheckList;

  // from #/components/schemas/CheckListList
  TCheckListList = packed record
    Checklists: TCheckListDynArray;
    TotalCount: integer;
  end;
  PCheckListList = ^TCheckListList;

  TDtoOpenapi4 = packed record
    IssueId: integer;
    Subject: string;
    // 'yes|no... field position low row was removed'
    IsDone: boolean;
  end;
  PDtoOpenapi4 = ^TDtoOpenapi4;

  // from #/components/schemas/CheckListNew
  TCheckListNew = packed record
    Checklist: TDtoOpenapi4;
  end;
  PCheckListNew = ^TCheckListNew;

  // from #/components/schemas/CheckListUpdate
  TCheckListUpdate = packed record
    Checklist: TCheckList;
  end;
  PCheckListUpdate = ^TCheckListUpdate;

  // from #/components/schemas/Child
  TChild = packed record
    Id: integer;
    Tracker: TIdName;
    Status: TIdName;
    Subject: string;
  end;
  PChild = ^TChild;
  TChildDynArray = array of TChild;

  TDtoOpenapi5 = packed record
    Value: string;
    _Label: string;
  end;
  PDtoOpenapi5 = ^TDtoOpenapi5;
  TDtoOpenapi5DynArray = array of TDtoOpenapi5;

  // from #/components/schemas/Role
  TRole = packed record
    Id: integer;
    Name: string;
    Assignable: boolean;
    IssuesVisibility: string;
    TimeEntriesVisibility: string;
    UsersVisibility: string;
    Permissions: TStringDynArray;
  end;
  PRole = ^TRole;
  TRoleDynArray = array of TRole;

  // from #/components/schemas/CustomFieldShow
  TCustomFieldShow = packed record
    Id: integer;
    Name: string;
    Description: string;
    CustomizedType: TEnumOpenapi5;
    FieldFormat: TEnumOpenapi6;
    Regexp: string;
    MinLength: integer;
    MaxLength: integer;
    IsRequired: boolean;
    IsFilter: boolean;
    Searchable: boolean;
    Multiple: boolean;
    DefaultValue: string;
    Visible: boolean;
    PossibleValues: TDtoOpenapi5DynArray;
    Trackers: TIdNameDynArray;
    Roles: TRoleDynArray;
  end;
  PCustomFieldShow = ^TCustomFieldShow;
  TCustomFieldShowDynArray = array of TCustomFieldShow;

  // from #/components/schemas/CustomFieldsList
  TCustomFieldsList = packed record
    CustomFields: TCustomFieldShowDynArray;
  end;
  PCustomFieldsList = ^TCustomFieldsList;

  // from #/components/schemas/Detail
  TDetail = packed record
    _Property: string;
    Name: string;
    OldValue: string;
    NewValue: string;
  end;
  PDetail = ^TDetail;
  TDetailDynArray = array of TDetail;

  // from #/components/schemas/Enum
  TEnum = packed record
    Id: integer;
    Name: string;
    IsDefault: boolean;
  end;
  PEnum = ^TEnum;
  TEnumDynArray = array of TEnum;

  // from #/components/schemas/EnumList
  TEnumList = packed record
    TimeEntryActivities: TEnumDynArray;
    DocumentCategories: TEnumDynArray;
    IssuePriorities: TEnumDynArray;
  end;
  PEnumList = ^TEnumList;

  // from #/components/schemas/Forbidden
  TForbidden = packed record
    // Короткий идентификатор, соответствующий
    // возвращаемому коду состояния HTTP.
    // - Example: 403
    StatusCode: double;
    // Сообщение, предоставляющее дополнительную
    // информацию об ошибке, в том числе сведения,
    // помогающие устранить ее, когда это возможно.
    // - Example: "Forbidden"
    Message: variant;
    // Краткое описание ошибки HTTP на основе статуса.
    // - Example: "forbidden"
    ErrorCode: string;
  end;
  PForbidden = ^TForbidden;

  // from #/components/schemas/Group
  TGroup = packed record
    Id: integer;
    Name: string;
  end;
  PGroup = ^TGroup;
  TGroupDynArray = array of TGroup;

  // from #/components/schemas/GroupList
  TGroupList = packed record
    Groups: TGroupDynArray;
  end;
  PGroupList = ^TGroupList;

  TDtoOpenapi6 = packed record
    Name: string;
    UserIds: TIntegerDynArray;
  end;
  PDtoOpenapi6 = ^TDtoOpenapi6;

  // from #/components/schemas/GroupNew
  TGroupNew = packed record
    Group: TDtoOpenapi6;
  end;
  PGroupNew = ^TGroupNew;

  // from #/components/schemas/RoleMini
  TRoleMini = packed record
    Id: integer;
    Name: string;
    _Inherited: boolean;
  end;
  PRoleMini = ^TRoleMini;
  TRoleMiniDynArray = array of TRoleMini;

  // from #/components/schemas/MemberShip
  TMemberShip = packed record
    Id: integer;
    Project: TIdName;
    User: TIdName;
    Group: TIdName;
    Roles: TRoleMiniDynArray;
  end;
  PMemberShip = ^TMemberShip;
  TMemberShipDynArray = array of TMemberShip;

  TDtoOpenapi7 = packed record
    Id: integer;
    Name: string;
    Users: TIdNameDynArray;
    Memberships: TMemberShipDynArray;
  end;
  PDtoOpenapi7 = ^TDtoOpenapi7;

  // from #/components/schemas/GroupShow
  TGroupShow = packed record
    Group: TDtoOpenapi7;
  end;
  PGroupShow = ^TGroupShow;

  TDtoOpenapi9 = packed record
    Name: string;
    UserIds: TIntegerDynArray;
  end;
  PDtoOpenapi9 = ^TDtoOpenapi9;

  // from #/components/schemas/GroupUpdate
  TGroupUpdate = packed record
    Group: TDtoOpenapi9;
  end;
  PGroupUpdate = ^TGroupUpdate;

  // from #/components/schemas/IssueStatus
  TIssueStatus = packed record
    Id: integer;
    Name: string;
    IsClosed: boolean;
    Description: string;
  end;
  PIssueStatus = ^TIssueStatus;
  TIssueStatusDynArray = array of TIssueStatus;

  TDtoOpenapi10 = packed record
    IsDone: boolean;
    Subject: string;
  end;
  PDtoOpenapi10 = ^TDtoOpenapi10;
  TDtoOpenapi10DynArray = array of TDtoOpenapi10;

  // from #/components/schemas/Relation
  TRelation = packed record
    Id: integer;
    IssueId: integer;
    // the id of the related issue
    IssueToId: integer;
    RelationType: TEnumOpenapi7;
    // 'the delay for a 'precedes' or 'follows' relation'
    Delay: integer;
    // for rtti
    Empty: string;
  end;
  PRelation = ^TRelation;
  TRelationDynArray = array of TRelation;

  // from #/components/schemas/Journal
  TJournal = packed record
    Id: integer;
    User: TIdName;
    Notes: string;
    CreatedOn: string;
    UpdatedOn: string;
    // Setting the target version to 6.0.0.
    UpdatedBy: TIdName;
    PrivateNotes: boolean;
    Details: TDetailDynArray;
  end;
  PJournal = ^TJournal;
  TJournalDynArray = array of TJournal;

  // from #/components/schemas/Upload
  TUpload = packed record
    Token: string;
    Filename: string;
    Description: string;
    ContentType: string;
  end;
  PUpload = ^TUpload;
  TUploadDynArray = array of TUpload;

  // from #/components/schemas/Issue
  TIssue = packed record
    Id: integer;
    // Project Id or identifier of issue’s project,maybe string
    Project: TIdName;
    Tracker: TIdName;
    Status: TIssueStatus;
    Priority: TIdName;
    Author: TIdName;
    // 'ID of the user to assign the issue to (currently no mechanism to assign by
    // name)'
    AssignedTo: TIdName;
    Category: TIdName;
    // 'Оперативный план. ID of the Target Versions (previously called
    // 'Fixed Version' and still referred to as such in the API)'
    FixedVersion: TIdName;
    // 'ID of the parent issue'
    // Name not used, need fo pascal code
    Parent: TIdName;
    Subject: string;
    Description: string;
    // 'Issue start date'
    StartDate: string;
    // 'Issue end date'
    DueDate: string;
    // 'Issue done ratio'
    DoneRatio: integer;
    // 'Use true or false to indicate whether the issue is private or not'
    IsPrivate: boolean;
    // 'Number of hours estimated for issue'
    EstimatedHours: double;
    // 'Number of hours estimated for parent issues'
    TotalEstimatedHours: double;
    // 'Number of hours spent for issue'
    SpentHours: double;
    // 'Number of hours spent for parent issues'
    TotalSpentHours: double;
    CreatedOn: string;
    UpdatedOn: string;
    // don't know
    ClosedOn: string;
    // Creating issue with a checklist
    ChecklistsAttributes: TDtoOpenapi10DynArray;
    Children: TChildDynArray;
    Attachments: TAttachmentDynArray;
    Relations: TRelationDynArray;
    Changesets: TChangeSetDynArray;
    Journals: TJournalDynArray;
    Watchers: TIdNameDynArray;
    AllowedStatuses: TIssueStatusDynArray;
    CustomFields: TCustomFieldDynArray;
    Uploads: TUploadDynArray;
  end;
  PIssue = ^TIssue;
  TIssueDynArray = array of TIssue;

  // from #/components/schemas/IssueList
  TIssueList = packed record
    Issues: TIssueDynArray;
    Offset: integer;
    Limit: integer;
    TotalCount: integer;
  end;
  PIssueList = ^TIssueList;

  TDtoOpenapi11 = packed record
    ProjectId: integer;
    TrackerId: integer;
    StatusId: integer;
    PriorityId: integer;
    // Оперативный план. ID of the Target Versions (previously called
    // "Fixed Version" and still referred to as such in the API)
    FixedVersionId: integer;
    Subject: string;
    Description: string;
    CategoryId: integer;
    // ID of the user to assign the issue to (currently no mechanism to assign by name)
    AssignedToId: integer;
    // ID of the parent issue
    ParentIssueId: integer;
    CustomFields: TCustomFieldDynArray;
    // Array of user ids to add as watchers
    WatcherUserIds: TIntegerDynArray;
    IsPrivate: boolean;
    EstimatedHours: string;
  end;
  PDtoOpenapi11 = ^TDtoOpenapi11;

  // from #/components/schemas/IssueNew
  TIssueNew = packed record
    Issue: TDtoOpenapi11;
  end;
  PIssueNew = ^TIssueNew;

  // from #/components/schemas/IssueShow
  TIssueShow = packed record
    Issue: TIssue;
  end;
  PIssueShow = ^TIssueShow;

  TDtoOpenapi12 = packed record
    ProjectId: integer;
    TrackerId: integer;
    StatusId: integer;
    PriorityId: integer;
    Subject: string;
    Description: string;
    StartDate: string;
    DueDate: string;
    DoneRatio: integer;
    CategoryId: integer;
    // Оперативный план. ID of the Target Versions (previously called
    // "Fixed Version" and still referred to as such in the API)
    FixedVersionId: integer;
    // ID of the user to assign the issue to (currently no mechanism to assign by name)
    AssignedToId: integer;
    // ID of the parent issue
    ParentIssueId: integer;
    CustomFields: TCustomFieldDynArray;
    // Array of user ids to add as watchers
    WatcherUserIds: TIntegerDynArray;
    IsPrivate: boolean;
    EstimatedHours: double;
    // Comments about the update
    Notes: string;
    // true if notes are private
    PrivateNotes: boolean;
    Uploads: TUploadDynArray;
  end;
  PDtoOpenapi12 = ^TDtoOpenapi12;

  // from #/components/schemas/IssueUpdate
  TIssueUpdate = packed record
    Issue: TDtoOpenapi12;
  end;
  PIssueUpdate = ^TIssueUpdate;

  // from #/components/schemas/IssueStatusesList
  TIssueStatusesList = packed record
    IssueStatuses: TIssueStatusDynArray;
  end;
  PIssueStatusesList = ^TIssueStatusesList;

  // from #/components/schemas/IssueCategory
  TIssueCategory = packed record
    Id: integer;
    Project: TIdName;
    Name: string;
    AssignedTo: TIdName;
  end;
  PIssueCategory = ^TIssueCategory;
  TIssueCategoryDynArray = array of TIssueCategory;

  // from #/components/schemas/IssueCategoryList
  TIssueCategoryList = packed record
    IssueCategories: TIssueCategoryDynArray;
    TotalCount: integer;
  end;
  PIssueCategoryList = ^TIssueCategoryList;

  TDtoOpenapi13 = packed record
    Id: integer;
    Project: TIdName;
    Name: string;
    AssignedTo: TIdName;
  end;
  PDtoOpenapi13 = ^TDtoOpenapi13;

  // from #/components/schemas/IssueCategoryShow
  TIssueCategoryShow = packed record
    IssueCategory: TDtoOpenapi13;
  end;
  PIssueCategoryShow = ^TIssueCategoryShow;

  TDtoOpenapi14 = packed record
    Name: string;
    // the id of the user assigned to the category (new issues with this category
    // are assigned by default to this user)
    AssignedTo: variant;
  end;
  PDtoOpenapi14 = ^TDtoOpenapi14;

  // from #/components/schemas/IssueCategoryUpdate
  TIssueCategoryUpdate = packed record
    IssueCategory: TDtoOpenapi14;
  end;
  PIssueCategoryUpdate = ^TIssueCategoryUpdate;

  TDtoOpenapi16 = packed record
    Name: string;
    // the id of the user assigned to the category (new issues with this category
    // are assigned by default to this user)
    AssignedTo: variant;
  end;
  PDtoOpenapi16 = ^TDtoOpenapi16;

  TIssueCategoryNew = packed record
    IssueCategory: TDtoOpenapi16;
  end;
  PIssueCategoryNew = ^TIssueCategoryNew;

  TDtoOpenapi17 = packed record
    Notes: string;
    PrivateNotes: boolean;
  end;
  PDtoOpenapi17 = ^TDtoOpenapi17;

  // from #/components/schemas/JournalUpdate
  TJournalUpdate = packed record
    Journal: TDtoOpenapi17;
  end;
  PJournalUpdate = ^TJournalUpdate;

  // from #/components/schemas/MemberShipList
  TMemberShipList = packed record
    Memberships: TMemberShipDynArray;
    TotalCount: integer;
    Offset: integer;
    Limit: integer;
  end;
  PMemberShipList = ^TMemberShipList;

  TDtoOpenapi18 = packed record
    // an array of roles numerical ids
    RoleIds: TIntegerDynArray;
  end;
  PDtoOpenapi18 = ^TDtoOpenapi18;

  // from #/components/schemas/MemberShipUpdate
  TMemberShipUpdate = packed record
    Memberships: TDtoOpenapi18;
  end;
  PMemberShipUpdate = ^TMemberShipUpdate;

  TDtoOpenapi19 = packed record
    // the numerical id of the user or group
    UserId: integer;
    // an array of roles numerical ids
    RoleIds: TIntegerDynArray;
  end;
  PDtoOpenapi19 = ^TDtoOpenapi19;

  // from #/components/schemas/MemberShipAdd
  TMemberShipAdd = packed record
    Memberships: TDtoOpenapi19;
  end;
  PMemberShipAdd = ^TMemberShipAdd;

  TDtoOpenapi20 = packed record
    // the numerical id of the user or group
    Id: integer;
    Project: TIdName;
    User: TIdName;
    Group: TIdName;
    Roles: TIdNameDynArray;
  end;
  PDtoOpenapi20 = ^TDtoOpenapi20;

  // from #/components/schemas/MemberShipShow
  TMemberShipShow = packed record
    Memberships: TDtoOpenapi20;
  end;
  PMemberShipShow = ^TMemberShipShow;

  // from #/components/schemas/NotAuthorized
  TNotAuthorized = packed record
    // Короткий идентификатор, соответствующий
    // возвращаемому коду состояния HTTP.
    // - Example: 401
    StatusCode: double;
    // Сообщение, предоставляющее дополнительную
    // информацию об ошибке, в том числе сведения,
    // помогающие устранить ее, когда это возможно.
    // - Example: "Unauthorized"
    Message: variant;
    // Краткое описание ошибки HTTP на основе статуса.
    // - Example: "unauthorized"
    ErrorCode: string;
  end;
  PNotAuthorized = ^TNotAuthorized;

  // from #/components/schemas/UnknownError
  TUnknownError = packed record
    Errors: TStringDynArray;
  end;
  PUnknownError = ^TUnknownError;

  // from #/components/schemas/Project
  TProject = packed record
    Id: integer;
    Name: string;
    Identifier: string;
    Description: string;
    Homepage: string;
    Parent: TIdName;
    // 1: status active, 5: status closed, 9: status archived
    Status: integer;
    IsPublic: boolean;
    InheritMembers: boolean;
    CustomFields: TCustomFieldDynArray;
    Trackers: TIdNameDynArray;
    IssueCategories: TIdNameDynArray;
    TimeEntryActivities: TIdNameDynArray;
    EnabledModules: TIdNameDynArray;
    IssueCustomFields: TIdNameDynArray;
    CreatedOn: string;
    UpdatedOn: string;
  end;
  PProject = ^TProject;
  TProjectDynArray = array of TProject;

  // from #/components/schemas/ProjectList
  TProjectList = packed record
    Projects: TProjectDynArray;
    TotalCount: integer;
    Offset: integer;
    Limit: integer;
  end;
  PProjectList = ^TProjectList;

  TDtoOpenapi21 = packed record
    Id: integer;
    Name: string;
    Identifier: string;
    Description: string;
    Homepage: string;
    Parent: TIdName;
    // 1: status active, 5: status closed, 9: status archived
    Status: integer;
    IsPublic: boolean;
    InheritMembers: boolean;
    DefaultVersion: TIdName;
    DefaultAssignee: TIdName;
    CustomFields: TCustomFieldDynArray;
    Trackers: TIdNameDynArray;
    IssueCategories: TIdNameDynArray;
    TimeEntryActivities: TIdNameDynArray;
    EnabledModules: TIdNameDynArray;
    IssueCustomFields: TIdNameDynArray;
    CreatedOn: TDateTime;
    UpdatedOn: TDateTime;
  end;
  PDtoOpenapi21 = ^TDtoOpenapi21;

  // from #/components/schemas/ProjectShow
  TProjectShow = packed record
    Project: TDtoOpenapi21;
  end;
  PProjectShow = ^TProjectShow;

  TDtoOpenapi22 = packed record
    Name: string;
    Identifier: string;
    Description: string;
    Homepage: string;
    IsPublic: boolean;
    // the parent project number
    ParentId: integer;
    // true or false
    InheritMembers: boolean;
    // ID of the default user. It works only when the new project is a subproject
    // and it inherits the members.
    DefaultAssignedToId: integer;
    // ID of the default version. It works only with existing shared versions.
    DefaultVersionId: integer;
    // (repeatable element) the tracker id: 1 for Bug, etc.
    TrackerIds: TIntegerDynArray;
    // (repeatable element) the module name: boards, calendar, documents, files, gantt,
    // issue_tracking, news, repository, time_tracking, wiki.
    EnabledModuleNames: TEnumOpenapi8Set;
    // (repeatable element) issue custom field id.
    IssueCustomFieldIds: TIntegerDynArray;
    CustomFields: TIdNameDynArray;
    CustomFieldValues: TFieldValue;
  end;
  PDtoOpenapi22 = ^TDtoOpenapi22;

  // from #/components/schemas/ProjectNew
  TProjectNew = packed record
    Project: TDtoOpenapi22;
  end;
  PProjectNew = ^TProjectNew;

  TDtoOpenapi23 = packed record
    Name: string;
    Description: string;
    Homepage: string;
    IsPublic: boolean;
    ParentId: integer;
    InheritMembers: boolean;
    DefaultAssignedToId: integer;
    DefaultVersionId: integer;
    TrackerIds: TIntegerDynArray;
    EnabledModuleNames: TStringDynArray;
    IssueCustomFieldIds: TIntegerDynArray;
    CustomFields: TCustomFieldDynArray;
    CustomFieldValues: TFieldValue;
  end;
  PDtoOpenapi23 = ^TDtoOpenapi23;

  // from #/components/schemas/ProjectUpdate
  TProjectUpdate = packed record
    Project: TDtoOpenapi23;
  end;
  PProjectUpdate = ^TProjectUpdate;

  // from #/components/schemas/ResNotFound
  TResNotFound = packed record
    // Короткий идентификатор, соответствующий
    // возвращаемому коду состояния HTTP.
    // - Example: 404
    StatusCode: double;
    // Сообщение, предоставляющее дополнительную
    // информацию об ошибке, в том числе сведения,
    // помогающие устранить ее, когда это возможно.
    // - Example: "Resource not found"
    Message: variant;
    // Краткое описание ошибки HTTP на основе статуса.
    // - Example: "not_found"
    ErrorCode: string;
  end;
  PResNotFound = ^TResNotFound;

  // from #/components/schemas/Query
  TQuery = packed record
    Id: integer;
    Name: string;
    IsPublic: string;
    ProjectId: integer;
  end;
  PQuery = ^TQuery;
  TQueryDynArray = array of TQuery;

  // from #/components/schemas/QueriesList
  TQueriesList = packed record
    Queries: TQueryDynArray;
    TotalCount: integer;
    Limit: integer;
    Offset: integer;
  end;
  PQueriesList = ^TQueriesList;

  // from #/components/schemas/RelationList
  TRelationList = packed record
    Relations: TRelationDynArray;
  end;
  PRelationList = ^TRelationList;

  TDtoOpenapi24 = packed record
    // the id of the related issue
    IssueToId: integer;
    RelationType: TEnumOpenapi7;
    // 'the delay for a 'precedes' or 'follows' relation'
    Delay: integer;
    // for rtti
    Empty: string;
  end;
  PDtoOpenapi24 = ^TDtoOpenapi24;

  // from #/components/schemas/RelationNew
  TRelationNew = packed record
    Relation: TDtoOpenapi24;
  end;
  PRelationNew = ^TRelationNew;

  // from #/components/schemas/RelationShow
  TRelationShow = packed record
    Relation: TRelation;
  end;
  PRelationShow = ^TRelationShow;

  // from #/components/schemas/RolesList
  TRolesList = packed record
    Roles: TIdNameDynArray;
  end;
  PRolesList = ^TRolesList;

  TDtoOpenapi25 = packed record
    Id: integer;
    Name: string;
    Assignable: boolean;
    IssuesVisibility: string;
    TimeEntriesVisibility: string;
    UsersVisibility: string;
    Permissions: TStringDynArray;
  end;
  PDtoOpenapi25 = ^TDtoOpenapi25;

  // from #/components/schemas/RoleShow
  TRoleShow = packed record
    Role: TDtoOpenapi25;
  end;
  PRoleShow = ^TRoleShow;

  // from #/components/schemas/UserAdd
  TUserAdd = packed record
    // id of the user to add as a watcher
    UserId: integer;
    // empty for rtti
    Name: string;
  end;
  PUserAdd = ^TUserAdd;

  // from #/components/schemas/User
  TUser = packed record
    Id: integer;
    Login: string;
    Admin: boolean;
    Firstname: string;
    Lastname: string;
    Mail: string;
    CreatedOn: string;
    UpdatedOn: string;
    LastLoginOn: string;
    PasswdChangedOn: string;
    TwofaScheme: variant;
    CustomFields: TCustomFieldDynArray;
  end;
  PUser = ^TUser;
  TUserDynArray = array of TUser;

  // from #/components/schemas/UserList
  TUserList = packed record
    Users: TUserDynArray;
    TotalCount: integer;
    Offset: integer;
    Limit: integer;
  end;
  PUserList = ^TUserList;

  TDtoOpenapi26 = packed record
    Id: integer;
    Login: string;
    Admin: boolean;
    Firstname: string;
    Lastname: string;
    Mail: string;
    CreatedOn: TDateTime;
    UpdatedOn: TDateTime;
    LastLoginOn: TDateTime;
    PasswdChangedOn: TDateTime;
    TwofaScheme: variant;
    // the API key of the user, visible for admins and for yourself
    ApiKey: string;
    // a numeric id representing the status of the user, visible for admins only (added
    // in 2.4.0). STATUS_ANONYMOUS = 0; STATUS_ACTIVE=1; STATUS_REGISTERED=2; STATUS_LOCKED=3
    Status: integer;
    CustomFields: TCustomFieldDynArray;
    // if include groups
    Groups: TGroupDynArray;
    // if include memberships
    Memberships: TMemberShipDynArray;
  end;
  PDtoOpenapi26 = ^TDtoOpenapi26;

  // from #/components/schemas/UserShow
  TUserShow = packed record
    User: TDtoOpenapi26;
  end;
  PUserShow = ^TUserShow;

  TDtoOpenapi28 = packed record
    Login: string;
    Admin: boolean;
    Password: string;
    Firstname: string;
    Lastname: string;
    Mail: string;
    Language: string;
    AuthSourceId: integer;
    MailNotification: TEnumOpenapi1;
    NotifiedProjectIds: TIntegerDynArray;
    MustChangePasswd: boolean;
    GeneratePassword: boolean;
    Status: integer;
    CustomFields: TCustomFieldDynArray;
    CustomFieldValues: TFieldValue;
    GroupIds: TIntegerDynArray;
  end;
  PDtoOpenapi28 = ^TDtoOpenapi28;

  TDtoOpenapi30 = packed record
    HideMail: boolean;
    TimeZone: string;
    CommentsSorting: TEnumOpenapi2;
    WarnOnLeavingUnsaved: boolean;
    NoSelfNotified: boolean;
    NotifyAboutHighPriorityIssues: boolean;
    TextareaFont: TEnumOpenapi3;
    RecentlyUsedProjects: integer;
    HistoryDefaultTab: TEnumOpenapi4;
    ToolbarLanguageOptions: string;
    DefaultIssueQuery: integer;
    DefaultProjectQuery: integer;
    AutoWatchOn: string;
  end;
  PDtoOpenapi30 = ^TDtoOpenapi30;

  // from #/components/schemas/UserUpdate
  TUserUpdate = packed record
    User: TDtoOpenapi28;
    SendInformation: boolean;
    CustomFields: TCustomFieldDynArray;
    Pref: TDtoOpenapi30;
  end;
  PUserUpdate = ^TUserUpdate;

  TDtoOpenapi31 = packed record
    Login: string;
    Admin: boolean;
    Password: string;
    Firstname: string;
    Lastname: string;
    Mail: string;
    Language: string;
    AuthSourceId: integer;
    // only_my_events, none, etc.
    MailNotification: TEnumOpenapi1;
    NotifiedProjectIds: TIntegerDynArray;
    MustChangePasswd: boolean;
    GeneratePassword: boolean;
    Status: integer;
    CustomFields: TCustomFieldDynArray;
    CustomFieldValues: TFieldValue;
  end;
  PDtoOpenapi31 = ^TDtoOpenapi31;

  TDtoOpenapi33 = packed record
    HideMail: boolean;
    TimeZone: string;
    CommentsSorting: TEnumOpenapi2;
    WarnOnLeavingUnsaved: boolean;
    NoSelfNotified: boolean;
    NotifyAboutHighPriorityIssues: boolean;
    TextareaFont: TEnumOpenapi3;
    RecentlyUsedProjects: integer;
    HistoryDefaultTab: TEnumOpenapi4;
    ToolbarLanguageOptions: string;
    DefaultIssueQuery: integer;
    DefaultProjectQuery: integer;
    AutoWatchOn: string;
  end;
  PDtoOpenapi33 = ^TDtoOpenapi33;

  // from #/components/schemas/UserNew
  TUserNew = packed record
    User: TDtoOpenapi31;
    // Send account information to the user
    SendInformation: boolean;
    Pref: TDtoOpenapi33;
  end;
  PUserNew = ^TUserNew;

  // from #/components/schemas/ValidationError
  TValidationError = packed record
    Errors: TStringDynArray;
  end;
  PValidationError = ^TValidationError;

  // from #/components/schemas/Version
  TVersion = packed record
    Id: integer;
    Project: TIdName;
    Name: string;
    Description: string;
    Status: TEnumOpenapi9;
    DueDate: string;
    Sharing: TEnumOpenapi10;
    WikiPageTitle: string;
    CustomFields: TCustomFieldDynArray;
    CreatedOn: string;
    UpdatedOn: string;
  end;
  PVersion = ^TVersion;
  TVersionDynArray = array of TVersion;

  TDtoOpenapi34 = packed record
    Name: string;
    Status: TEnumOpenapi9;
    Sharing: TEnumOpenapi10;
    DueDate: TDate;
    Description: string;
    WikiPageTitle: string;
  end;
  PDtoOpenapi34 = ^TDtoOpenapi34;

  // from #/components/schemas/VersionNew
  TVersionNew = packed record
    Version: TDtoOpenapi34;
  end;
  PVersionNew = ^TVersionNew;

  TDtoOpenapi36 = packed record
    Name: string;
    Status: TEnumOpenapi9;
    Sharing: TEnumOpenapi10;
    DueDate: TDate;
    Description: string;
    WikiPageTitle: string;
  end;
  PDtoOpenapi36 = ^TDtoOpenapi36;

  // from #/components/schemas/VersionUpdate
  TVersionUpdate = packed record
    Version: TDtoOpenapi36;
  end;
  PVersionUpdate = ^TVersionUpdate;

  TDtoOpenapi37 = packed record
    Id: integer;
    Project: TIdName;
    Name: string;
    Description: string;
    Status: TEnumOpenapi9;
    DueDate: TDate;
    Sharing: TEnumOpenapi10;
    WikiPageTitle: string;
    EstimatedHours: double;
    SpentHours: double;
    CreatedOn: TDateTime;
    UpdatedOn: TDateTime;
    CustomFields: TCustomFieldDynArray;
  end;
  PDtoOpenapi37 = ^TDtoOpenapi37;

  // from #/components/schemas/VersionShow
  TVersionShow = packed record
    Version: TDtoOpenapi37;
  end;
  PVersionShow = ^TVersionShow;

  // from #/components/schemas/VersionList
  TVersionList = packed record
    Versions: TVersionDynArray;
    TotalCount: integer;
  end;
  PVersionList = ^TVersionList;

  // from #/components/schemas/TimeEntryShow
  TTimeEntryShow = packed record
    Id: integer;
    Project: TIdName;
    Issue: TIdName;
    User: TIdName;
    Activity: TIdName;
    Hours: double;
    Comments: string;
    SpentOn: string;
    CreatedOn: string;
    UpdatedOn: string;
    CustomFields: TCustomFieldDynArray;
  end;
  PTimeEntryShow = ^TTimeEntryShow;
  TTimeEntryShowDynArray = array of TTimeEntryShow;

  // from #/components/schemas/TimeList
  TTimeList = packed record
    TimeEntries: TTimeEntryShowDynArray;
    TotalCount: integer;
    Offset: integer;
    Limit: integer;
  end;
  PTimeList = ^TTimeList;

  // from #/components/schemas/TimeShow
  TTimeShow = packed record
    TimeEntry: TTimeEntryShow;
  end;
  PTimeShow = ^TTimeShow;

  // from #/components/schemas/TimeEntryNewUpdate
  TTimeEntryNewUpdate = packed record
    // the issue id to log time on (only one id is required).the issue id or project
    // id to log time on (both are integers)
    IssueId: integer;
    // the project id to log time on (only one id is required).the issue id or project
    // id to log time on (both are integers)
    ProjectId: integer;
    // the date the time was spent (default to the current date); format is e.g. 2020-12-24
    SpentOn: string;
    // the number of spent hours
    Hours: double;
    // the id of the time activity. This parameter is required unless a default activity
    // is defined in Redmine.
    ActivityId: integer;
    // short description for the entry (255 characters max)
    Comments: string;
    // user id to be specified in need of posting time on behalf of another user
    UserId: integer;
    CustomFields: TCustomFieldDynArray;
  end;
  PTimeEntryNewUpdate = ^TTimeEntryNewUpdate;

  // from #/components/schemas/TimeNewUpdate
  TTimeNewUpdate = packed record
    TimeEntry: TTimeEntryNewUpdate;
  end;
  PTimeNewUpdate = ^TTimeNewUpdate;

  // from #/components/schemas/Tracker
  TTracker = packed record
    Id: integer;
    Name: string;
    DefaultStatus: TIdName;
    Description: string;
    EnabledStandardFields: TStringDynArray;
  end;
  PTracker = ^TTracker;
  TTrackerDynArray = array of TTracker;

  // from #/components/schemas/TrackerList
  TTrackerList = packed record
    Trackers: TTrackerDynArray;
  end;
  PTrackerList = ^TTrackerList;

  // from #/components/schemas/Search
  TSearch = packed record
    Id: integer;
    Title: string;
    _Type: string;
    Url: string;
    Description: string;
    Datetime: TDateTime;
  end;
  PSearch = ^TSearch;
  TSearchDynArray = array of TSearch;

  // from #/components/schemas/WatcherAdd
  TWatcherAdd = packed record
    // id of the user to add as a watcher
    UserId: integer;
    // empty for rtti
    Name: string;
  end;
  PWatcherAdd = ^TWatcherAdd;

  TDtoOpenapi38 = packed record
    Results: TSearchDynArray;
    TotalCount: integer;
    Offset: integer;
    Limit: integer;
  end;
  PDtoOpenapi38 = ^TDtoOpenapi38;



const
  // define how enums/sets are actually transmitted as JSON array of string
  ENUMOPENAPI1_TXT: array[TEnumOpenapi1] of RawUtf8 = (
    '', 'all', 'none', 'only_assigned', 'only_my_events', 'only_owner',
    'selected');
  ENUMOPENAPI2_TXT: array[TEnumOpenapi2] of RawUtf8 = (
    '', 'asc', 'desc');
  ENUMOPENAPI3_TXT: array[TEnumOpenapi3] of RawUtf8 = (
    '', 'monospace', 'proportional');
  ENUMOPENAPI4_TXT: array[TEnumOpenapi4] of RawUtf8 = (
    '', 'changesets', 'history', 'last_tab_visited', 'notes', 'properties',
    'time_entries');
  ENUMOPENAPI5_TXT: array[TEnumOpenapi5] of RawUtf8 = (
    '', 'document', 'document_category', 'group', 'issue', 'issue_priority',
    'project', 'time_entry', 'time_entry_activity', 'user', 'version');
  ENUMOPENAPI6_TXT: array[TEnumOpenapi6] of RawUtf8 = (
    '', 'attachment', 'bool', 'date', 'enumeration', 'float', 'int', 'link',
    'list', 'string', 'text', 'user', 'version');
  ENUMOPENAPI7_TXT: array[TEnumOpenapi7] of RawUtf8 = (
    '', 'blocked', 'blocks', 'copied_from', 'copied_to', 'duplicated',
    'duplicates', 'follows', 'precedes', 'relates');
  ENUMOPENAPI8_TXT: array[TEnumOpenapi8] of RawUtf8 = (
    '', 'boards', 'calendar', 'documents', 'files', 'gantt', 'issue_tracking',
    'news', 'repository', 'time_tracking', 'wiki');
  ENUMOPENAPI9_TXT: array[TEnumOpenapi9] of RawUtf8 = (
    '', 'closed', 'locked', 'open');
  ENUMOPENAPI10_TXT: array[TEnumOpenapi10] of RawUtf8 = (
    '', 'descendants', 'hierarchy', 'none', 'system', 'tree');
  ENUMOPENAPI11_TXT: array[TEnumOpenapi11] of RawUtf8 = (
    '', 'csv', 'json', 'xml');
  ENUMOPENAPI12_TXT: array[TEnumOpenapi12] of RawUtf8 = (
    '', 'attachments', 'relations');
  ENUMOPENAPI13_TXT: array[TEnumOpenapi13] of RawUtf8 = (
    '', '!*', '*');
  ENUMOPENAPI14_TXT: array[TEnumOpenapi14] of RawUtf8 = (
    '', 'allowed_statuses', 'attachments', 'changesets', 'children', 'journals',
    'relations', 'watchers');
  ENUMOPENAPI15_TXT: array[TEnumOpenapi15] of RawUtf8 = (
    '', 'memberships', 'users');
  ENUMOPENAPI16_TXT: array[TEnumOpenapi16] of RawUtf8 = (
    '', '0', '1', '2', '3');
  ENUMOPENAPI17_TXT: array[TEnumOpenapi17] of RawUtf8 = (
    '', 'groups', 'memberships');
  ENUMOPENAPI18_TXT: array[TEnumOpenapi18] of RawUtf8 = (
    '', 'document_categories', 'issue_priorities', 'time_entry_activities');
  ENUMOPENAPI19_TXT: array[TEnumOpenapi19] of RawUtf8 = (
    '', 'enabled_modules', 'issue_categories', 'issue_custom_fields', 'time_entry_activities',
    'trackers');
  ENUMOPENAPI20_TXT: array[TEnumOpenapi20] of RawUtf8 = (
    '', 'all', 'my_project', 'subprojects');


implementation

{ ************ Custom RTTI/JSON initialization }

const
  // exact definition of the DTOs expected JSON serialization
  _TIdName = 'id:integer name:string';
  _TAttachment = 'id:integer filename:string filesize:integer content_type:string ' +
    'description:string content_url:string author:TIdName created_on:TDateTime';
  _TCustomField = 'id:integer name:string multiple:boolean value:variant';
  _TFieldValue = 'name:string value:string';
  _TDtoOpenapi1 = 'login:string admin:boolean password:string firstname:string ' +
    'lastname:string mail:string language:string auth_source_id:integer mail_notification:TEnumOpenapi1 ' +
    'notified_project_ids:TIntegerDynArray must_change_passwd:boolean generate_password:boolean ' +
    'status:integer custom_fields:array of TCustomField custom_field_values:TFieldValue ' +
    'group_ids:TIntegerDynArray';
  _TDtoOpenapi2 = 'hide_mail:boolean time_zone:string comments_sorting:TEnumOpenapi2 ' +
    'warn_on_leaving_unsaved:boolean no_self_notified:boolean notify_about_high_priority_issues:boolean ' +
    'textarea_font:TEnumOpenapi3 recently_used_projects:integer history_default_tab:TEnumOpenapi4 ' +
    'toolbar_language_options:string default_issue_query:integer default_project_query:integer ' +
    'auto_watch_on:string';
  _TAccountUpdate = 'user:TDtoOpenapi1 pref:TDtoOpenapi2';
  _TDtoOpenapi3 = 'id:integer login:string admin:boolean firstname:string ' +
    'lastname:string mail:string created_on:TDateTime last_login_on:TDateTime ' +
    'api_key:string custom_fields:array of TCustomField';
  _TAccountShow = 'user:TDtoOpenapi3';
  _TChangeSet = 'revision:string user:TIdName comments:string committed_on:string';
  _TCheckList = 'id:integer issue_id:integer subject:string is_done:boolean ' +
    'position:integer is_section:boolean created_at:string updated_at:string';
  _TCheckListList = 'checklists:array of TCheckList total_count:integer';
  _TDtoOpenapi4 = 'issue_id:integer subject:string is_done:boolean';
  _TCheckListNew = 'checklist:TDtoOpenapi4';
  _TCheckListUpdate = 'checklist:TCheckList';
  _TChild = 'id:integer tracker:TIdName status:TIdName subject:string';
  _TDtoOpenapi5 = 'value:string label:string';
  _TRole = 'id:integer name:string assignable:boolean issues_visibility:string ' +
    'time_entries_visibility:string users_visibility:string permissions:TStringDynArray';
  _TCustomFieldShow = 'id:integer name:string description:string customized_type:TEnumOpenapi5 ' +
    'field_format:TEnumOpenapi6 regexp:string min_length:integer max_length:integer ' +
    'is_required:boolean is_filter:boolean searchable:boolean multiple:boolean ' +
    'default_value:string visible:boolean possible_values:array of TDtoOpenapi5 ' +
    'trackers:array of TIdName roles:array of TRole';
  _TCustomFieldsList = 'custom_fields:array of TCustomFieldShow';
  _TDetail = 'property:string name:string old_value:string new_value:string';
  _TEnum = 'id:integer name:string is_default:boolean';
  _TEnumList = 'time_entry_activities:array of TEnum document_categories:array of TEnum ' +
    'issue_priorities:array of TEnum';
  _TForbidden = 'status_code:double message:variant error_code:string';
  _TGroup = 'id:integer name:string';
  _TGroupList = 'groups:array of TGroup';
  _TDtoOpenapi6 = 'name:string user_ids:TIntegerDynArray';
  _TGroupNew = 'group:TDtoOpenapi6';
  _TRoleMini = 'id:integer name:string inherited:boolean';
  _TMemberShip = 'id:integer project:TIdName user:TIdName group:TIdName roles:array of TRoleMini';
  _TDtoOpenapi7 = 'id:integer name:string users:array of TIdName memberships:array of TMemberShip';
  _TGroupShow = 'group:TDtoOpenapi7';
  _TDtoOpenapi9 = 'name:string user_ids:TIntegerDynArray';
  _TGroupUpdate = 'group:TDtoOpenapi9';
  _TIssueStatus = 'id:integer name:string is_closed:boolean description:string';
  _TDtoOpenapi10 = 'is_done:boolean subject:string';
  _TRelation = 'id:integer issue_id:integer issue_to_id:integer relation_type:TEnumOpenapi7 ' +
    'delay:integer empty:string';
  _TJournal = 'id:integer user:TIdName notes:string created_on:string updated_on:string ' +
    'updated_by:TIdName private_notes:boolean details:array of TDetail';
  _TUpload = 'token:string filename:string description:string content_type:string';
  _TIssue = 'id:integer project:TIdName tracker:TIdName status:TIssueStatus ' +
    'priority:TIdName author:TIdName assigned_to:TIdName category:TIdName fixed_version:TIdName ' +
    'parent:TIdName subject:string description:string start_date:string due_date:string ' +
    'done_ratio:integer is_private:boolean estimated_hours:double total_estimated_hours:double ' +
    'spent_hours:double total_spent_hours:double created_on:string updated_on:string ' +
    'closed_on:string checklists_attributes:array of TDtoOpenapi10 children:array of TChild ' +
    'attachments:array of TAttachment relations:array of TRelation changesets:array of TChangeSet ' +
    'journals:array of TJournal watchers:array of TIdName allowed_statuses:array of TIssueStatus ' +
    'custom_fields:array of TCustomField uploads:array of TUpload';
  _TIssueList = 'issues:array of TIssue offset:integer limit:integer total_count:integer';
  _TDtoOpenapi11 = 'project_id:integer tracker_id:integer status_id:integer ' +
    'priority_id:integer fixed_version_id:integer subject:string description:string ' +
    'category_id:integer assigned_to_id:integer parent_issue_id:integer custom_fields:array of TCustomField ' +
    'watcher_user_ids:TIntegerDynArray is_private:boolean estimated_hours:string';
  _TIssueNew = 'issue:TDtoOpenapi11';
  _TIssueShow = 'issue:TIssue';
  _TDtoOpenapi12 = 'project_id:integer tracker_id:integer status_id:integer ' +
    'priority_id:integer subject:string description:string start_date:string ' +
    'due_date:string done_ratio:integer category_id:integer fixed_version_id:integer ' +
    'assigned_to_id:integer parent_issue_id:integer custom_fields:array of TCustomField ' +
    'watcher_user_ids:TIntegerDynArray is_private:boolean estimated_hours:double ' +
    'notes:string private_notes:boolean uploads:array of TUpload';
  _TIssueUpdate = 'issue:TDtoOpenapi12';
  _TIssueStatusesList = 'issue_statuses:array of TIssueStatus';
  _TIssueCategory = 'id:integer project:TIdName name:string assigned_to:TIdName';
  _TIssueCategoryList = 'issue_categories:array of TIssueCategory total_count:integer';
  _TDtoOpenapi13 = 'id:integer project:TIdName name:string assigned_to:TIdName';
  _TIssueCategoryShow = 'issue_category:TDtoOpenapi13';
  _TDtoOpenapi14 = 'name:string assigned_to:variant';
  _TIssueCategoryUpdate = 'issue_category:TDtoOpenapi14';
  _TDtoOpenapi16 = 'name:string assigned_to:variant';
  _TIssueCategoryNew = 'issue_category:TDtoOpenapi16';
  _TDtoOpenapi17 = 'notes:string private_notes:boolean';
  _TJournalUpdate = 'journal:TDtoOpenapi17';
  _TMemberShipList = 'memberships:array of TMemberShip total_count:integer ' +
    'offset:integer limit:integer';
  _TDtoOpenapi18 = 'role_ids:TIntegerDynArray';
  _TMemberShipUpdate = 'memberships:TDtoOpenapi18';
  _TDtoOpenapi19 = 'user_id:integer role_ids:TIntegerDynArray';
  _TMemberShipAdd = 'memberships:TDtoOpenapi19';
  _TDtoOpenapi20 = 'id:integer project:TIdName user:TIdName group:TIdName ' +
    'roles:array of TIdName';
  _TMemberShipShow = 'memberships:TDtoOpenapi20';
  _TNotAuthorized = 'status_code:double message:variant error_code:string';
  _TUnknownError = 'errors:TStringDynArray';
  _TProject = 'id:integer name:string identifier:string description:string ' +
    'homepage:string parent:TIdName status:integer is_public:boolean inherit_members:boolean ' +
    'custom_fields:array of TCustomField trackers:array of TIdName issue_categories:array of TIdName ' +
    'time_entry_activities:array of TIdName enabled_modules:array of TIdName ' +
    'issue_custom_fields:array of TIdName created_on:string updated_on:string';
  _TProjectList = 'projects:array of TProject total_count:integer offset:integer ' +
    'limit:integer';
  _TDtoOpenapi21 = 'id:integer name:string identifier:string description:string ' +
    'homepage:string parent:TIdName status:integer is_public:boolean inherit_members:boolean ' +
    'default_version:TIdName default_assignee:TIdName custom_fields:array of TCustomField ' +
    'trackers:array of TIdName issue_categories:array of TIdName time_entry_activities:array of TIdName ' +
    'enabled_modules:array of TIdName issue_custom_fields:array of TIdName created_on:TDateTime ' +
    'updated_on:TDateTime';
  _TProjectShow = 'project:TDtoOpenapi21';
  _TDtoOpenapi22 = 'name:string identifier:string description:string homepage:string ' +
    'is_public:boolean parent_id:integer inherit_members:boolean default_assigned_to_id:integer ' +
    'default_version_id:integer tracker_ids:TIntegerDynArray enabled_module_names:TEnumOpenapi8Set ' +
    'issue_custom_field_ids:TIntegerDynArray custom_fields:array of TIdName ' +
    'custom_field_values:TFieldValue';
  _TProjectNew = 'project:TDtoOpenapi22';
  _TDtoOpenapi23 = 'name:string description:string homepage:string is_public:boolean ' +
    'parent_id:integer inherit_members:boolean default_assigned_to_id:integer ' +
    'default_version_id:integer tracker_ids:TIntegerDynArray enabled_module_names:TStringDynArray ' +
    'issue_custom_field_ids:TIntegerDynArray custom_fields:array of TCustomField ' +
    'custom_field_values:TFieldValue';
  _TProjectUpdate = 'project:TDtoOpenapi23';
  _TResNotFound = 'status_code:double message:variant error_code:string';
  _TQuery = 'id:integer name:string is_public:string project_id:integer';
  _TQueriesList = 'queries:array of TQuery total_count:integer limit:integer ' +
    'offset:integer';
  _TRelationList = 'relations:array of TRelation';
  _TDtoOpenapi24 = 'issue_to_id:integer relation_type:TEnumOpenapi7 delay:integer ' +
    'empty:string';
  _TRelationNew = 'relation:TDtoOpenapi24';
  _TRelationShow = 'relation:TRelation';
  _TRolesList = 'roles:array of TIdName';
  _TDtoOpenapi25 = 'id:integer name:string assignable:boolean issues_visibility:string ' +
    'time_entries_visibility:string users_visibility:string permissions:TStringDynArray';
  _TRoleShow = 'role:TDtoOpenapi25';
  _TUserAdd = 'user_id:integer name:string';
  _TUser = 'id:integer login:string admin:boolean firstname:string lastname:string ' +
    'mail:string created_on:string updated_on:string last_login_on:string passwd_changed_on:string ' +
    'twofa_scheme:variant custom_fields:array of TCustomField';
  _TUserList = 'users:array of TUser total_count:integer offset:integer limit:integer';
  _TDtoOpenapi26 = 'id:integer login:string admin:boolean firstname:string ' +
    'lastname:string mail:string created_on:TDateTime updated_on:TDateTime last_login_on:TDateTime ' +
    'passwd_changed_on:TDateTime twofa_scheme:variant api_key:string status:integer ' +
    'custom_fields:array of TCustomField groups:array of TGroup memberships:array of TMemberShip';
  _TUserShow = 'user:TDtoOpenapi26';
  _TDtoOpenapi28 = 'login:string admin:boolean password:string firstname:string ' +
    'lastname:string mail:string language:string auth_source_id:integer mail_notification:TEnumOpenapi1 ' +
    'notified_project_ids:TIntegerDynArray must_change_passwd:boolean generate_password:boolean ' +
    'status:integer custom_fields:array of TCustomField custom_field_values:TFieldValue ' +
    'group_ids:TIntegerDynArray';
  _TDtoOpenapi30 = 'hide_mail:boolean time_zone:string comments_sorting:TEnumOpenapi2 ' +
    'warn_on_leaving_unsaved:boolean no_self_notified:boolean notify_about_high_priority_issues:boolean ' +
    'textarea_font:TEnumOpenapi3 recently_used_projects:integer history_default_tab:TEnumOpenapi4 ' +
    'toolbar_language_options:string default_issue_query:integer default_project_query:integer ' +
    'auto_watch_on:string';
  _TUserUpdate = 'user:TDtoOpenapi28 send_information:boolean custom_fields:array of TCustomField ' +
    'pref:TDtoOpenapi30';
  _TDtoOpenapi31 = 'login:string admin:boolean password:string firstname:string ' +
    'lastname:string mail:string language:string auth_source_id:integer mail_notification:TEnumOpenapi1 ' +
    'notified_project_ids:TIntegerDynArray must_change_passwd:boolean generate_password:boolean ' +
    'status:integer custom_fields:array of TCustomField custom_field_values:TFieldValue';
  _TDtoOpenapi33 = 'hide_mail:boolean time_zone:string comments_sorting:TEnumOpenapi2 ' +
    'warn_on_leaving_unsaved:boolean no_self_notified:boolean notify_about_high_priority_issues:boolean ' +
    'textarea_font:TEnumOpenapi3 recently_used_projects:integer history_default_tab:TEnumOpenapi4 ' +
    'toolbar_language_options:string default_issue_query:integer default_project_query:integer ' +
    'auto_watch_on:string';
  _TUserNew = 'user:TDtoOpenapi31 send_information:boolean pref:TDtoOpenapi33';
  _TValidationError = 'errors:TStringDynArray';
  _TVersion = 'id:integer project:TIdName name:string description:string ' +
    'status:TEnumOpenapi9 due_date:string sharing:TEnumOpenapi10 wiki_page_title:string ' +
    'custom_fields:array of TCustomField created_on:string updated_on:string';
  _TDtoOpenapi34 = 'name:string status:TEnumOpenapi9 sharing:TEnumOpenapi10 ' +
    'due_date:TDate description:string wiki_page_title:string';
  _TVersionNew = 'version:TDtoOpenapi34';
  _TDtoOpenapi36 = 'name:string status:TEnumOpenapi9 sharing:TEnumOpenapi10 ' +
    'due_date:TDate description:string wiki_page_title:string';
  _TVersionUpdate = 'version:TDtoOpenapi36';
  _TDtoOpenapi37 = 'id:integer project:TIdName name:string description:string ' +
    'status:TEnumOpenapi9 due_date:TDate sharing:TEnumOpenapi10 wiki_page_title:string ' +
    'estimated_hours:double spent_hours:double created_on:TDateTime updated_on:TDateTime ' +
    'custom_fields:array of TCustomField';
  _TVersionShow = 'version:TDtoOpenapi37';
  _TVersionList = 'versions:array of TVersion total_count:integer';
  _TTimeEntryShow = 'id:integer project:TIdName issue:TIdName user:TIdName ' +
    'activity:TIdName hours:double comments:string spent_on:string created_on:string ' +
    'updated_on:string custom_fields:array of TCustomField';
  _TTimeList = 'time_entries:array of TTimeEntryShow total_count:integer ' +
    'offset:integer limit:integer';
  _TTimeShow = 'time_entry:TTimeEntryShow';
  _TTimeEntryNewUpdate = 'issue_id:integer project_id:integer spent_on:string ' +
    'hours:double activity_id:integer comments:string user_id:integer custom_fields:array of TCustomField';
  _TTimeNewUpdate = 'time_entry:TTimeEntryNewUpdate';
  _TTracker = 'id:integer name:string default_status:TIdName description:string ' +
    'enabled_standard_fields:TStringDynArray';
  _TTrackerList = 'trackers:array of TTracker';
  _TSearch = 'id:integer title:string type:string url:string description:string ' +
    'datetime:TDateTime';
  _TWatcherAdd = 'user_id:integer name:string';
  _TDtoOpenapi38 = 'results:array of TSearch total_count:integer offset:integer ' +
    'limit:integer';


procedure RegisterRtti;
begin
  TRttiJson.RegisterCustomEnumValues([
    TypeInfo(TEnumOpenapi1), nil, @ENUMOPENAPI1_TXT,
    TypeInfo(TEnumOpenapi2), nil, @ENUMOPENAPI2_TXT,
    TypeInfo(TEnumOpenapi3), nil, @ENUMOPENAPI3_TXT,
    TypeInfo(TEnumOpenapi4), nil, @ENUMOPENAPI4_TXT,
    TypeInfo(TEnumOpenapi5), nil, @ENUMOPENAPI5_TXT,
    TypeInfo(TEnumOpenapi6), nil, @ENUMOPENAPI6_TXT,
    TypeInfo(TEnumOpenapi7), nil, @ENUMOPENAPI7_TXT,
    TypeInfo(TEnumOpenapi8), TypeInfo(TEnumOpenapi8Set), @ENUMOPENAPI8_TXT,
    TypeInfo(TEnumOpenapi9), nil, @ENUMOPENAPI9_TXT,
    TypeInfo(TEnumOpenapi10), nil, @ENUMOPENAPI10_TXT,
    TypeInfo(TEnumOpenapi11), nil, @ENUMOPENAPI11_TXT,
    TypeInfo(TEnumOpenapi12), TypeInfo(TEnumOpenapi12Set), @ENUMOPENAPI12_TXT,
    TypeInfo(TEnumOpenapi13), nil, @ENUMOPENAPI13_TXT,
    TypeInfo(TEnumOpenapi14), TypeInfo(TEnumOpenapi14Set), @ENUMOPENAPI14_TXT,
    TypeInfo(TEnumOpenapi15), TypeInfo(TEnumOpenapi15Set), @ENUMOPENAPI15_TXT,
    TypeInfo(TEnumOpenapi16), nil, @ENUMOPENAPI16_TXT,
    TypeInfo(TEnumOpenapi17), TypeInfo(TEnumOpenapi17Set), @ENUMOPENAPI17_TXT,
    TypeInfo(TEnumOpenapi18), nil, @ENUMOPENAPI18_TXT,
    TypeInfo(TEnumOpenapi19), TypeInfo(TEnumOpenapi19Set), @ENUMOPENAPI19_TXT,
    TypeInfo(TEnumOpenapi20), nil, @ENUMOPENAPI20_TXT]);
  Rtti.RegisterFromText([
    TypeInfo(TIdName), _TIdName,
    TypeInfo(TAttachment), _TAttachment,
    TypeInfo(TCustomField), _TCustomField,
    TypeInfo(TFieldValue), _TFieldValue,
    TypeInfo(TDtoOpenapi1), _TDtoOpenapi1,
    TypeInfo(TDtoOpenapi2), _TDtoOpenapi2,
    TypeInfo(TAccountUpdate), _TAccountUpdate,
    TypeInfo(TDtoOpenapi3), _TDtoOpenapi3,
    TypeInfo(TAccountShow), _TAccountShow,
    TypeInfo(TChangeSet), _TChangeSet,
    TypeInfo(TCheckList), _TCheckList,
    TypeInfo(TCheckListList), _TCheckListList,
    TypeInfo(TDtoOpenapi4), _TDtoOpenapi4,
    TypeInfo(TCheckListNew), _TCheckListNew,
    TypeInfo(TCheckListUpdate), _TCheckListUpdate,
    TypeInfo(TChild), _TChild,
    TypeInfo(TDtoOpenapi5), _TDtoOpenapi5,
    TypeInfo(TRole), _TRole,
    TypeInfo(TCustomFieldShow), _TCustomFieldShow,
    TypeInfo(TCustomFieldsList), _TCustomFieldsList,
    TypeInfo(TDetail), _TDetail,
    TypeInfo(TEnum), _TEnum,
    TypeInfo(TEnumList), _TEnumList,
    TypeInfo(TForbidden), _TForbidden,
    TypeInfo(TGroup), _TGroup,
    TypeInfo(TGroupList), _TGroupList,
    TypeInfo(TDtoOpenapi6), _TDtoOpenapi6,
    TypeInfo(TGroupNew), _TGroupNew,
    TypeInfo(TRoleMini), _TRoleMini,
    TypeInfo(TMemberShip), _TMemberShip,
    TypeInfo(TDtoOpenapi7), _TDtoOpenapi7,
    TypeInfo(TGroupShow), _TGroupShow,
    TypeInfo(TDtoOpenapi9), _TDtoOpenapi9,
    TypeInfo(TGroupUpdate), _TGroupUpdate,
    TypeInfo(TIssueStatus), _TIssueStatus,
    TypeInfo(TDtoOpenapi10), _TDtoOpenapi10,
    TypeInfo(TRelation), _TRelation,
    TypeInfo(TJournal), _TJournal,
    TypeInfo(TUpload), _TUpload,
    TypeInfo(TIssue), _TIssue,
    TypeInfo(TIssueList), _TIssueList,
    TypeInfo(TDtoOpenapi11), _TDtoOpenapi11,
    TypeInfo(TIssueNew), _TIssueNew,
    TypeInfo(TIssueShow), _TIssueShow,
    TypeInfo(TDtoOpenapi12), _TDtoOpenapi12,
    TypeInfo(TIssueUpdate), _TIssueUpdate,
    TypeInfo(TIssueStatusesList), _TIssueStatusesList,
    TypeInfo(TIssueCategory), _TIssueCategory,
    TypeInfo(TIssueCategoryList), _TIssueCategoryList,
    TypeInfo(TDtoOpenapi13), _TDtoOpenapi13,
    TypeInfo(TIssueCategoryShow), _TIssueCategoryShow,
    TypeInfo(TDtoOpenapi14), _TDtoOpenapi14,
    TypeInfo(TIssueCategoryUpdate), _TIssueCategoryUpdate,
    TypeInfo(TDtoOpenapi16), _TDtoOpenapi16,
    TypeInfo(TIssueCategoryNew), _TIssueCategoryNew,
    TypeInfo(TDtoOpenapi17), _TDtoOpenapi17,
    TypeInfo(TJournalUpdate), _TJournalUpdate,
    TypeInfo(TMemberShipList), _TMemberShipList,
    TypeInfo(TDtoOpenapi18), _TDtoOpenapi18,
    TypeInfo(TMemberShipUpdate), _TMemberShipUpdate,
    TypeInfo(TDtoOpenapi19), _TDtoOpenapi19,
    TypeInfo(TMemberShipAdd), _TMemberShipAdd,
    TypeInfo(TDtoOpenapi20), _TDtoOpenapi20,
    TypeInfo(TMemberShipShow), _TMemberShipShow,
    TypeInfo(TNotAuthorized), _TNotAuthorized,
    TypeInfo(TUnknownError), _TUnknownError,
    TypeInfo(TProject), _TProject,
    TypeInfo(TProjectList), _TProjectList,
    TypeInfo(TDtoOpenapi21), _TDtoOpenapi21,
    TypeInfo(TProjectShow), _TProjectShow,
    TypeInfo(TDtoOpenapi22), _TDtoOpenapi22,
    TypeInfo(TProjectNew), _TProjectNew,
    TypeInfo(TDtoOpenapi23), _TDtoOpenapi23,
    TypeInfo(TProjectUpdate), _TProjectUpdate,
    TypeInfo(TResNotFound), _TResNotFound,
    TypeInfo(TQuery), _TQuery,
    TypeInfo(TQueriesList), _TQueriesList,
    TypeInfo(TRelationList), _TRelationList,
    TypeInfo(TDtoOpenapi24), _TDtoOpenapi24,
    TypeInfo(TRelationNew), _TRelationNew,
    TypeInfo(TRelationShow), _TRelationShow,
    TypeInfo(TRolesList), _TRolesList,
    TypeInfo(TDtoOpenapi25), _TDtoOpenapi25,
    TypeInfo(TRoleShow), _TRoleShow,
    TypeInfo(TUserAdd), _TUserAdd,
    TypeInfo(TUser), _TUser,
    TypeInfo(TUserList), _TUserList,
    TypeInfo(TDtoOpenapi26), _TDtoOpenapi26,
    TypeInfo(TUserShow), _TUserShow,
    TypeInfo(TDtoOpenapi28), _TDtoOpenapi28,
    TypeInfo(TDtoOpenapi30), _TDtoOpenapi30,
    TypeInfo(TUserUpdate), _TUserUpdate,
    TypeInfo(TDtoOpenapi31), _TDtoOpenapi31,
    TypeInfo(TDtoOpenapi33), _TDtoOpenapi33,
    TypeInfo(TUserNew), _TUserNew,
    TypeInfo(TValidationError), _TValidationError,
    TypeInfo(TVersion), _TVersion,
    TypeInfo(TDtoOpenapi34), _TDtoOpenapi34,
    TypeInfo(TVersionNew), _TVersionNew,
    TypeInfo(TDtoOpenapi36), _TDtoOpenapi36,
    TypeInfo(TVersionUpdate), _TVersionUpdate,
    TypeInfo(TDtoOpenapi37), _TDtoOpenapi37,
    TypeInfo(TVersionShow), _TVersionShow,
    TypeInfo(TVersionList), _TVersionList,
    TypeInfo(TTimeEntryShow), _TTimeEntryShow,
    TypeInfo(TTimeList), _TTimeList,
    TypeInfo(TTimeShow), _TTimeShow,
    TypeInfo(TTimeEntryNewUpdate), _TTimeEntryNewUpdate,
    TypeInfo(TTimeNewUpdate), _TTimeNewUpdate,
    TypeInfo(TTracker), _TTracker,
    TypeInfo(TTrackerList), _TTrackerList,
    TypeInfo(TSearch), _TSearch,
    TypeInfo(TWatcherAdd), _TWatcherAdd,
    TypeInfo(TDtoOpenapi38), _TDtoOpenapi38]);
end;

initialization
  RegisterRtti;

end.
