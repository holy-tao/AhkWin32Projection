#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITaskFolder.ahk
#Include .\ITaskFolderCollection.ahk
#Include .\IRegisteredTask.ahk
#Include .\IRegisteredTaskCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods that are used to register (create) tasks in the folder, remove tasks from the folder, and create or remove subfolders from the folder.
 * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nn-taskschd-itaskfolder
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskFolder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskFolder
     * @type {Guid}
     */
    static IID => Guid("{8cfac062-a080-4c15-9a88-aa7c2af80dfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Path", "GetFolder", "GetFolders", "CreateFolder", "DeleteFolder", "GetTask", "GetTasks", "DeleteTask", "RegisterTask", "RegisterTaskDefinition", "GetSecurityDescriptor", "SetSecurityDescriptor"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the name that is used to identify the folder that contains a task.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pName
    }

    /**
     * Gets the path to where the folder is stored.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-get_path
     */
    get_Path() {
        pPath := BSTR()
        result := ComCall(8, this, "ptr", pPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPath
    }

    /**
     * Gets a folder that contains tasks at a specified location.
     * @param {BSTR} path_ The path (location) to the folder. Do not use a backslash following the last folder name in the path. The root task folder is specified with a backslash (\\). An example of a task folder path, under the root task folder,
     *  is \MyTaskFolder. The '.' character  cannot be used to specify the current task folder  and the '..' characters cannot be used to specify the parent task folder in the path.
     * @returns {ITaskFolder} The folder at the specified location.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskfolder">ITaskFolder</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-getfolder
     */
    GetFolder(path_) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(9, this, "ptr", path_, "ptr*", &ppFolder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITaskFolder(ppFolder)
    }

    /**
     * Gets all the subfolders in the folder.
     * @param {Integer} flags This parameter is reserved for future use and must be set to 0.
     * @returns {ITaskFolderCollection} The collection of subfolders in the folder.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskfoldercollection">ITaskFolderCollection</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-getfolders
     */
    GetFolders(flags) {
        result := ComCall(10, this, "int", flags, "ptr*", &ppFolders := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITaskFolderCollection(ppFolders)
    }

    /**
     * Creates a folder for related tasks.
     * @remarks
     * To retrieve the subfolders of the parent folder, use the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-getfolders">GetFolders</a> method.
     * 
     * The <b>CreateFolder</b> method will return 0x800700b7 if the folder that you are trying to create already exists.
     * 
     * Specifying an invalid security descriptor in the <i>sddl</i> parameter will cause this method to return <b>E_INVALIDARG</b>.
     * @param {BSTR} subFolderName The name used to identify the folder. If "FolderName\SubFolder1\SubFolder2" is specified, the entire folder tree will be created if the folders do not exist. This parameter can be a relative path to the current <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskfolder">ITaskFolder</a> instance. The root task folder is specified with a backslash (\\). An example of a task folder path, under the root task folder,
     *  is \MyTaskFolder. The '.' character  cannot be used to specify the current task folder  and the '..' characters cannot be used to specify the parent task folder in the path.
     * @param {VARIANT} sddl The security descriptor associated with the folder, in the form of a VT_BSTR in SDDL_REVISION_1 format.
     * @returns {ITaskFolder} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskfolder">ITaskFolder</a> interface that represents the new subfolder.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskfolder">ITaskFolder</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-createfolder
     */
    CreateFolder(subFolderName, sddl) {
        if(subFolderName is String) {
            pin := BSTR.Alloc(subFolderName)
            subFolderName := pin.Value
        }

        result := ComCall(11, this, "ptr", subFolderName, "ptr", sddl, "ptr*", &ppFolder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITaskFolder(ppFolder)
    }

    /**
     * Deletes a subfolder from the parent folder.
     * @param {BSTR} subFolderName The name of the subfolder to be removed. The root task folder is specified with a backslash (\\). This parameter can be a relative path to the folder you want to delete. An example of a task folder path, under the root task folder,
     *  is \MyTaskFolder. The '.' character  cannot be used to specify the current task folder  and the '..' characters cannot be used to specify the parent task folder in the path.
     * @param {Integer} flags Not supported.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-deletefolder
     */
    DeleteFolder(subFolderName, flags) {
        if(subFolderName is String) {
            pin := BSTR.Alloc(subFolderName)
            subFolderName := pin.Value
        }

        result := ComCall(12, this, "ptr", subFolderName, "int", flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a task at a specified location in a folder.
     * @param {BSTR} path_ The path (location) to the task in a folder. The root task folder is specified with a backslash (\\). An example of a task folder path, under the root task folder,
     *  is \MyTaskFolder. The '.' character  cannot be used to specify the current task folder  and the '..' characters cannot be used to specify the parent task folder in the path.
     * @returns {IRegisteredTask} The task at the specified location.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iregisteredtask">IRegisteredTask</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-gettask
     */
    GetTask(path_) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(13, this, "ptr", path_, "ptr*", &ppTask := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRegisteredTask(ppTask)
    }

    /**
     * Gets all the tasks in the folder.
     * @param {Integer} flags Specifies whether to retrieve hidden tasks. Pass in TASK_ENUM_HIDDEN to retrieve all tasks in the folder including hidden tasks, and pass in 0 to retrieve all the tasks in the folder excluding the hidden tasks.
     * @returns {IRegisteredTaskCollection} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iregisteredtaskcollection">IRegisteredTaskCollection</a> collection of all the tasks in the folder.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iregisteredtaskcollection">IRegisteredTaskCollection</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-gettasks
     */
    GetTasks(flags) {
        result := ComCall(14, this, "int", flags, "ptr*", &ppTasks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRegisteredTaskCollection(ppTasks)
    }

    /**
     * Deletes a task from the folder.
     * @param {BSTR} name The name of the task that is specified when the task was registered. The '.' character  cannot be used to specify the current task folder  and the '..' characters cannot be used to specify the parent task folder in the path.
     * @param {Integer} flags Not supported.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-deletetask
     */
    DeleteTask(name, flags) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(15, this, "ptr", name, "int", flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers (creates) a new task in the folder using XML to define the task.
     * @remarks
     * For a task, that contains a message box action, the message box will be displayed if the task is activated and the task has an interactive logon type.  To set the task logon type to be interactive, specify <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or  <b>TASK_LOGON_GROUP</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> property of the task principal, or in the <i>logonType</i> parameter of <b>ITaskFolder::RegisterTask</b> or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertaskdefinition">ITaskFolder::RegisterTaskDefinition</a>. 
     * 
     * Only a member of the Administrators group can create a task with a boot trigger.
     * 
     * You can successfully register a task with a group specified in the <i>userId</i> parameter and <b>TASK_LOGON_INTERACTIVE_TOKEN</b> specified in the <i>logonType</i> parameter of <b>ITaskFolder::RegisterTask</b> or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertaskdefinition">ITaskFolder::RegisterTaskDefinition</a>, but the task will not run.
     * 
     * Passing the TASK_VALIDATE_ONLY and TASK_IGNORE_REGISTRATION_TRIGGERS values together to the <i>flags</i> parameter is an invalid argument.
     * 
     * If a task defines a network that does not exist in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_networksettings">NetworkSettings</a> settings of the task, the <b>ITaskFolder::RegisterTask</b>  method will return error 0x8000ffff when the task is registered.
     * @param {BSTR} path_ The task name. If this value is <b>NULL</b>, the task will be registered in the root task folder and the task name will be a GUID value that is created by the Task Scheduler service.
     * 
     * A task name cannot begin or end with a space character. The '.' character  cannot be used to specify the current task folder  and the '..' characters cannot be used to specify the parent task folder in the path.
     * @param {BSTR} xmlText An XML-formatted definition of the task.
     * 
     * The following topics contain tasks defined using XML.<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/time-trigger-example--xml-">Time Trigger Example (XML)</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/aa446889(v=vs.85)">Event Trigger Example (XML)</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/daily-trigger-example--xml-">Daily Trigger Example (XML)</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/registration-trigger-example--xml-">Registration Trigger Example (XML)</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/weekly-trigger-example--xml-">Weekly Trigger Example (XML)</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/logon-trigger-example--xml-">Logon Trigger Example (XML)</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/boot-trigger-example--xml-">Boot Trigger Example (XML)</a>
     * </li>
     * </ul>
     * @param {Integer} flags A <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/ne-taskschd-task_creation">TASK_CREATION</a> constant.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_VALIDATE_ONLY"></a><a id="task_validate_only"></a><dl>
     * <dt><b>TASK_VALIDATE_ONLY</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Task Scheduler verifies the syntax of the XML that describes the task, but does not register the task. This constant cannot be combined with the <b>TASK_CREATE</b>, <b>TASK_UPDATE</b>, or  <b>TASK_CREATE_OR_UPDATE</b> values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_CREATE"></a><a id="task_create"></a><dl>
     * <dt><b>TASK_CREATE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler registers the task as a new task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_UPDATE"></a><a id="task_update"></a><dl>
     * <dt><b>TASK_UPDATE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler registers the task as an updated version of an existing task. When a task with a registration trigger is updated, the task will execute after the update occurs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_CREATE_OR_UPDATE"></a><a id="task_create_or_update"></a><dl>
     * <dt><b>TASK_CREATE_OR_UPDATE</b></dt>
     * <dt>0x6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler either registers the task as a new task or as an updated version if the task already exists. Equivalent to TASK_CREATE | TASK_UPDATE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_DISABLE"></a><a id="task_disable"></a><dl>
     * <dt><b>TASK_DISABLE</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler disables the existing task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_DONT_ADD_PRINCIPAL_ACE"></a><a id="task_dont_add_principal_ace"></a><dl>
     * <dt><b>TASK_DONT_ADD_PRINCIPAL_ACE</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler is prevented from adding the allow access-control entry (ACE) for the context principal. When the <b>ITaskFolder::RegisterTask</b> function is called with this flag to update a task, the Task Scheduler service does not add the ACE for the new context principal and does not remove the ACE from the old context principal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_IGNORE_REGISTRATION_TRIGGERS"></a><a id="task_ignore_registration_triggers"></a><dl>
     * <dt><b>TASK_IGNORE_REGISTRATION_TRIGGERS</b></dt>
     * <dt>0x20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Task Scheduler creates the task, but ignores the registration triggers in the task. By ignoring the registration triggers, the task will not execute when it is registered unless a time-based trigger causes it to execute on registration.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} userId The user credentials used to register the task.
     * 
     * <div class="alert"><b>Note</b>  If the task is defined as a Task Scheduler 1.0 task, then do not use a group name (rather than a specific user name) in this userId parameter. A task is defined as a Task Scheduler 1.0 task when the version attribute of the Task element in the task's XML is set to 1.1.</div>
     * <div> </div>
     * @param {VARIANT} password The password for the userId used to register the task. When the TASK_LOGON_SERVICE_ACCOUNT logon type is used, the password must be an empty <b>VARIANT</b> value such as <b>VT_NULL</b> or <b>VT_EMPTY</b>.
     * @param {Integer} logonType A value that defines what logon technique is used to run the registered task.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_NONE"></a><a id="task_logon_none"></a><dl>
     * <dt><b>TASK_LOGON_NONE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon method is not specified. Used for non-NT credentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_PASSWORD"></a><a id="task_logon_password"></a><dl>
     * <dt><b>TASK_LOGON_PASSWORD</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use a password for logging on the user. The password must be supplied at registration time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_S4U"></a><a id="task_logon_s4u"></a><dl>
     * <dt><b>TASK_LOGON_S4U</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use an existing interactive token to run a task. The user must log on using a service for user (S4U) logon. When an S4U logon is used, no password is stored by the system and there is no access to either the network or  to encrypted files.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_INTERACTIVE_TOKEN"></a><a id="task_logon_interactive_token"></a><dl>
     * <dt><b>TASK_LOGON_INTERACTIVE_TOKEN</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  User must already be logged on. The task will be run only in an existing interactive session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_GROUP"></a><a id="task_logon_group"></a><dl>
     * <dt><b>TASK_LOGON_GROUP</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group activation. The <b>groupId</b> field specifies the group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_SERVICE_ACCOUNT"></a><a id="task_logon_service_account"></a><dl>
     * <dt><b>TASK_LOGON_SERVICE_ACCOUNT</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a Local System, Local Service, or Network Service account is used as a security context to run the task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD"></a><a id="task_logon_interactive_token_or_password"></a><dl>
     * <dt><b>TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * First use the interactive token.  If the user is not logged on (no interactive token is available), then the password is used.  The password must be specified when a task is registered. This flag is not recommended for new tasks because it is less reliable than <b>TASK_LOGON_PASSWORD</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} sddl The security descriptor associated with the registered task. You can specify the access control list (ACL) in the security descriptor for a task in order to allow or deny certain users and groups access to a task.
     * 
     * <div class="alert"><b>Note</b>   If the Local System account is denied access to a task, then the Task Scheduler service can produce unexpected results.</div>
     * <div> </div>
     * @returns {IRegisteredTask} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iregisteredtask">IRegisteredTask</a> interface that represents the new task.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iregisteredtask">IRegisteredTask</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-registertask
     */
    RegisterTask(path_, xmlText, flags, userId, password, logonType, sddl) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }
        if(xmlText is String) {
            pin := BSTR.Alloc(xmlText)
            xmlText := pin.Value
        }

        result := ComCall(16, this, "ptr", path_, "ptr", xmlText, "int", flags, "ptr", userId, "ptr", password, "int", logonType, "ptr", sddl, "ptr*", &ppTask := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRegisteredTask(ppTask)
    }

    /**
     * Registers (creates) a task in a specified location using the ITaskDefinition interface to define a task.
     * @remarks
     * For a task, that contains a message box action, the message box will be displayed if the task is activated and the task has an interactive logon type.  To set the task logon type to be interactive, specify <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or  <b>TASK_LOGON_GROUP</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> property of the task principal, or in the <i>logonType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertask">ITaskFolder::RegisterTask</a> or <b>ITaskFolder::RegisterTaskDefinition</b>. 
     * 
     * Only a member of the Administrators group can create a task with a boot trigger.
     * 
     * You can successfully register a task with a group specified in the <i>userId</i> parameter and <b>TASK_LOGON_INTERACTIVE_TOKEN</b> specified in the <i>logonType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertask">ITaskFolder::RegisterTask</a> or <b>ITaskFolder::RegisterTaskDefinition</b>, but the task will not run.
     * 
     * Passing the TASK_VALIDATE_ONLY and TASK_IGNORE_REGISTRATION_TRIGGERS values together to the <i>flags</i> parameter is an invalid argument.
     * 
     * The <b>ITaskFolder::RegisterTaskDefinition</b> method returns error  80070534 when called by the System account with the <i>user</i> parameter equal to <b>NULL</b>, the <i>password</i> parameter equal to <b>NULL</b>, and the <i>logonType</i> parameter equal to TASK_LOGON_SERVICE_ACCOUNT.
     * 
     * 
     * If a task defines a network that does not exist in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_networksettings">NetworkSettings</a> settings of the task, the <b>ITaskFolder::RegisterTaskDefinition</b>  method will return error 0x8000ffff when the task is registered.
     * @param {BSTR} path_ The name of the task. If this value is <b>NULL</b>, the task will be registered in the root task folder and the task name will be a GUID value created by the Task Scheduler service.
     * 
     * A task name cannot begin or end with a space character. The '.' character  cannot be used to specify the current task folder  and the '..' characters cannot be used to specify the parent task folder in the path.
     * @param {ITaskDefinition} pDefinition The definition of the registered task.
     * @param {Integer} flags A <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/ne-taskschd-task_creation">TASK_CREATION</a> constant.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_VALIDATE_ONLY"></a><a id="task_validate_only"></a><dl>
     * <dt><b>TASK_VALIDATE_ONLY</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler verifies the syntax of the XML that describes the task, but does not register the task. This constant cannot be combined with the <b>TASK_CREATE</b>, <b>TASK_UPDATE</b>, or  <b>TASK_CREATE_OR_UPDATE</b> values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_CREATE"></a><a id="task_create"></a><dl>
     * <dt><b>TASK_CREATE</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler registers the task as a new task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_UPDATE"></a><a id="task_update"></a><dl>
     * <dt><b>TASK_UPDATE</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler registers the task as an updated version of an existing task. When a task with a registration trigger is updated, the task will execute after the update occurs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_CREATE_OR_UPDATE"></a><a id="task_create_or_update"></a><dl>
     * <dt><b>TASK_CREATE_OR_UPDATE</b></dt>
     * <dt>0x6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler either registers the task as a new task or as an updated version if the task already exists. Equivalent to TASK_CREATE | TASK_UPDATE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_DISABLE"></a><a id="task_disable"></a><dl>
     * <dt><b>TASK_DISABLE</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler disables the existing task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_DONT_ADD_PRINCIPAL_ACE"></a><a id="task_dont_add_principal_ace"></a><dl>
     * <dt><b>TASK_DONT_ADD_PRINCIPAL_ACE</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Task Scheduler is prevented from adding the allow access-control entry (ACE) for the context principal. When the <b>ITaskFolder::RegisterTaskDefinition</b> function is called with this flag to update a task, the Task Scheduler service does not add the ACE for the new context principal and does not remove the ACE from the old context principal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_IGNORE_REGISTRATION_TRIGGERS"></a><a id="task_ignore_registration_triggers"></a><dl>
     * <dt><b>TASK_IGNORE_REGISTRATION_TRIGGERS</b></dt>
     * <dt>0x20</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Task Scheduler creates the task, but ignores the registration triggers in the task. By ignoring the registration triggers, the task will not execute when it is registered unless a time-based trigger causes it to execute on registration.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} userId The user credentials used to register the task. If present, these credentials take priority over the credentials specified in the task definition object pointed to by the <i>pDefinition</i> parameter.
     * 
     * <div class="alert"><b>Note</b>  If the task is defined as a Task Scheduler 1.0 task, then do not use a group name (rather than a specific user name) in this userId parameter. A task is defined as a Task Scheduler 1.0 task when the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_compatibility">Compatibility</a> property is set to TASK_COMPATIBILITY_V1 in the task's settings.</div>
     * <div> </div>
     * @param {VARIANT} password The password for the userId used to register the task. When the TASK_LOGON_SERVICE_ACCOUNT logon type is used, the password must be an empty <b>VARIANT</b> value such as <b>VT_NULL</b> or <b>VT_EMPTY</b>.
     * @param {Integer} logonType Defines what logon technique is used to run the registered task.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_NONE"></a><a id="task_logon_none"></a><dl>
     * <dt><b>TASK_LOGON_NONE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The logon method is not specified. Used for non-NT credentials.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_PASSWORD"></a><a id="task_logon_password"></a><dl>
     * <dt><b>TASK_LOGON_PASSWORD</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use a password for logging on the user. The password must be supplied at registration time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_S4U"></a><a id="task_logon_s4u"></a><dl>
     * <dt><b>TASK_LOGON_S4U</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use an existing interactive token to run a task. The user must log on using a service for user (S4U) logon. When an S4U logon is used, no password is stored by the system and there is no access to either the network or  to encrypted files.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_INTERACTIVE_TOKEN"></a><a id="task_logon_interactive_token"></a><dl>
     * <dt><b>TASK_LOGON_INTERACTIVE_TOKEN</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  User must already be logged on. The task will be run only in an existing interactive session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_GROUP"></a><a id="task_logon_group"></a><dl>
     * <dt><b>TASK_LOGON_GROUP</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Group activation. The <b>groupId</b> field specifies the group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_SERVICE_ACCOUNT"></a><a id="task_logon_service_account"></a><dl>
     * <dt><b>TASK_LOGON_SERVICE_ACCOUNT</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a Local System, Local Service, or Network Service account is being used as a security context to run the task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD"></a><a id="task_logon_interactive_token_or_password"></a><dl>
     * <dt><b>TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * First use the interactive token.  If the user is not logged on (no interactive token is available), then the password is used.  The password must be specified when a task is registered. This flag is not recommended for new tasks because it is less reliable than TASK_LOGON_PASSWORD.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT} sddl The security descriptor that is associated with the registered task. You can specify the access control list (ACL) in the security descriptor for a task in order to allow or deny certain users and groups access to a task.
     * 
     * <div class="alert"><b>Note</b>   If the Local System account is denied access to a task, then the Task Scheduler service can produce unexpected results.</div>
     * <div> </div>
     * @returns {IRegisteredTask} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iregisteredtask">IRegisteredTask</a> interface that represents the new task.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iregisteredtask">IRegisteredTask</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-registertaskdefinition
     */
    RegisterTaskDefinition(path_, pDefinition, flags, userId, password, logonType, sddl) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(17, this, "ptr", path_, "ptr", pDefinition, "int", flags, "ptr", userId, "ptr", password, "int", logonType, "ptr", sddl, "ptr*", &ppTask := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRegisteredTask(ppTask)
    }

    /**
     * Gets the security descriptor for the folder.
     * @param {Integer} securityInformation The security information from <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a>.
     * @returns {BSTR} The security descriptor for the folder.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-getsecuritydescriptor
     */
    GetSecurityDescriptor(securityInformation) {
        pSddl := BSTR()
        result := ComCall(18, this, "int", securityInformation, "ptr", pSddl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSddl
    }

    /**
     * Sets the security descriptor for the folder.
     * @remarks
     * You can specify the access control list (ACL) in the security descriptor for a task folder in order to allow or deny certain users and groups access to a task folder.
     * @param {BSTR} sddl The security descriptor for the folder.
     * 
     * <div class="alert"><b>Note</b>   If the Local System account is denied access to a task folder, then the Task Scheduler service can produce unexpected results.</div>
     * <div> </div>
     * @param {Integer} flags A value that specifies how the security descriptor is set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-itaskfolder-setsecuritydescriptor
     */
    SetSecurityDescriptor(sddl, flags) {
        if(sddl is String) {
            pin := BSTR.Alloc(sddl)
            sddl := pin.Value
        }

        result := ComCall(19, this, "ptr", sddl, "int", flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
