// Client unit for Redmine API
// - Redmine exposes some of its data through a REST API. This API provides
// access and basic CRUD operations (create, update, delete) for the resources
// described below. The API supports both XML and JSON formats.
// - version 3.5
unit openapi.client;

{$I mormot.defines.inc}

interface

{
  ----------------------------------------------------------------------
  REDMINE API client as TOpenapiClient class

  Generated 29 Apr 2025 by via mopenapi - DO NOT MODIFY BY HAND!
  ----------------------------------------------------------------------
}

uses
  classes,
  sysutils,
  mormot.core.base,
  mormot.core.unicode,
  mormot.core.text,
  mormot.core.buffers,
  mormot.core.datetime,
  mormot.core.rtti,
  mormot.core.json,
  mormot.core.variants,
  mormot.net.client,
  openapi.dto;

type

{ ************ Custom Exceptions }

  // exception raised on  (401)
  ENotAuthorized = class(EJsonClient)
  protected
    fError: TNotAuthorized;
  public
    constructor CreateResp(const Format: RawUtf8; const Args: array of const;
      const Resp: TJsonResponse); override;
    property Error: TNotAuthorized
      read fError;
  end;

  // exception raised on  (404)
  EResNotFound = class(EJsonClient)
  protected
    fError: TResNotFound;
  public
    constructor CreateResp(const Format: RawUtf8; const Args: array of const;
      const Resp: TJsonResponse); override;
    property Error: TResNotFound
      read fError;
  end;

  // exception raised on  (default)
  EUnknownError = class(EJsonClient)
  protected
    fError: TUnknownError;
  public
    constructor CreateResp(const Format: RawUtf8; const Args: array of const;
      const Resp: TJsonResponse); override;
    property Error: TUnknownError
      read fError;
  end;

  // exception raised on  (422)
  EValidationError = class(EJsonClient)
  protected
    fError: TValidationError;
  public
    constructor CreateResp(const Format: RawUtf8; const Args: array of const;
      const Resp: TJsonResponse); override;
    property Error: TValidationError
      read fError;
  end;

  // exception raised on  (403)
  EForbidden = class(EJsonClient)
  protected
    fError: TForbidden;
  public
    constructor CreateResp(const Format: RawUtf8; const Args: array of const;
      const Resp: TJsonResponse); override;
    property Error: TForbidden
      read fError;
  end;


{ ************ Main TOpenapiClient Class }

  // Client class for Redmine API
  // - Redmine exposes some of its data through a REST API. This API provides
  // access and basic CRUD operations (create, update, delete) for the resources
  // described below. The API supports both XML and JSON formats.
  TOpenapiClient = class
  private
    fClient: IJsonClient;
    // TOnJsonClientError event handlers
    procedure OnError1(const Sender: IJsonClient;
      const Response: TJsonResponse; const ErrorMsg: shortstring);
    procedure OnError2(const Sender: IJsonClient;
      const Response: TJsonResponse; const ErrorMsg: shortstring);
    procedure OnError3(const Sender: IJsonClient;
      const Response: TJsonResponse; const ErrorMsg: shortstring);
    procedure OnError4(const Sender: IJsonClient;
      const Response: TJsonResponse; const ErrorMsg: shortstring);
    procedure OnError5(const Sender: IJsonClient;
      const Response: TJsonResponse; const ErrorMsg: shortstring);
    procedure OnError6(const Sender: IJsonClient;
      const Response: TJsonResponse; const ErrorMsg: shortstring);
    procedure OnError7(const Sender: IJsonClient;
      const Response: TJsonResponse; const ErrorMsg: shortstring);
    procedure OnError8(const Sender: IJsonClient;
      const Response: TJsonResponse; const ErrorMsg: shortstring);
    procedure OnError9(const Sender: IJsonClient;
      const Response: TJsonResponse; const ErrorMsg: shortstring);
  public

    // initialize this Client with an associated HTTP/JSON request
    constructor Create(const aClient: IJsonClient);


    // ---------------------
    //  REDMINE API METHODS
    // ---------------------

    // Search [get] /search.{format}
    //
    // Summary: Returns the search results by the specified condition parameters
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [query] Offset: the offset of the first object to retrieve
    // - [query] Limit: number of issues per page (optional)
    // - [query] Q: query strings. enable to specify multiple values separated by
    // a space ' '
    // - [query] Scope: search scope condition
    // - [query] AllWords: matched all query strings or not
    // - [query] TitlesOnly: matched only title or not
    // - [query] Issues: include Issues or not
    // - [query] News: include News or not
    // - [query] Documents: include Documents or not
    // - [query] Changesets: include Changesets or not
    // - [query] WikiPages: include Wiki Pages or not
    // - [query] Messages: include Messages or not
    // - [query] Projects: include Projects or not
    // - [query] OpenIssues: filtered by open issues
    // - [query] Attachments: filtered by description and attachment
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function Search(const Format: TEnumOpenapi11; Offset: integer = 0; Limit: integer = 0;
      const Q: string = ''; const Scope: TEnumOpenapi20 = eo20None; AllWords: integer = 0;
      TitlesOnly: integer = 0; Issues: integer = 0; News: integer = 0;
      Documents: integer = 0; Changesets: integer = 0; WikiPages: integer = 0;
      Messages: integer = 0; Projects: integer = 0; OpenIssues: integer = 0;
      Attachments: integer = 0): TDtoOpenapi38;


    // ----------------
    //  ISSUES METHODS
    // ----------------

    // IssuesList [get] /issues.{format}
    //
    // Summary: Listing issues
    // Description:
    //   Returns a paginated list of issues. By default, it returns open issues only.  
    //   NB: operators containing ">", "<" or "=" should be hex-encoded so they're parsed correctly. Most evolved API clients will do that for you by default, but for the sake of clarity the following examples have been written with no such magic feature in mind.
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [query] Offset: the offset of the first object to retrieve
    // - [query] Limit: number of issues per page (optional)
    // - [query] Sort: column to sort with. Append :desc to invert the order.
    // - [query] Include: fetch associated data (optional, use comma to fetch multiple
    // associations). Possible values:
    // - [query] IssueId: get issue with the given id or multiple issues by id using
    // ',' to separate id
    // - [query] ProjectId: get issues from the project with the given id (a numeric
    // value, not a project identifier).
    // - [query] SubprojectId: get issues from the subproject with the given id. You
    // can use project_id=XXX&subproject_id=!* to get only the issues of a given project
    // and none of its subprojects.
    // - [query] TrackerId: get issues from the tracker with the given id
    // - [query] QueryId: you can get the corresponding issue list using
    // - [query] StatusId: get issues with the given status id only. Possible values:
    // open, closed, * to get open and closed issues, status id
    // - [query] AssignedToId: get issues which are assigned to the given user id.
    // me can be used instead an ID to fetch all issues from the logged in user (via
    // API key or HTTP auth)
    // - [query] ParentId: get issues whose parent issue is given id
    // - [query] CfX: get issues with the given value for custom field with an ID
    // of x. (Custom field must have 'used as a filter' checked.)
    // - [query] AuthorId
    // - [query] WatcherId
    // - [query] ChildId
    // - [query] MemberOfGroup
    // - [query] AssignedToRole
    // - [query] FixedVersionId
    // - [query] CategoryId
    // - [query] Subject: may use ~ before string value
    // - [query] Description: may use ~ before string value
    // - [query] Notes: may use ~ before string value
    // - [query] ClosedOn: may use ~ before string value
    // - [query] StartDate
    // - [query] DueDate
    // - [query] EstimatedHours
    // - [query] SpentTime
    // - [query] DoneRatio
    // - [query] IsPrivate
    // - [query] Attachment: may has ~ at the beginning. Search into field 'filename'
    // attachments
    // - [query] AttachmentDescription: may has ~ at the beginning. Search into field
    // 'description' attachments
    // - [query] UpdatedBy: id an user which has made changes in journal
    // - [query] LastUpdatedBy: id a last user which has made changes in journal
    // - [query] RelationType: array of string through comma
    // - [query] CreatedOn: To fetch issues for a date range
    // - [query] UpdatedOn: To fetch issues updated after a certain timestamp
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function IssuesList(const Format: TEnumOpenapi11; const StatusId: variant;
      const AssignedToId: variant; Offset: integer = 0; Limit: integer = 0;
      const Sort: TStringDynArray = nil; const Include: TEnumOpenapi12Set = [];
      const IssueId: TIntegerDynArray = nil; ProjectId: integer = 0; const SubprojectId: TEnumOpenapi13 = eo13None;
      TrackerId: integer = 0; QueryId: integer = 0; ParentId: integer = 0;
      const Cf_id:Integer=0;const CfX: string = ''; AuthorId: integer = 0; WatcherId: integer = 0;
      ChildId: integer = 0; MemberOfGroup: integer = 0; AssignedToRole: integer = 0;
      FixedVersionId: integer = 0; CategoryId: integer = 0; const Subject: string = '';
      const Description: string = ''; const Notes: string = ''; const ClosedOn: string = '';
      const StartDate: string = ''; const DueDate: string = ''; EstimatedHours: double = 0;
      SpentTime: double = 0; DoneRatio: double = 0; IsPrivate: boolean = false;
      const Attachment: string = ''; const AttachmentDescription: string = '';
      UpdatedBy: integer = 0; LastUpdatedBy: integer = 0; const RelationType: string = '';
      const CreatedOn: string = ''; const UpdatedOn: string = ''): TIssueList;

    // IssueCreate [post] /issues.{format}
    //
    // Summary: Creating an issue
    // Description:
    //   Creating a new issue
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 201 (main): Created: issue was created
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]
    procedure IssueCreate(const Format: TEnumOpenapi11; const Payload: TIssueNew);

    // IssueShow [get] /issues/{issue_id}.{format}
    //
    // Summary: Showing an issue
    //
    // Params:
    // - [path] IssueId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [query] Include: fetch associated data (optional, use comma to fetch multiple
    // associations). Possible values:
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function IssueShow(IssueId: integer; const Format: TEnumOpenapi11; const Include: TEnumOpenapi14Set = []): TIssueShow;

    // IssueUpdate [put] /issues/{issue_id}.{format}
    //
    // Summary: Updating an issue
    //
    // Params:
    // - [path] IssueId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]
    procedure IssueUpdate(IssueId: integer; const Format: TEnumOpenapi11; const Payload: TIssueUpdate);

    // IssueDelete [delete] /issues/{issue_id}.{format}
    //
    // Summary: Deleting an issue
    //
    // Params:
    // - [path] IssueId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    procedure IssueDelete(IssueId: integer; const Format: TEnumOpenapi11);

    // WatcherAdd [post] /issues/{issue_id}/watchers.{format}
    //
    // Summary: Adding a watcher
    //
    // Params:
    // - [path] IssueId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    procedure WatcherAdd(IssueId: integer; const Format: TEnumOpenapi11; const Payload: TWatcherAdd);

    // WatcherDelete [delete] /issues/{issue_id}/watchers/{user_id}.{format}
    //
    // Summary: Removing a watcher
    //
    // Params:
    // - [path] IssueId (required): The user identifier number
    // - [path] UserId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    procedure WatcherDelete(IssueId: integer; const UserId: variant; const Format: TEnumOpenapi11);


    // ------------------
    //  RELATION METHODS
    // ------------------

    // RelationList [get] /issues/{issue_id}/relations.{format}
    //
    // Summary: returns the relations for the issue of given id (:issue_id).
    //
    // Params:
    // - [path] IssueId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function RelationList(IssueId: integer; const Format: TEnumOpenapi11): TRelationList;

    // RelationCreate [post] /issues/{issue_id}/relations.{format}
    //
    // Summary: Creates a relation for the issue of given id (:issue_id).
    //
    // Params:
    // - [path] IssueId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 201 (main): relation was created
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]: relation was not created due to validation failures
    // (response body contains the error messages)
    procedure RelationCreate(IssueId: integer; const Format: TEnumOpenapi11;
      const Payload: TRelationNew);

    // RelationShow [get] /relations/{relation_id}.{format}
    //
    // Summary: Returns the relation of given id.
    //
    // Params:
    // - [path] RelationId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function RelationShow(RelationId: integer; const Format: TEnumOpenapi11): TRelationShow;

    // RelationDelete [delete] /relations/{relation_id}.{format}
    //
    // Summary: Deletes the relation of given id.
    //
    // Params:
    // - [path] RelationId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): relation was deleted
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]: relation was not deleted (response body contains
    // the error messages)
    procedure RelationDelete(RelationId: integer; const Format: TEnumOpenapi11);


    // ---------------
    //  GROUP METHODS
    // ---------------

    // GroupList [get] /groups.{format}
    //
    // Summary: Returns the list of groups.
    // This endpoint requires admin privileges.
    //
    // Params:
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function GroupList(const Format: TEnumOpenapi11): TGroupList;

    // GroupCreate [post] /groups.{format}
    //
    // Summary: Creates a group.
    // This endpoint requires admin privileges.
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 201 (main): group was created
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 422 [EValidationError]
    procedure GroupCreate(const Format: TEnumOpenapi11; const Payload: TGroupNew);

    // GroupShow [get] /groups/{group_id}.{format}
    //
    // Summary: Returns details of a group.
    // This endpoint requires admin privileges.
    //
    // Params:
    // - [path] GroupId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [query] Include: a coma separated list of associations to include in the
    // response:
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function GroupShow(GroupId: integer; const Format: TEnumOpenapi11; const Include: TEnumOpenapi15Set = []): TGroupShow;

    // GroupUpdate [put] /groups/{group_id}.{format}
    //
    // Summary: Updates an existing group.
    // This endpoint requires admin privileges.
    //
    // Params:
    // - [path] GroupId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    procedure GroupUpdate(GroupId: integer; const Format: TEnumOpenapi11; const Payload: TGroupUpdate);

    // GroupDelete [delete] /groups/{group_id}.{format}
    //
    // Summary: Deletes an existing group.
    // This endpoint requires admin privileges.
    //
    // Params:
    // - [path] GroupId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 404 [EResNotFound]
    procedure GroupDelete(GroupId: integer; const Format: TEnumOpenapi11);

    // UserAdd [post] /groups/{group_id}/users.{format}
    //
    // Summary: Adds an existing user to a group. This endpoint requires admin privileges.
    //
    // Params:
    // - [path] GroupId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): user was added to the group
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    procedure UserAdd(GroupId: integer; const Format: TEnumOpenapi11; const Payload: TUserAdd);

    //  [delete] /groups/{group_id}/users/{user_id}.{format}
    //
    // Summary: Removes a user from a group. This endpoint requires admin privileges.
    //
    // Params:
    // - [path] GroupId (required): The user identifier number
    // - [path] UserId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): user was removed to the group
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 404 [EResNotFound]
    procedure DeleteGroupsGroupIdUsersUserIdFormat(GroupId: integer; const UserId: variant;
      const Format: TEnumOpenapi11);


    // -----------------------
    //  ISSUESTATUSES METHODS
    // -----------------------

    // StatusesList [get] /issue_statuses.{format}
    //
    // Summary: Returns possible Status Values for Issues
    //
    // Params:
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function StatusesList(const Format: TEnumOpenapi11): TIssueStatusesList;


    // ------------------
    //  TRACKERS METHODS
    // ------------------

    // TrackersList [get] /trackers.{format}
    //
    // Summary: List trackers
    // Description:
    //   Returns the list of all trackers.
    //
    // Params:
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function TrackersList(const Format: TEnumOpenapi11): TTrackerList;


    // ---------------
    //  USERS METHODS
    // ---------------

    // UsersList [get] /users.{format}
    //
    // Summary: Returns a list of users. This endpoint requires admin privileges.
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [query] Offset: the offset of the first object to retrieve
    // - [query] Limit: number of issues per page (optional)
    // - [query] Status: get only users with the given status. See app/models/principal.rb
    // for a list of available statuses. Supply an empty value to match all users
    // regardless of their status. Default is 1 (active users)
    // - [query] Name: filter users on their login, firstname, lastname and mail ;
    // if the pattern contains a space, it will also return users whose firstname
    // match the first word or lastname match the second word
    // - [query] GroupId: get only users who are members of the given group. Don't
    // replace components/parameters/group_id
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function UsersList(const Format: TEnumOpenapi11; Offset: integer = 0; Limit: integer = 0;
      const Status: TEnumOpenapi16 = eo16None; const Name: string = '';
      GroupId: integer = 0): TUserList;

    // UserCreate [post] /users.{format}
    //
    // Summary: Creates a user.This endpoint requires admin privileges.
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 201 (main): user was created
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 422 [EValidationError]: user was not created due to validation failures (response
    // body contains the error messages)
    procedure UserCreate(const Format: TEnumOpenapi11; const Payload: TUserNew);

    // UserShow [get] /users/{user_id}.{format}
    //
    // Summary: Returns the user details. You can use /users/current.:format for retrieving
    // the user whose credentials are used to access the API.
    // This endpoint can be used by admin or non admin but the returned fields will
    // depend on the privileges of the requesting user
    //
    // Params:
    // - [path] UserId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [query] Include: a comma separated list of associations to include in the
    // response:
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function UserShow(const UserId: variant; const Format: TEnumOpenapi11;
      const Include: TEnumOpenapi17Set = []): TUserShow;


    // --------------
    //  USER METHODS
    // --------------

    // UserUpdate [put] /users/{user_id}.{format}
    //
    // Summary: Updates a user.
    // This endpoint requires admin privileges.
    //
    // Params:
    // - [path] UserId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main)
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    procedure UserUpdate(const UserId: variant; const Format: TEnumOpenapi11;
      const Payload: TUserUpdate);

    // UserDelete [delete] /users/{user_id}.{format}
    //
    // Summary: This endpoint requires admin privileges.
    // Deletes a user.
    //
    // Params:
    // - [path] UserId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): user was deleted
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 404 [EResNotFound]
    procedure UserDelete(const UserId: variant; const Format: TEnumOpenapi11);


    // -----------------
    //  VERSION METHODS
    // -----------------

    // VersionShow [get] /versions/{version_id}.{format}
    //
    // Summary: Returns the version of given id.
    //
    // Params:
    // - [path] VersionId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function VersionShow(VersionId: integer; const Format: TEnumOpenapi11): TVersionShow;

    // VersionUpdate [put] /versions/{version_id}.{format}
    //
    // Summary: Updates the version of given id
    //
    // Params:
    // - [path] VersionId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): version was updated
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]: version was not updated due to validation failures
    // (response body contains the error messages)
    procedure VersionUpdate(VersionId: integer; const Format: TEnumOpenapi11;
      const Payload: TVersionUpdate);

    // VersionDelete [delete] /versions/{version_id}.{format}
    //
    // Summary: Deletes the version of given id.
    //
    // Params:
    // - [path] VersionId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): version was deleted
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - 422 [EValidationError]: version was not deleted (response body contains the
    // error messages)
    procedure VersionDelete(VersionId: integer; const Format: TEnumOpenapi11);

    // VersionList [get] /projects/{project_id}/versions.{format}
    //
    // Summary: Returns the versions available for the project of given id or identifier
    // (:project_id). The response may include shared versions from other projects.
    //
    // Params:
    // - [path] ProjectId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function VersionList(const ProjectId: variant; const Format: TEnumOpenapi11): TVersionList;

    // VersionCreate [post] /projects/{project_id}/versions.{format}
    //
    // Summary: Creates a version for the project of given id or identifier (:project_id).
    //
    // Params:
    // - [path] ProjectId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 201 (main): version was created
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]: version was not created due to validation failures
    // (response body contains the error messages)
    procedure VersionCreate(const ProjectId: variant; const Format: TEnumOpenapi11;
      const Payload: TVersionNew);


    // --------------------
    //  CHECKLISTS METHODS
    // --------------------

    // ChecklistList [get] /issues/{issue_id}/checklists.{format}
    //
    // Summary: Returns list of checklist items for issue issue_id
    //
    // Params:
    // - [path] IssueId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function ChecklistList(IssueId: integer; const Format: TEnumOpenapi11): TCheckListList;

    // CheckListCreate [post] /issues/{issue_id}/checklists.{format}
    //
    // Summary: Creating a checklist
    //
    // Params:
    // - [path] IssueId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    procedure CheckListCreate(IssueId: integer; const Format: TEnumOpenapi11;
      const Payload: TCheckListNew);

    // ChecklistUpdate [put] /checklists/{checklist_id}.{format}
    //
    // Summary: Updating a checklist
    //
    // Params:
    // - [path] ChecklistId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    procedure ChecklistUpdate(ChecklistId: integer; const Format: TEnumOpenapi11;
      const Payload: TCheckListUpdate);


    // ----------------------
    //  CUSTOMFIELDS METHODS
    // ----------------------

    // CustomFieldList [get] /custom_fields.{format}
    //
    // Summary: Returns all the custom fields definitions.
    // This endpoint requires admin privileges.
    //
    // Params:
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 403 [EForbidden]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function CustomFieldList(const Format: TEnumOpenapi11): TCustomFieldsList;


    // ----------------------
    //  ENUMERATIONS METHODS
    // ----------------------

    // EnumList [get] /enumerations/{type}.{format}
    //
    // Summary: Returns enum for given Type
    //
    // Params:
    // - [path] _Type (required): Enumeration Type issue_priorities,time_entry_activities,
    //document_categories
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function EnumList(const _Type: TEnumOpenapi18; const Format: TEnumOpenapi11): TEnumList;


    // ------------------
    //  PROJECTS METHODS
    // ------------------

    // ProjectsList [get] /projects.{format}
    //
    // Summary: Listing projects
    // Description:
    //   Returns all projects (all public projects and private projects where user have access to)
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [query] Offset: the offset of the first object to retrieve
    // - [query] Limit: number of issues per page (optional)
    // - [query] Include: fetch associated data (optional). Possible values: trackers,
    // issue_categories, enabled_modules (since 2.6.0).
    // Values should be separated by a comma ",".
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function ProjectsList(const Format: TEnumOpenapi11; Offset: integer = 0;
      Limit: integer = 0; const Include: TEnumOpenapi19Set = []): TProjectList;

    // ProjectCreate [post] /projects.{format}
    //
    // Summary: Creating a project
    // Description:
    //   Creates a the project
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 201 (main): project was created
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]: project was not created due to validation failures
    // (response body contains the error messages)
    procedure ProjectCreate(const Format: TEnumOpenapi11; const Payload: TProjectNew);

    // ProjectShow [get] /projects/{project_id}.{format}
    //
    // Summary: Showing a project
    // Description:
    //   Returns the project of given id or identifier.
    //
    // Params:
    // - [path] ProjectId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [query] Include: fetch associated data (optional). Possible values: trackers,
    // issue_categories, enabled_modules (since 2.6.0).
    // Values should be separated by a comma ",".
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function ProjectShow(const ProjectId: variant; const Format: TEnumOpenapi11;
      const Include: TEnumOpenapi19Set = []): TProjectShow;

    // ProjectUpdate [put] /projects/{project_id}.{format}
    //
    // Summary: Updating a project
    // Description:
    //   Updates the project of given id or identifier.
    //
    // Params:
    // - [path] ProjectId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    procedure ProjectUpdate(const ProjectId: variant; const Format: TEnumOpenapi11;
      const Payload: TProjectUpdate);

    // ProjectDelete [delete] /projects/{project_id}.{format}
    //
    // Summary: Deleting a project
    // Description:
    //   Deletes the project of given id or identifier.
    //
    // Params:
    // - [path] ProjectId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    procedure ProjectDelete(const ProjectId: variant; const Format: TEnumOpenapi11);

    // MemberShipList [get] /projects/{project_id}/memberships.{format}
    //
    // Summary: Returns a paginated list of the project memberships. :project_id can
    // be either the project numerical id or the project identifier.
    //
    // Params:
    // - [path] ProjectId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function MemberShipList(const ProjectId: variant; const Format: TEnumOpenapi11): TMemberShipList;

    // MemberShipAdd [post] /projects/{project_id}/memberships.{format}
    //
    // Summary: Adds a project member.
    //
    // Params:
    // - [path] ProjectId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 201 (main): membership was created
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]: membership was not created due to validation failures
    // (response body contains the error messages)
    procedure MemberShipAdd(const ProjectId: variant; const Format: TEnumOpenapi11;
      const Payload: TMemberShipAdd);


    // ------------------
    //  CATEGORY METHODS
    // ------------------

    // IssueCategoryShow [get] /issue_categories/{issue_category_id}.{format}
    //
    // Summary: Returns the issue category of given id.
    //
    // Params:
    // - [path] IssueCategoryId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function IssueCategoryShow(IssueCategoryId: integer; const Format: TEnumOpenapi11): TIssueCategoryShow;

    // IssueCategoryUpdate [put] /issue_categories/{issue_category_id}.{format}
    //
    // Summary: Updates the issue category of given id
    //
    // Params:
    // - [path] IssueCategoryId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 201 (main): issue category was created
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]: issue category was not created due to validation
    // failures (response body contains the error messages)
    procedure IssueCategoryUpdate(IssueCategoryId: integer; const Format: TEnumOpenapi11;
      const Payload: TIssueCategoryUpdate);

    // IssueCategoryDelete [delete] /issue_categories/{issue_category_id}.{format}
    //
    // Summary: Deletes the issue category of given id.
    //
    // Params:
    // - [path] IssueCategoryId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [query] ReassignToId: when there are issues assigned to the category you
    // are deleting, this parameter lets you reassign these issues to the category
    // with this id
    //
    // Responses:
    // - 204 (main): issue category was deleted
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    procedure IssueCategoryDelete(IssueCategoryId: integer; const Format: TEnumOpenapi11;
      ReassignToId: integer = 0);

    // IssueCategoryList [get] /projects/{project_id}/issue_categories.{format}
    //
    // Summary: Returns the issue categories available for the project of given id
    // or identifier (:project_id).
    //
    // Params:
    // - [path] ProjectId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function IssueCategoryList(const ProjectId: variant; const Format: TEnumOpenapi11): TIssueCategoryList;

    // IssueCategoryCreate [post] /projects/{project_id}/issue_categories.{format}
    //
    // Summary: Creates an issue category for the project of given id or identifier
    // (:project_id).
    //
    // Params:
    // - [path] ProjectId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 201 (main): issue category was created
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]
    procedure IssueCategoryCreate(const ProjectId: variant; const Format: TEnumOpenapi11);


    // -------------------
    //  MYACCOUNT METHODS
    // -------------------

    // AccountShow [get] /my/account.{format}
    //
    // Summary: Shows Account data
    // Description:
    //   Returns the Users Account data.
    //
    // Params:
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function AccountShow(const Format: TEnumOpenapi11): TAccountShow;

    // AccountUpdate [put] /my/account.{format}
    //
    // Summary: Updates your account.
    // Description:
    //   Updates the Users Account data.
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]
    procedure AccountUpdate(const Format: TEnumOpenapi11; const Payload: TAccountUpdate);


    // -----------------
    //  JOURNAL METHODS
    // -----------------

    // JournalUpdate [put] /journals/{journal_id}.{format}
    //
    //
    // Params:
    // - [path] JournalId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    procedure JournalUpdate(JournalId: integer; const Format: TEnumOpenapi11;
      const Payload: TJournalUpdate);


    // ---------------------
    //  TIMEENTRIES METHODS
    // ---------------------

    // TimeList [get] /time_entries.{format}
    //
    // Summary: Shows Time entries
    // Description:
    //   Returns Time entries.
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [query] Offset: the offset of the first object to retrieve
    // - [query] Limit: number of issues per page (optional)
    // - [query] ProjectId: The user identifier number
    // - [query] SubprojectId: The user identifier number
    // - [query] UserId: The user identifier number
    // - [query] SpentOn: The user identifier number
    // - [query] From: Date syntax: YYYY-MM-DD
    // - [query] _To: Date syntax: YYYY-MM-DD
    // - [query] IssueId: The user identifier number
    // - [query] AuthorId: The user identifier number
    // - [query] ActivityId: The user identifier number
    // - [query] Comments
    // - [query] Hours
    // - [query] Sort: sort=spent_on:desc
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function TimeList(const Format: TEnumOpenapi11; const ProjectId: variant;
      const UserId: variant; Offset: integer = 0; Limit: integer = 0; SubprojectId: integer = 0;
      const SpentOn: string = ''; const From: string = ''; const _To: string = '';
      IssueId: integer = 0; AuthorId: integer = 0; ActivityId: integer = 0;
      const Comments: string = ''; const Hours: string = ''; const Sort: string = ''): TTimeList;

    // TimeCreate [post] /time_entries.{format}
    //
    // Summary: Creates Time entry
    // Description:
    //   Creates a new Time entry.
    //
    // Params:
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 201 (main): Created: time entry was created
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]
    procedure TimeCreate(const Format: TEnumOpenapi11; const Payload: TTimeNewUpdate);

    // TimeShow [get] /time_entries/{entry_id}.{format}
    //
    // Summary: Show time entry
    // Description:
    //   Returns the time entry of given id.
    //
    // Params:
    // - [path] EntryId (required): id of the entry to update
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function TimeShow(EntryId: integer; const Format: TEnumOpenapi11): TTimeShow;

    // TimeUpdate [put] /time_entries/{entry_id}.{format}
    //
    // Summary: Updates Time entry
    // Description:
    //   Updates the Users Account data
    //
    // Params:
    // - [path] EntryId (required): id of the entry to update
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): time entry was updated
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]: time entry was not updated due to validation failures
    // (response body contains the error messages)
    procedure TimeUpdate(EntryId: integer; const Format: TEnumOpenapi11; const Payload: TTimeNewUpdate);

    // TimeDelete [delete] /time_entries/{entry_id}.{format}
    //
    // Summary: Delete a time entry
    //
    // Params:
    // - [path] EntryId (required): id of the entry to update
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): Success
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    procedure TimeDelete(EntryId: integer; const Format: TEnumOpenapi11);


    // --------------------
    //  MEMBERSHIP METHODS
    // --------------------

    // MemberShipShow [get] /memberships/{membership_id}.{format}
    //
    // Summary: Returns the membership of given :id.
    //
    // Params:
    // - [path] MembershipId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function MemberShipShow(MembershipId: integer; const Format: TEnumOpenapi11): TMemberShipShow;

    // MemberShipUpdate [put] /memberships/{membership_id}.{format}
    //
    // Summary: Updates the membership of given :id. Only the roles can be updated,
    // the project and the user of a membership are read-only.
    //
    // Params:
    // - [path] MembershipId (required): The user identifier number
    // - [path] Format (required): json or xml
    // - [body] Payload  (required)
    //
    // Responses:
    // - 204 (main): membership was updated
    // - 401 [ENotAuthorized]
    // - 422 [EValidationError]: membership was not updated due to validation failures
    // (response body contains the error messages)
    procedure MemberShipUpdate(MembershipId: integer; const Format: TEnumOpenapi11;
      const Payload: TMemberShipUpdate);

    // MemberShipDelete [delete] /memberships/{membership_id}.{format}
    //
    // Summary: Deletes a memberships.
    // Memberships inherited from a group membership can not be deleted. You must
    // delete the group membership.
    //
    // Params:
    // - [path] MembershipId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 204 (main): membership was deleted
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - 422 [EValidationError]: membership was not deleted
    procedure MemberShipDelete(MembershipId: integer; const Format: TEnumOpenapi11);


    // -----------------
    //  QUERIES METHODS
    // -----------------

    // QueriesList [get] /queries.{format}
    //
    // Summary: Returns the list of all custom queries visible by the user (public
    // and private queries) for all projects.
    //
    // Params:
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function QueriesList(const Format: TEnumOpenapi11): TQueriesList;


    // ---------------
    //  ROLES METHODS
    // ---------------

    // RolesList [get] /roles.{format}
    //
    // Summary: Returns the list of roles.
    //
    // Params:
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function RolesList(const Format: TEnumOpenapi11): TRolesList;

    // RoleShow [get] /roles/{role_id}.{format}
    //
    // Summary: Returns the list of permissions for a given role
    //
    // Params:
    // - [path] RoleId (required): The user identifier number
    // - [path] Format (required): json or xml
    //
    // Responses:
    // - 200 (main)
    // - 401 [ENotAuthorized]
    // - 404 [EResNotFound]
    // - default [EUnknownError]
    function RoleShow(RoleId: integer; const Format: TEnumOpenapi11): TRoleShow;

    // access to the associated HTTP/JSON client instance
    property JsonClient: IJsonClient
      read fClient write fClient;
  end;


implementation


{ ************ Custom Exceptions }

{ ENotAuthorized }

constructor ENotAuthorized.CreateResp(const Format: RawUtf8;
  const Args: array of const; const Resp: TJsonResponse);
begin
  inherited CreateResp(Format, Args, Resp);
  LoadJson(fError, Resp.Content, TypeInfo(TNotAuthorized));
end;

{ EResNotFound }

constructor EResNotFound.CreateResp(const Format: RawUtf8;
  const Args: array of const; const Resp: TJsonResponse);
begin
  inherited CreateResp(Format, Args, Resp);
  LoadJson(fError, Resp.Content, TypeInfo(TResNotFound));
end;

{ EUnknownError }

constructor EUnknownError.CreateResp(const Format: RawUtf8;
  const Args: array of const; const Resp: TJsonResponse);
begin
  inherited CreateResp(Format, Args, Resp);
  LoadJson(fError, Resp.Content, TypeInfo(TUnknownError));
end;

{ EValidationError }

constructor EValidationError.CreateResp(const Format: RawUtf8;
  const Args: array of const; const Resp: TJsonResponse);
begin
  inherited CreateResp(Format, Args, Resp);
  LoadJson(fError, Resp.Content, TypeInfo(TValidationError));
end;

{ EForbidden }

constructor EForbidden.CreateResp(const Format: RawUtf8;
  const Args: array of const; const Resp: TJsonResponse);
begin
  inherited CreateResp(Format, Args, Resp);
  LoadJson(fError, Resp.Content, TypeInfo(TForbidden));
end;


{ ************ Main TOpenapiClient Class }

{ TOpenapiClient}

constructor TOpenapiClient.Create(const aClient: IJsonClient);
begin
  fClient := aClient;
  fClient.Options := [jcoParseTolerant, jcoHttpErrorRaise];
  fClient.UrlEncoder :=
    [ueEncodeNames, ueSkipVoidString, ueSkipVoidValue, ueStarNameIsCsv];
end;

procedure TOpenapiClient.OnError1(const Sender: IJsonClient;
  const Response: TJsonResponse; const ErrorMsg: shortstring);
var
  e: EJsonClientClass;
begin
  case Response.Status of
    401:
      e := ENotAuthorized;
    404:
      e := EResNotFound;
  else
    e := EUnknownError;
  end;
  raise e.CreateResp('%.%', [self, ErrorMsg], Response);
end;

procedure TOpenapiClient.OnError2(const Sender: IJsonClient;
  const Response: TJsonResponse; const ErrorMsg: shortstring);
var
  e: EJsonClientClass;
begin
  case Response.Status of
    401:
      e := ENotAuthorized;
    422:
      e := EValidationError;
  else
    e := EJsonClient;
  end;
  raise e.CreateResp('%.%', [self, ErrorMsg], Response);
end;

procedure TOpenapiClient.OnError3(const Sender: IJsonClient;
  const Response: TJsonResponse; const ErrorMsg: shortstring);
var
  e: EJsonClientClass;
begin
  case Response.Status of
    401:
      e := ENotAuthorized;
    404:
      e := EResNotFound;
  else
    e := EJsonClient;
  end;
  raise e.CreateResp('%.%', [self, ErrorMsg], Response);
end;

procedure TOpenapiClient.OnError4(const Sender: IJsonClient;
  const Response: TJsonResponse; const ErrorMsg: shortstring);
var
  e: EJsonClientClass;
begin
  case Response.Status of
    401:
      e := ENotAuthorized;
  else
    e := EJsonClient;
  end;
  raise e.CreateResp('%.%', [self, ErrorMsg], Response);
end;

procedure TOpenapiClient.OnError5(const Sender: IJsonClient;
  const Response: TJsonResponse; const ErrorMsg: shortstring);
var
  e: EJsonClientClass;
begin
  case Response.Status of
    401:
      e := ENotAuthorized;
    403:
      e := EForbidden;
    404:
      e := EResNotFound;
  else
    e := EUnknownError;
  end;
  raise e.CreateResp('%.%', [self, ErrorMsg], Response);
end;

procedure TOpenapiClient.OnError6(const Sender: IJsonClient;
  const Response: TJsonResponse; const ErrorMsg: shortstring);
var
  e: EJsonClientClass;
begin
  case Response.Status of
    401:
      e := ENotAuthorized;
    403:
      e := EForbidden;
    422:
      e := EValidationError;
  else
    e := EJsonClient;
  end;
  raise e.CreateResp('%.%', [self, ErrorMsg], Response);
end;

procedure TOpenapiClient.OnError7(const Sender: IJsonClient;
  const Response: TJsonResponse; const ErrorMsg: shortstring);
var
  e: EJsonClientClass;
begin
  case Response.Status of
    401:
      e := ENotAuthorized;
    403:
      e := EForbidden;
  else
    e := EJsonClient;
  end;
  raise e.CreateResp('%.%', [self, ErrorMsg], Response);
end;

procedure TOpenapiClient.OnError8(const Sender: IJsonClient;
  const Response: TJsonResponse; const ErrorMsg: shortstring);
var
  e: EJsonClientClass;
begin
  case Response.Status of
    401:
      e := ENotAuthorized;
    403:
      e := EForbidden;
    404:
      e := EResNotFound;
  else
    e := EJsonClient;
  end;
  raise e.CreateResp('%.%', [self, ErrorMsg], Response);
end;

procedure TOpenapiClient.OnError9(const Sender: IJsonClient;
  const Response: TJsonResponse; const ErrorMsg: shortstring);
var
  e: EJsonClientClass;
begin
  case Response.Status of
    401:
      e := ENotAuthorized;
    404:
      e := EResNotFound;
    422:
      e := EValidationError;
  else
    e := EJsonClient;
  end;
  raise e.CreateResp('%.%', [self, ErrorMsg], Response);
end;

function TOpenapiClient.IssuesList(const Format: TEnumOpenapi11; const StatusId: variant;
  const AssignedToId: variant; Offset: integer; Limit: integer; const Sort: TStringDynArray;
  const Include: TEnumOpenapi12Set; const IssueId: TIntegerDynArray; ProjectId: integer;
  const SubprojectId: TEnumOpenapi13; TrackerId: integer; QueryId: integer;
  ParentId: integer; const Cf_id:Integer;const CfX: string; AuthorId: integer; WatcherId: integer;
  ChildId: integer; MemberOfGroup: integer; AssignedToRole: integer; FixedVersionId: integer;
  CategoryId: integer; const Subject: string; const Description: string;
  const Notes: string; const ClosedOn: string; const StartDate: string;
  const DueDate: string; EstimatedHours: double; SpentTime: double; DoneRatio: double;
  IsPrivate: boolean; const Attachment: string; const AttachmentDescription: string;
  UpdatedBy: integer; LastUpdatedBy: integer; const RelationType: string;
  const CreatedOn: string; const UpdatedOn: string): TIssueList;
begin
  fClient.Request('GET', '/issues.%', [ENUMOPENAPI11_TXT[Format]], [
    'offset', Offset,
    'limit', Limit,
    'sort', RawUtf8ArrayToCsv(StringDynArrayToRawUtf8DynArray(Sort)),
    'include', GetSetNameCustom(TypeInfo(TEnumOpenapi12), Include, @ENUMOPENAPI12_TXT),
    'issue_id', IntegerDynArrayToCsv(IssueId),
    'project_id', ProjectId,
    'subproject_id', ENUMOPENAPI13_TXT[SubprojectId],
    'tracker_id', TrackerId,
    'query_id', QueryId,
    'status_id', StatusId,
    'assigned_to_id', AssignedToId,
    'parent_id', ParentId,
     StringReplaceAll('cf_x','x',IntToStr(Cf_id)),CfX,
    'author_id', AuthorId,
    'watcher_id', WatcherId,
    'child_id', ChildId,
    'member_of_group', MemberOfGroup,
    'assigned_to_role', AssignedToRole,
    'fixed_version_id', FixedVersionId,
    'category_id', CategoryId,
    'subject', Subject,
    'description', Description,
    'notes', Notes,
    'closed_on', ClosedOn,
    'start_date', StartDate,
    'due_date', DueDate,
    'estimated_hours', EstimatedHours,
    'spent_time', SpentTime,
    'done_ratio', DoneRatio,
    'is_private', IsPrivate,
    'attachment', Attachment,
    'attachment_description', AttachmentDescription,
    'updated_by', UpdatedBy,
    'last_updated_by', LastUpdatedBy,
    'relation_type', RelationType,
    'created_on', CreatedOn,
    'updated_on', UpdatedOn], [],
    result, TypeInfo(TIssueList), OnError1);
end;

procedure TOpenapiClient.IssueCreate(const Format: TEnumOpenapi11; const Payload: TIssueNew);
begin
  fClient.Request('POST', '/issues.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TIssueNew), nil, OnError2);
end;

function TOpenapiClient.IssueShow(IssueId: integer; const Format: TEnumOpenapi11;
  const Include: TEnumOpenapi14Set): TIssueShow;
begin
  fClient.Request('GET', '/issues/%.%', [IssueId, ENUMOPENAPI11_TXT[Format]], [
    'include', GetSetNameCustom(TypeInfo(TEnumOpenapi14), Include, @ENUMOPENAPI14_TXT)], [],
    result, TypeInfo(TIssueShow), OnError1);
end;

procedure TOpenapiClient.IssueUpdate(IssueId: integer; const Format: TEnumOpenapi11;
  const Payload: TIssueUpdate);
begin
  fClient.Request('PUT', '/issues/%.%', [IssueId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TIssueUpdate), nil, OnError2);
end;

procedure TOpenapiClient.IssueDelete(IssueId: integer; const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/issues/%.%', [IssueId, ENUMOPENAPI11_TXT[Format]], [], [], OnError3);
end;

function TOpenapiClient.RelationList(IssueId: integer; const Format: TEnumOpenapi11): TRelationList;
begin
  fClient.Request('GET', '/issues/%/relations.%', [IssueId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TRelationList), OnError1);
end;

procedure TOpenapiClient.RelationCreate(IssueId: integer; const Format: TEnumOpenapi11;
  const Payload: TRelationNew);
begin
  fClient.Request('POST', '/issues/%/relations.%', [IssueId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TRelationNew), nil, OnError2);
end;

procedure TOpenapiClient.WatcherAdd(IssueId: integer; const Format: TEnumOpenapi11;
  const Payload: TWatcherAdd);
begin
  fClient.Request('POST', '/issues/%/watchers.%', [IssueId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TWatcherAdd), nil, OnError4);
end;

procedure TOpenapiClient.WatcherDelete(IssueId: integer; const UserId: variant;
  const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/issues/%/watchers/%.%', [IssueId, UserId, ENUMOPENAPI11_TXT[Format]], [], [], OnError3);
end;

function TOpenapiClient.GroupList(const Format: TEnumOpenapi11): TGroupList;
begin
  fClient.Request('GET', '/groups.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TGroupList), OnError5);
end;

procedure TOpenapiClient.GroupCreate(const Format: TEnumOpenapi11; const Payload: TGroupNew);
begin
  fClient.Request('POST', '/groups.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TGroupNew), nil, OnError6);
end;

function TOpenapiClient.GroupShow(GroupId: integer; const Format: TEnumOpenapi11;
  const Include: TEnumOpenapi15Set): TGroupShow;
begin
  fClient.Request('GET', '/groups/%.%', [GroupId, ENUMOPENAPI11_TXT[Format]], [
    'include', GetSetNameCustom(TypeInfo(TEnumOpenapi15), Include, @ENUMOPENAPI15_TXT)], [],
    result, TypeInfo(TGroupShow), OnError5);
end;

procedure TOpenapiClient.GroupUpdate(GroupId: integer; const Format: TEnumOpenapi11;
  const Payload: TGroupUpdate);
begin
  fClient.Request('PUT', '/groups/%.%', [GroupId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TGroupUpdate), nil, OnError7);
end;

procedure TOpenapiClient.GroupDelete(GroupId: integer; const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/groups/%.%', [GroupId, ENUMOPENAPI11_TXT[Format]], [], [], OnError8);
end;

procedure TOpenapiClient.UserAdd(GroupId: integer; const Format: TEnumOpenapi11;
  const Payload: TUserAdd);
begin
  fClient.Request('POST', '/groups/%/users.%', [GroupId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TUserAdd), nil, OnError7);
end;

procedure TOpenapiClient.DeleteGroupsGroupIdUsersUserIdFormat(GroupId: integer;
  const UserId: variant; const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/groups/%/users/%.%', [GroupId, UserId, ENUMOPENAPI11_TXT[Format]], [], [], OnError8);
end;

function TOpenapiClient.StatusesList(const Format: TEnumOpenapi11): TIssueStatusesList;
begin
  fClient.Request('GET', '/issue_statuses.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TIssueStatusesList), OnError1);
end;

function TOpenapiClient.TrackersList(const Format: TEnumOpenapi11): TTrackerList;
begin
  fClient.Request('GET', '/trackers.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TTrackerList), OnError1);
end;

function TOpenapiClient.UsersList(const Format: TEnumOpenapi11; Offset: integer;
  Limit: integer; const Status: TEnumOpenapi16; const Name: string; GroupId: integer): TUserList;
begin
  fClient.Request('GET', '/users.%', [ENUMOPENAPI11_TXT[Format]], [
    'offset', Offset,
    'limit', Limit,
    'status', ENUMOPENAPI16_TXT[Status],
    'name', Name,
    'group_id', GroupId], [],
    result, TypeInfo(TUserList), OnError5);
end;

procedure TOpenapiClient.UserCreate(const Format: TEnumOpenapi11; const Payload: TUserNew);
begin
  fClient.Request('POST', '/users.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TUserNew), nil, OnError6);
end;

function TOpenapiClient.UserShow(const UserId: variant; const Format: TEnumOpenapi11;
  const Include: TEnumOpenapi17Set): TUserShow;
begin
  fClient.Request('GET', '/users/%.%', [UserId, ENUMOPENAPI11_TXT[Format]], [
    'include', GetSetNameCustom(TypeInfo(TEnumOpenapi17), Include, @ENUMOPENAPI17_TXT)], [],
    result, TypeInfo(TUserShow), OnError5);
end;

procedure TOpenapiClient.UserUpdate(const UserId: variant; const Format: TEnumOpenapi11;
  const Payload: TUserUpdate);
begin
  fClient.Request('PUT', '/users/%.%', [UserId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TUserUpdate), nil, OnError7);
end;

procedure TOpenapiClient.UserDelete(const UserId: variant; const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/users/%.%', [UserId, ENUMOPENAPI11_TXT[Format]], [], [], OnError8);
end;

function TOpenapiClient.VersionShow(VersionId: integer; const Format: TEnumOpenapi11): TVersionShow;
begin
  fClient.Request('GET', '/versions/%.%', [VersionId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TVersionShow), OnError1);
end;

procedure TOpenapiClient.VersionUpdate(VersionId: integer; const Format: TEnumOpenapi11;
  const Payload: TVersionUpdate);
begin
  fClient.Request('PUT', '/versions/%.%', [VersionId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TVersionUpdate), nil, OnError2);
end;

procedure TOpenapiClient.VersionDelete(VersionId: integer; const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/versions/%.%', [VersionId, ENUMOPENAPI11_TXT[Format]], [], [], OnError9);
end;

function TOpenapiClient.ChecklistList(IssueId: integer; const Format: TEnumOpenapi11): TCheckListList;
begin
  fClient.Request('GET', '/issues/%/checklists.%', [IssueId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TCheckListList), OnError1);
end;

procedure TOpenapiClient.CheckListCreate(IssueId: integer; const Format: TEnumOpenapi11;
  const Payload: TCheckListNew);
begin
  fClient.Request('POST', '/issues/%/checklists.%', [IssueId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TCheckListNew), nil, OnError4);
end;

function TOpenapiClient.CustomFieldList(const Format: TEnumOpenapi11): TCustomFieldsList;
begin
  fClient.Request('GET', '/custom_fields.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TCustomFieldsList), OnError5);
end;

procedure TOpenapiClient.ChecklistUpdate(ChecklistId: integer; const Format: TEnumOpenapi11;
  const Payload: TCheckListUpdate);
begin
  fClient.Request('PUT', '/checklists/%.%', [ChecklistId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TCheckListUpdate), nil, OnError4);
end;

function TOpenapiClient.EnumList(const _Type: TEnumOpenapi18; const Format: TEnumOpenapi11): TEnumList;
begin
  fClient.Request('GET', '/enumerations/%.%', [ENUMOPENAPI18_TXT[_Type], ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TEnumList), OnError1);
end;

function TOpenapiClient.ProjectsList(const Format: TEnumOpenapi11; Offset: integer;
  Limit: integer; const Include: TEnumOpenapi19Set): TProjectList;
begin
  fClient.Request('GET', '/projects.%', [ENUMOPENAPI11_TXT[Format]], [
    'offset', Offset,
    'limit', Limit,
    'include', GetSetNameCustom(TypeInfo(TEnumOpenapi19), Include, @ENUMOPENAPI19_TXT)], [],
    result, TypeInfo(TProjectList), OnError1);
end;

procedure TOpenapiClient.ProjectCreate(const Format: TEnumOpenapi11; const Payload: TProjectNew);
begin
  fClient.Request('POST', '/projects.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TProjectNew), nil, OnError2);
end;

function TOpenapiClient.ProjectShow(const ProjectId: variant; const Format: TEnumOpenapi11;
  const Include: TEnumOpenapi19Set): TProjectShow;
begin
  fClient.Request('GET', '/projects/%.%', [ProjectId, ENUMOPENAPI11_TXT[Format]], [
    'include', GetSetNameCustom(TypeInfo(TEnumOpenapi19), Include, @ENUMOPENAPI19_TXT)], [],
    result, TypeInfo(TProjectShow), OnError1);
end;

procedure TOpenapiClient.ProjectUpdate(const ProjectId: variant; const Format: TEnumOpenapi11;
  const Payload: TProjectUpdate);
begin
  fClient.Request('PUT', '/projects/%.%', [ProjectId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TProjectUpdate), nil, OnError4);
end;

procedure TOpenapiClient.ProjectDelete(const ProjectId: variant; const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/projects/%.%', [ProjectId, ENUMOPENAPI11_TXT[Format]], [], [], OnError3);
end;

function TOpenapiClient.VersionList(const ProjectId: variant; const Format: TEnumOpenapi11): TVersionList;
begin
  fClient.Request('GET', '/projects/%/versions.%', [ProjectId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TVersionList), OnError1);
end;

procedure TOpenapiClient.VersionCreate(const ProjectId: variant; const Format: TEnumOpenapi11;
  const Payload: TVersionNew);
begin
  fClient.Request('POST', '/projects/%/versions.%', [ProjectId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TVersionNew), nil, OnError2);
end;

function TOpenapiClient.IssueCategoryShow(IssueCategoryId: integer; const Format: TEnumOpenapi11): TIssueCategoryShow;
begin
  fClient.Request('GET', '/issue_categories/%.%', [IssueCategoryId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TIssueCategoryShow), OnError1);
end;

procedure TOpenapiClient.IssueCategoryUpdate(IssueCategoryId: integer;
  const Format: TEnumOpenapi11; const Payload: TIssueCategoryUpdate);
begin
  fClient.Request('PUT', '/issue_categories/%.%', [IssueCategoryId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TIssueCategoryUpdate), nil, OnError2);
end;

procedure TOpenapiClient.IssueCategoryDelete(IssueCategoryId: integer;
  const Format: TEnumOpenapi11; ReassignToId: integer);
begin
  fClient.Request('DELETE', '/issue_categories/%.%', [IssueCategoryId, ENUMOPENAPI11_TXT[Format]], [
    'reassign_to_id ', ReassignToId], [], OnError3);
end;

function TOpenapiClient.IssueCategoryList(const ProjectId: variant; const Format: TEnumOpenapi11): TIssueCategoryList;
begin
  fClient.Request('GET', '/projects/%/issue_categories.%', [ProjectId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TIssueCategoryList), OnError1);
end;

procedure TOpenapiClient.IssueCategoryCreate(const ProjectId: variant;
  const Format: TEnumOpenapi11);
begin
  fClient.Request('POST', '/projects/%/issue_categories.%', [ProjectId, ENUMOPENAPI11_TXT[Format]], [], [], OnError2);
end;

function TOpenapiClient.MemberShipList(const ProjectId: variant; const Format: TEnumOpenapi11): TMemberShipList;
begin
  fClient.Request('GET', '/projects/%/memberships.%', [ProjectId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TMemberShipList), OnError1);
end;

procedure TOpenapiClient.MemberShipAdd(const ProjectId: variant; const Format: TEnumOpenapi11;
  const Payload: TMemberShipAdd);
begin
  fClient.Request('POST', '/projects/%/memberships.%', [ProjectId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TMemberShipAdd), nil, OnError2);
end;

function TOpenapiClient.AccountShow(const Format: TEnumOpenapi11): TAccountShow;
begin
  fClient.Request('GET', '/my/account.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TAccountShow), OnError1);
end;

procedure TOpenapiClient.AccountUpdate(const Format: TEnumOpenapi11; const Payload: TAccountUpdate);
begin
  fClient.Request('PUT', '/my/account.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TAccountUpdate), nil, OnError2);
end;

procedure TOpenapiClient.JournalUpdate(JournalId: integer; const Format: TEnumOpenapi11;
  const Payload: TJournalUpdate);
begin
  fClient.Request('PUT', '/journals/%.%', [JournalId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TJournalUpdate), nil, OnError4);
end;

function TOpenapiClient.TimeList(const Format: TEnumOpenapi11; const ProjectId: variant;
  const UserId: variant; Offset: integer; Limit: integer; SubprojectId: integer;
  const SpentOn: string; const From: string; const _To: string; IssueId: integer;
  AuthorId: integer; ActivityId: integer; const Comments: string; const Hours: string;
  const Sort: string): TTimeList;
begin
  fClient.Request('GET', '/time_entries.%', [ENUMOPENAPI11_TXT[Format]], [
    'offset', Offset,
    'limit', Limit,
    'project_id', ProjectId,
    'subproject_id', SubprojectId,
    'user_id', UserId,
    'spent_on', SpentOn,
    'from', From,
    'to', _To,
    'issue_id', IssueId,
    'author_id', AuthorId,
    'activity_id', ActivityId,
    'comments', Comments,
    'hours', Hours,
    'sort', Sort], [],
    result, TypeInfo(TTimeList), OnError1);
end;

procedure TOpenapiClient.TimeCreate(const Format: TEnumOpenapi11; const Payload: TTimeNewUpdate);
begin
  fClient.Request('POST', '/time_entries.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TTimeNewUpdate), nil, OnError2);
end;

function TOpenapiClient.TimeShow(EntryId: integer; const Format: TEnumOpenapi11): TTimeShow;
begin
  fClient.Request('GET', '/time_entries/%.%', [EntryId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TTimeShow), OnError1);
end;

procedure TOpenapiClient.TimeUpdate(EntryId: integer; const Format: TEnumOpenapi11;
  const Payload: TTimeNewUpdate);
begin
  fClient.Request('PUT', '/time_entries/%.%', [EntryId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TTimeNewUpdate), nil, OnError2);
end;

procedure TOpenapiClient.TimeDelete(EntryId: integer; const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/time_entries/%.%', [EntryId, ENUMOPENAPI11_TXT[Format]], [], [], OnError3);
end;

function TOpenapiClient.MemberShipShow(MembershipId: integer; const Format: TEnumOpenapi11): TMemberShipShow;
begin
  fClient.Request('GET', '/memberships/%.%', [MembershipId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TMemberShipShow), OnError1);
end;

procedure TOpenapiClient.MemberShipUpdate(MembershipId: integer; const Format: TEnumOpenapi11;
  const Payload: TMemberShipUpdate);
begin
  fClient.Request('PUT', '/memberships/%.%', [MembershipId, ENUMOPENAPI11_TXT[Format]], [], [],
    Payload, {dummy:}self, TypeInfo(TMemberShipUpdate), nil, OnError2);
end;

procedure TOpenapiClient.MemberShipDelete(MembershipId: integer; const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/memberships/%.%', [MembershipId, ENUMOPENAPI11_TXT[Format]], [], [], OnError9);
end;

function TOpenapiClient.RelationShow(RelationId: integer; const Format: TEnumOpenapi11): TRelationShow;
begin
  fClient.Request('GET', '/relations/%.%', [RelationId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TRelationShow), OnError1);
end;

procedure TOpenapiClient.RelationDelete(RelationId: integer; const Format: TEnumOpenapi11);
begin
  fClient.Request('DELETE', '/relations/%.%', [RelationId, ENUMOPENAPI11_TXT[Format]], [], [], OnError2);
end;

function TOpenapiClient.Search(const Format: TEnumOpenapi11; Offset: integer;
  Limit: integer; const Q: string; const Scope: TEnumOpenapi20; AllWords: integer;
  TitlesOnly: integer; Issues: integer; News: integer; Documents: integer;
  Changesets: integer; WikiPages: integer; Messages: integer; Projects: integer;
  OpenIssues: integer; Attachments: integer): TDtoOpenapi38;
begin
  fClient.Request('GET', '/search.%', [ENUMOPENAPI11_TXT[Format]], [
    'offset', Offset,
    'limit', Limit,
    'q', Q,
    'scope', ENUMOPENAPI20_TXT[Scope],
    'all_words', AllWords,
    'titles_only', TitlesOnly,
    'issues', Issues,
    'news', News,
    'documents', Documents,
    'changesets', Changesets,
    'wiki_pages', WikiPages,
    'messages', Messages,
    'projects', Projects,
    'open_issues', OpenIssues,
    'attachments', Attachments], [],
    result, TypeInfo(TDtoOpenapi38), OnError1);
end;

function TOpenapiClient.QueriesList(const Format: TEnumOpenapi11): TQueriesList;
begin
  fClient.Request('GET', '/queries.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TQueriesList), OnError1);
end;

function TOpenapiClient.RolesList(const Format: TEnumOpenapi11): TRolesList;
begin
  fClient.Request('GET', '/roles.%', [ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TRolesList), OnError1);
end;

function TOpenapiClient.RoleShow(RoleId: integer; const Format: TEnumOpenapi11): TRoleShow;
begin
  fClient.Request('GET', '/roles/%.%', [RoleId, ENUMOPENAPI11_TXT[Format]], [], [],
    result, TypeInfo(TRoleShow), OnError1);
end;


end.
