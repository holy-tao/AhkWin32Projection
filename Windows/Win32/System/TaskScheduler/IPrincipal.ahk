#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\TASK_LOGON_TYPE.ahk" { TASK_LOGON_TYPE }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\TASK_RUNLEVEL_TYPE.ahk" { TASK_RUNLEVEL_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides the security credentials for a principal.
 * @remarks
 * When specifying an account, remember to properly use the double backslash in code to specify the domain and user name. For example, use DOMAIN\\UserName to specify a value for the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
 * 
 * When reading or writing XML for a task, the security credentials for a principal are specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-principal-principaltype-element">Principal</a> element of the Task Scheduler schema.
 * 
 * If a task is registered using the at.exe command line tool, and this interface is used to retrieve information about the task, then the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_logontype">LogonType</a> property will return 0, the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_runlevel">RunLevel</a> property will return 0, and the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property will return <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iprincipal
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IPrincipal extends IDispatch {
    /**
     * The interface identifier for IPrincipal
     * @type {Guid}
     */
    static IID := Guid("{d98d51e5-c9b4-496a-a9c1-18980261cf0f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrincipal interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id          : IntPtr
        put_Id          : IntPtr
        get_DisplayName : IntPtr
        put_DisplayName : IntPtr
        get_UserId      : IntPtr
        put_UserId      : IntPtr
        get_LogonType   : IntPtr
        put_LogonType   : IntPtr
        get_GroupId     : IntPtr
        put_GroupId     : IntPtr
        get_RunLevel    : IntPtr
        put_RunLevel    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrincipal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {BSTR} 
     */
    UserId {
        get => this.get_UserId()
        set => this.put_UserId(value)
    }

    /**
     * @type {TASK_LOGON_TYPE} 
     */
    LogonType {
        get => this.get_LogonType()
        set => this.put_LogonType(value)
    }

    /**
     * @type {BSTR} 
     */
    GroupId {
        get => this.get_GroupId()
        set => this.put_GroupId(value)
    }

    /**
     * @type {TASK_RUNLEVEL_TYPE} 
     */
    RunLevel {
        get => this.get_RunLevel()
        set => this.put_RunLevel(value)
    }

    /**
     * Gets or sets the identifier of the principal. (Get)
     * @remarks
     * This identifier is also used when specifying the  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iactioncollection-get_context">IActionCollection::Context</a> property.
     * 
     * When reading or writing XML for a task, the identifier of the principal is specified in the Id attribute of the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-principal-principaltype-element">Principal</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_id
     */
    get_Id(pId) {
        result := ComCall(7, this, BSTR.Ptr, pId, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the principal. (Put)
     * @remarks
     * This identifier is also used when specifying the  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iactioncollection-get_context">IActionCollection::Context</a> property.
     * 
     * When reading or writing XML for a task, the identifier of the principal is specified in the Id attribute of the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-principal-principaltype-element">Principal</a> element of the Task Scheduler schema.
     * @param {BSTR} Id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_id
     */
    put_Id(Id) {
        Id := Id is String ? BSTR.Alloc(Id).Value : Id

        result := ComCall(8, this, BSTR, Id, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name of the principal. (Get)
     * @remarks
     * When reading or writing XML for a task, the display name for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-displayname-principaltype-element">DisplayName</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_displayname
     */
    get_DisplayName(pName) {
        result := ComCall(9, this, BSTR.Ptr, pName, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name of the principal. (Put)
     * @remarks
     * When reading or writing XML for a task, the display name for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-displayname-principaltype-element">DisplayName</a> element of the Task Scheduler schema.
     * 
     * When setting this property value, the value can be text that is retrieved from a resource .dll file. A specialized string is used to reference the text from the resource file.  The format of the string is $(@ [Dll], [ResourceID]) where [Dll] is the path to the .dll file that contains the resource and [ResourceID] is the identifier for the resource text. For example, the setting this property value to $(@ %SystemRoot%\System32\ResourceName.dll, -101) will set the property to the value of the resource text  with an identifier equal to -101 in the  %SystemRoot%\System32\ResourceName.dll file.
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_displayname
     */
    put_DisplayName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Gets or sets the user identifier that is required to run the tasks that are associated with the principal. (Get)
     * @remarks
     * Do not set this property if a group identifier is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_groupid">GroupId</a> property.
     * 
     * When reading or writing XML for a task, the user identifier for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-userid-principaltype-element">UserId</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_userid
     */
    get_UserId(pUser) {
        result := ComCall(11, this, BSTR.Ptr, pUser, "HRESULT")
        return result
    }

    /**
     * Gets or sets the user identifier that is required to run the tasks that are associated with the principal. (Put)
     * @remarks
     * Do not set this property if a group identifier is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_groupid">GroupId</a> property.
     * 
     * When reading or writing XML for a task, the user identifier for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-userid-principaltype-element">UserId</a> element of the Task Scheduler schema.
     * @param {BSTR} user 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_userid
     */
    put_UserId(user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(12, this, BSTR, user, "HRESULT")
        return result
    }

    /**
     * Gets or sets the security logon method that is required to run the tasks that are associated with the principal. (Get)
     * @remarks
     * This property is valid only when a user identifier is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
     * 
     * When reading or writing XML for a task, the logon type is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-logontype-principaltype-element">&lt;LogonType&gt;</a> element of the Task Scheduler schema.
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
     * @param {Pointer<TASK_LOGON_TYPE>} pLogon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_logontype
     */
    get_LogonType(pLogon) {
        pLogonMarshal := pLogon is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, pLogonMarshal, pLogon, "HRESULT")
        return result
    }

    /**
     * Gets or sets the security logon method that is required to run the tasks that are associated with the principal. (Put)
     * @remarks
     * This property is valid only when a user identifier is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
     * 
     * When reading or writing XML for a task, the logon type is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-logontype-principaltype-element">&lt;LogonType&gt;</a> element of the Task Scheduler schema.
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
     * @param {TASK_LOGON_TYPE} logon 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_logontype
     */
    put_LogonType(logon) {
        result := ComCall(14, this, TASK_LOGON_TYPE, logon, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the user group that is required to run the tasks that are associated with the principal. (Get)
     * @remarks
     * Do not set this property if a user identifier is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
     * 
     * When reading or writing XML for a task, the group identifier for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-groupid-principaltype-element">GroupId</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pGroup 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_groupid
     */
    get_GroupId(pGroup) {
        result := ComCall(15, this, BSTR.Ptr, pGroup, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the user group that is required to run the tasks that are associated with the principal. (Put)
     * @remarks
     * Do not set this property if a user identifier is specified in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_userid">UserId</a> property.
     * 
     * When reading or writing XML for a task, the group identifier for a principal is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-groupid-principaltype-element">GroupId</a> element of the Task Scheduler schema.
     * @param {BSTR} group 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_groupid
     */
    put_GroupId(group) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(16, this, BSTR, group, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier that is used to specify the privilege level that is required to run the tasks that are associated with the principal. (Get)
     * @remarks
     * If a task is registered using the Builtin\Administrator account or the Local System or Local Service accounts, then the <b>RunLevel</b> property will be ignored.  The property value will also be ignored if User Account Control (UAC) is turned off.
     * 
     * If a task is registered using the Administrators group for the security context of the task, then you must also set the <b>RunLevel</b> property to <b>TASK_RUNLEVEL_HIGHEST</b> if you want to run the task. For more information, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/security-contexts-for-running-tasks">Security Contexts for  Tasks</a>.
     * @param {Pointer<TASK_RUNLEVEL_TYPE>} pRunLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-get_runlevel
     */
    get_RunLevel(pRunLevel) {
        pRunLevelMarshal := pRunLevel is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pRunLevelMarshal, pRunLevel, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier that is used to specify the privilege level that is required to run the tasks that are associated with the principal. (Put)
     * @remarks
     * If a task is registered using the Builtin\Administrator account or the Local System or Local Service accounts, then the <b>RunLevel</b> property will be ignored.  The property value will also be ignored if User Account Control (UAC) is turned off.
     * 
     * If a task is registered using the Administrators group for the security context of the task, then you must also set the <b>RunLevel</b> property to <b>TASK_RUNLEVEL_HIGHEST</b> if you want to run the task. For more information, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/security-contexts-for-running-tasks">Security Contexts for  Tasks</a>.
     * @param {TASK_RUNLEVEL_TYPE} runLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iprincipal-put_runlevel
     */
    put_RunLevel(runLevel) {
        result := ComCall(18, this, TASK_RUNLEVEL_TYPE, runLevel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrincipal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.put_Id := CallbackCreate(GetMethod(implObj, "put_Id"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.put_DisplayName := CallbackCreate(GetMethod(implObj, "put_DisplayName"), flags, 2)
        this.vtbl.get_UserId := CallbackCreate(GetMethod(implObj, "get_UserId"), flags, 2)
        this.vtbl.put_UserId := CallbackCreate(GetMethod(implObj, "put_UserId"), flags, 2)
        this.vtbl.get_LogonType := CallbackCreate(GetMethod(implObj, "get_LogonType"), flags, 2)
        this.vtbl.put_LogonType := CallbackCreate(GetMethod(implObj, "put_LogonType"), flags, 2)
        this.vtbl.get_GroupId := CallbackCreate(GetMethod(implObj, "get_GroupId"), flags, 2)
        this.vtbl.put_GroupId := CallbackCreate(GetMethod(implObj, "put_GroupId"), flags, 2)
        this.vtbl.get_RunLevel := CallbackCreate(GetMethod(implObj, "get_RunLevel"), flags, 2)
        this.vtbl.put_RunLevel := CallbackCreate(GetMethod(implObj, "put_RunLevel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.put_Id)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.put_DisplayName)
        CallbackFree(this.vtbl.get_UserId)
        CallbackFree(this.vtbl.put_UserId)
        CallbackFree(this.vtbl.get_LogonType)
        CallbackFree(this.vtbl.put_LogonType)
        CallbackFree(this.vtbl.get_GroupId)
        CallbackFree(this.vtbl.put_GroupId)
        CallbackFree(this.vtbl.get_RunLevel)
        CallbackFree(this.vtbl.put_RunLevel)
    }
}
