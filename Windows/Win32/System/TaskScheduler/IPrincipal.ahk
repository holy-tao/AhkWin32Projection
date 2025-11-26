#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the security credentials for a principal.
 * @remarks
 * 
 * When specifying an account, remember to properly use the double backslash in code to specify the domain and user name. For example, use DOMAIN\\UserName to specify a value for the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
 * 
 * When reading or writing XML for a task, the security credentials for a principal are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-principal-principaltype-element">Principal</a> element of the Task Scheduler schema.
 * 
 * If a task is registered using the at.exe command line tool, and this interface is used to retrieve information about the task, then the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> property will return 0, the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_runlevel">RunLevel</a> property will return 0, and the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property will return <b>NULL</b>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iprincipal
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IPrincipal extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrincipal
     * @type {Guid}
     */
    static IID => Guid("{d98d51e5-c9b4-496a-a9c1-18980261cf0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "put_Id", "get_DisplayName", "put_DisplayName", "get_UserId", "put_UserId", "get_LogonType", "put_LogonType", "get_GroupId", "put_GroupId", "get_RunLevel", "put_RunLevel"]

    /**
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     */
    UserId {
        get => this.get_UserId()
        set => this.put_UserId(value)
    }

    /**
     */
    LogonType {
        get => this.get_LogonType()
        set => this.put_LogonType(value)
    }

    /**
     */
    GroupId {
        get => this.get_GroupId()
        set => this.put_GroupId(value)
    }

    /**
     */
    RunLevel {
        get => this.get_RunLevel()
        set => this.put_RunLevel(value)
    }

    /**
     * Gets or sets the identifier of the principal.
     * @remarks
     * 
     * This identifier is also used when specifying the  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iactioncollection-get_context">IActionCollection::Context</a> property.
     * 
     * When reading or writing XML for a task, the identifier of the principal is specified in the Id attribute of the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-principal-principaltype-element">Principal</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-get_id
     */
    get_Id(pId) {
        result := ComCall(7, this, "ptr", pId, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the principal.
     * @remarks
     * 
     * This identifier is also used when specifying the  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iactioncollection-get_context">IActionCollection::Context</a> property.
     * 
     * When reading or writing XML for a task, the identifier of the principal is specified in the Id attribute of the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-principal-principaltype-element">Principal</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} Id 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-put_id
     */
    put_Id(Id) {
        Id := Id is String ? BSTR.Alloc(Id).Value : Id

        result := ComCall(8, this, "ptr", Id, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name of the principal.
     * @remarks
     * 
     * When reading or writing XML for a task, the display name for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-displayname-principaltype-element">DisplayName</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-get_displayname
     */
    get_DisplayName(pName) {
        result := ComCall(9, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name of the principal.
     * @remarks
     * 
     * When reading or writing XML for a task, the display name for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-displayname-principaltype-element">DisplayName</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * 
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-put_displayname
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * Gets or sets the user identifier that is required to run the tasks that are associated with the principal.
     * @remarks
     * 
     * Do not set this property if a group identifier is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_groupid">GroupId</a> property.
     * 
     * When reading or writing XML for a task, the user identifier for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-userid-principaltype-element">UserId</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-get_userid
     */
    get_UserId(pUser) {
        result := ComCall(11, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * Gets or sets the user identifier that is required to run the tasks that are associated with the principal.
     * @remarks
     * 
     * Do not set this property if a group identifier is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_groupid">GroupId</a> property.
     * 
     * When reading or writing XML for a task, the user identifier for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-userid-principaltype-element">UserId</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} user 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-put_userid
     */
    put_UserId(user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(12, this, "ptr", user, "HRESULT")
        return result
    }

    /**
     * Gets or sets the security logon method that is required to run the tasks that are associated with the principal.
     * @remarks
     * 
     * This property is valid only when a user identifier is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
     * 
     * When reading or writing XML for a task, the logon type is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-logontype-principaltype-element"><LogonType></a> element of the Task Scheduler schema.
     * 
     * For a task, that contains a message box action, the message box will be displayed if the task is activated and the task has an interactive logon type.  To set the task logon type to be interactive, specify <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or  <b>TASK_LOGON_GROUP</b> in the <b>LogonType</b> property of the task principal, or in the <i>logonType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertask">ITaskFolder::RegisterTask</a> or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertaskdefinition">ITaskFolder::RegisterTaskDefinition</a>. 
     * 
     * When battery saver is on, Windows Task Scheduler tasks are triggered only if the task is:
     * 
     * <ul>
     * <li>Not set to <b>Start the task only if the computer is idle...</b> (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_idlesettings">IdleSettings</a>)</li>
     * <li>Not set to run during automatic maintenance (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings3-get_maintenancesettings">MaintenanceSettings</a>)</li>
     * <li>Is set to <b>Run only when user is logged on</b> (task <b>LogonType</b> is <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or <b>TASK_LOGON_GROUP</b>)</li>
     * </ul>
     * All other triggers are delayed until battery saver is off. For more information about accessing battery saver status in your application, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a>. For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>.
     * 
     * 
     * @param {Pointer<Integer>} pLogon 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-get_logontype
     */
    get_LogonType(pLogon) {
        pLogonMarshal := pLogon is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pLogonMarshal, pLogon, "HRESULT")
        return result
    }

    /**
     * Gets or sets the security logon method that is required to run the tasks that are associated with the principal.
     * @remarks
     * 
     * This property is valid only when a user identifier is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
     * 
     * When reading or writing XML for a task, the logon type is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-logontype-principaltype-element"><LogonType></a> element of the Task Scheduler schema.
     * 
     * For a task, that contains a message box action, the message box will be displayed if the task is activated and the task has an interactive logon type.  To set the task logon type to be interactive, specify <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or  <b>TASK_LOGON_GROUP</b> in the <b>LogonType</b> property of the task principal, or in the <i>logonType</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertask">ITaskFolder::RegisterTask</a> or <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskfolder-registertaskdefinition">ITaskFolder::RegisterTaskDefinition</a>. 
     * 
     * When battery saver is on, Windows Task Scheduler tasks are triggered only if the task is:
     * 
     * <ul>
     * <li>Not set to <b>Start the task only if the computer is idle...</b> (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_idlesettings">IdleSettings</a>)</li>
     * <li>Not set to run during automatic maintenance (task doesn't use <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings3-get_maintenancesettings">MaintenanceSettings</a>)</li>
     * <li>Is set to <b>Run only when user is logged on</b> (task <b>LogonType</b> is <b>TASK_LOGON_INTERACTIVE_TOKEN</b> or <b>TASK_LOGON_GROUP</b>)</li>
     * </ul>
     * All other triggers are delayed until battery saver is off. For more information about accessing battery saver status in your application, see <a href="https://docs.microsoft.com/windows/desktop/api/winbase/ns-winbase-system_power_status">SYSTEM_POWER_STATUS</a>. For general information about battery saver, see <a href="https://docs.microsoft.com/windows-hardware/design/component-guidelines/battery-saver">battery saver (in the hardware component guidelines)</a>.
     * 
     * 
     * @param {Integer} logon 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-put_logontype
     */
    put_LogonType(logon) {
        result := ComCall(14, this, "int", logon, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the user group that is required to run the tasks that are associated with the principal.
     * @remarks
     * 
     * Do not set this property if a user identifier is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
     * 
     * When reading or writing XML for a task, the group identifier for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-groupid-principaltype-element">GroupId</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pGroup 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-get_groupid
     */
    get_GroupId(pGroup) {
        result := ComCall(15, this, "ptr", pGroup, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the user group that is required to run the tasks that are associated with the principal.
     * @remarks
     * 
     * Do not set this property if a user identifier is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
     * 
     * When reading or writing XML for a task, the group identifier for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-groupid-principaltype-element">GroupId</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} group 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-put_groupid
     */
    put_GroupId(group) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(16, this, "ptr", group, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier that is used to specify the privilege level that is required to run the tasks that are associated with the principal.
     * @remarks
     * 
     * If a task is registered using the Builtin\Administrator account or the Local System or Local Service accounts, then the <b>RunLevel</b> property will be ignored.  The property value will also be ignored if User Account Control (UAC) is turned off.
     * 
     * If a task is registered using the Administrators group for the security context of the task, then you must also set the <b>RunLevel</b> property to <b>TASK_RUNLEVEL_HIGHEST</b> if you want to run the task. For more information, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/security-contexts-for-running-tasks">Security Contexts for  Tasks</a>.
     * 
     * 
     * @param {Pointer<Integer>} pRunLevel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-get_runlevel
     */
    get_RunLevel(pRunLevel) {
        pRunLevelMarshal := pRunLevel is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pRunLevelMarshal, pRunLevel, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier that is used to specify the privilege level that is required to run the tasks that are associated with the principal.
     * @remarks
     * 
     * If a task is registered using the Builtin\Administrator account or the Local System or Local Service accounts, then the <b>RunLevel</b> property will be ignored.  The property value will also be ignored if User Account Control (UAC) is turned off.
     * 
     * If a task is registered using the Administrators group for the security context of the task, then you must also set the <b>RunLevel</b> property to <b>TASK_RUNLEVEL_HIGHEST</b> if you want to run the task. For more information, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/security-contexts-for-running-tasks">Security Contexts for  Tasks</a>.
     * 
     * 
     * @param {Integer} runLevel 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iprincipal-put_runlevel
     */
    put_RunLevel(runLevel) {
        result := ComCall(18, this, "int", runLevel, "HRESULT")
        return result
    }
}
