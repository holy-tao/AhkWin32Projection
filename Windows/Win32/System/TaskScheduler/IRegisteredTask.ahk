#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IRunningTask.ahk" { IRunningTask }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\TASK_STATE.ahk" { TASK_STATE }
#Import ".\ITaskDefinition.ahk" { ITaskDefinition }
#Import ".\IRunningTaskCollection.ahk" { IRunningTaskCollection }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides the methods that are used to run the task immediately, get any running instances of the task, get or set the credentials that are used to register the task, and the properties that describe the task.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iregisteredtask
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IRegisteredTask extends IDispatch {
    /**
     * The interface identifier for IRegisteredTask
     * @type {Guid}
     */
    static IID := Guid("{9c86f320-dee3-4dd1-b972-a303f26b061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRegisteredTask interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name               : IntPtr
        get_Path               : IntPtr
        get_State              : IntPtr
        get_Enabled            : IntPtr
        put_Enabled            : IntPtr
        Run                    : IntPtr
        RunEx                  : IntPtr
        GetInstances           : IntPtr
        get_LastRunTime        : IntPtr
        get_LastTaskResult     : IntPtr
        get_NumberOfMissedRuns : IntPtr
        get_NextRunTime        : IntPtr
        get_Definition         : IntPtr
        get_Xml                : IntPtr
        GetSecurityDescriptor  : IntPtr
        SetSecurityDescriptor  : IntPtr
        Stop                   : IntPtr
        GetRunTimes            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRegisteredTask.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {TASK_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {Float} 
     */
    LastRunTime {
        get => this.get_LastRunTime()
    }

    /**
     * @type {Integer} 
     */
    LastTaskResult {
        get => this.get_LastTaskResult()
    }

    /**
     * @type {Integer} 
     */
    NumberOfMissedRuns {
        get => this.get_NumberOfMissedRuns()
    }

    /**
     * @type {Float} 
     */
    NextRunTime {
        get => this.get_NextRunTime()
    }

    /**
     * @type {ITaskDefinition} 
     */
    Definition {
        get => this.get_Definition()
    }

    /**
     * @type {BSTR} 
     */
    Xml {
        get => this.get_Xml()
    }

    /**
     * Gets the name of the registered task.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_name
     */
    get_Name() {
        pName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * Gets the path to where the registered task is stored.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_path
     */
    get_Path() {
        pPath := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pPath, "HRESULT")
        return pPath
    }

    /**
     * Gets the operational state of the registered task.
     * @returns {TASK_STATE} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_state
     */
    get_State() {
        result := ComCall(9, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Gets or sets a Boolean value that indicates if the registered task is enabled. (Get)
     * @remarks
     * This property is of type VARIANT_BOOL, which uses -1 to specify a true value and 0 to represent false. This property will not return an error if a value other than -1 or 0 is used.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_enabled
     */
    get_Enabled() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pEnabled := 0, "HRESULT")
        return pEnabled
    }

    /**
     * Gets or sets a Boolean value that indicates if the registered task is enabled. (Put)
     * @remarks
     * This property is of type VARIANT_BOOL, which uses -1 to specify a true value and 0 to represent false. This property will not return an error if a value other than -1 or 0 is used.
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(11, this, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    /**
     * Runs the registered task immediately.
     * @remarks
     * This method will return without error, but the task will not run if the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_allowdemandstart">AllowDemandStart</a> property of ITaskSettings is set to false for the task.
     * 
     * The <b>IRegisteredTask::Run</b> function is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iregisteredtask-runex">IRegisteredTask::RunEx</a> function with the flags parameter equal to 0 and the user parameter equal to <b>NULL</b>.
     * 
     * If <b>IRegisteredTask::Run</b> is invoked from a disabled task, it will return SCHED_E_TASK_DISABLED.
     * @param {VARIANT} params The parameters used as  values in the task actions. To not specify any parameter values for the task actions, set this parameter to <b>VT_NULL</b> or <b>VT_EMPTY</b>. Otherwise, a single <b>BSTR</b> value or an array of <b>BSTR</b> values can be specified.
     * 
     * The <b>BSTR</b> values that you specify are paired with names and stored as name-value pairs.  If you specify a single <b>BSTR</b> value, then Arg0 will be the name assigned to the value. The value can be used in the task action where the $(Arg0) variable is used in the action properties.
     * 
     * If you pass in values such as "0", "100", and "250" as an array of <b>BSTR</b> values, then "0" will replace the $(Arg0) variables, "100" will replace the $(Arg1) variables, and "250" will replace the $(Arg2) variables that are used in the action properties.
     * 
     * A maximum of 32 <b>BSTR</b> values can be specified.
     * 
     * For more information and a list of action properties that can use $(Arg0), $(Arg1), ..., $(Arg32) variables in their values, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-actions">Task Actions</a>.
     * @returns {IRunningTask} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtask">IRunningTask</a> interface that  defines the new instance of the task. 
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtask">IRunningTask</a> interface pointer.  Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-run
     */
    Run(params) {
        result := ComCall(12, this, VARIANT, params, "ptr*", &ppRunningTask := 0, "HRESULT")
        return IRunningTask(ppRunningTask)
    }

    /**
     * Runs the registered task immediately using specified flags and a session identifier.
     * @remarks
     * This method will return without error, but the task will not run if the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_allowdemandstart">AllowDemandStart</a> property of ITaskSettings is set to false for the task.
     * 
     * If <b>IRegisteredTask::RunEx</b> is invoked from a disabled task, it will return S_OK, but the task will not be run.
     * @param {VARIANT} params The parameters used as  values in the task actions. To not specify any parameter values for the task actions, set this parameter to <b>VT_NULL</b> or <b>VT_EMPTY</b>. Otherwise, a single <b>BSTR</b> value, or an array of <b>BSTR</b> values, can be specified.
     * 
     * The <b>BSTR</b> values that you specify are paired with names and stored as name-value pairs.  If you specify a single BSTR value, then Arg0 will be the name assigned to the value. The value can be used in the task action where the $(Arg0) variable is used in the action properties.
     * 
     * If you pass in values such as "0", "100", and "250" as an array of <b>BSTR</b> values, then "0" will replace the $(Arg0) variables, "100" will replace the $(Arg1) variables, and "250" will replace the $(Arg2) variables that are used in the action properties.
     * 
     * A maximum of 32 <b>BSTR</b> values can be specified.
     * 
     * For more information and a list of action properties that can use $(Arg0), $(Arg1), ..., $(Arg32) variables in their values, see <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/task-actions">Task Actions</a>.
     * @param {Integer} flags A <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/ne-taskschd-task_run_flags">TASK_RUN_FLAGS</a> constant that defines how the task is run.
     * @param {Integer} sessionID The terminal server session in which you want to start the task.
     * 
     * If the TASK_RUN_USE_SESSION_ID constant is not passed into the <i>flags</i> parameter, then the value specified in this parameter is ignored. If the TASK_RUN_USE_SESSION_ID constant is passed into the <i>flags</i> parameter and the sessionID value is less than or equal to 0, then an invalid argument error will be returned.
     * 
     * If the <b>TASK_RUN_USE_SESSION_ID</b> constant is passed into the <i>flags</i> parameter and the sessionID value is a valid session ID greater than 0 and if no value is specified for the <i>user</i> parameter, then the Task Scheduler service will try to start the task interactively as the user who is logged on to the specified session.
     * 
     * If the <b>TASK_RUN_USE_SESSION_ID</b> constant is passed into the <i>flags</i> parameter and the sessionID value is a valid session ID greater than 0 and if a user is specified in the <i>user</i> parameter, then the Task Scheduler service will try to start the task interactively as the user who is specified in the <i>user</i> parameter.
     * @param {BSTR} user The user for which  the task runs.
     * @returns {IRunningTask} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtask">IRunningTask</a> interface that  defines the new instance of the task.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtask">IRunningTask</a> interface pointer.  Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-runex
     */
    RunEx(params, flags, sessionID, user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(13, this, VARIANT, params, "int", flags, "int", sessionID, BSTR, user, "ptr*", &ppRunningTask := 0, "HRESULT")
        return IRunningTask(ppRunningTask)
    }

    /**
     * Returns all instances of the currently running registered task.
     * @param {Integer} flags This parameter is reserved for future use and must be set to 0.
     * @returns {IRunningTaskCollection} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtaskcollection">IRunningTaskCollection</a> interface that contains all currently running instances of the task under the user's context.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtaskcollection">IRunningTaskCollection</a> interface pointer.  Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-getinstances
     */
    GetInstances(flags) {
        result := ComCall(14, this, "int", flags, "ptr*", &ppRunningTasks := 0, "HRESULT")
        return IRunningTaskCollection(ppRunningTasks)
    }

    /**
     * Gets the time the registered task was last run.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_lastruntime
     */
    get_LastRunTime() {
        result := ComCall(15, this, "double*", &pLastRunTime := 0, "HRESULT")
        return pLastRunTime
    }

    /**
     * Gets the results that were returned the last time the registered task was run.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_lasttaskresult
     */
    get_LastTaskResult() {
        result := ComCall(16, this, "int*", &pLastTaskResult := 0, "HRESULT")
        return pLastTaskResult
    }

    /**
     * Gets the number of times the registered task has missed a scheduled run.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_numberofmissedruns
     */
    get_NumberOfMissedRuns() {
        result := ComCall(17, this, "int*", &pNumberOfMissedRuns := 0, "HRESULT")
        return pNumberOfMissedRuns
    }

    /**
     * Gets the time when the registered task is next scheduled to run.
     * @remarks
     * If the registered task contains triggers that are individually disabled, these triggers will still affect the next scheduled run time that is returned even though they are disabled.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_nextruntime
     */
    get_NextRunTime() {
        result := ComCall(18, this, "double*", &pNextRunTime := 0, "HRESULT")
        return pNextRunTime
    }

    /**
     * Gets the definition of the task.
     * @returns {ITaskDefinition} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_definition
     */
    get_Definition() {
        result := ComCall(19, this, "ptr*", &ppDefinition := 0, "HRESULT")
        return ITaskDefinition(ppDefinition)
    }

    /**
     * Gets the XML-formatted registration information for the registered task.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_xml
     */
    get_Xml() {
        pXml := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, pXml, "HRESULT")
        return pXml
    }

    /**
     * Gets the security descriptor that is used as credentials for the registered task.
     * @param {Integer} securityInformation The security information from <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a>.
     * @returns {BSTR} The security descriptor that is used as credentials for the registered task.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-getsecuritydescriptor
     */
    GetSecurityDescriptor(securityInformation) {
        pSddl := BSTR.Owned()
        result := ComCall(21, this, "int", securityInformation, BSTR.Ptr, pSddl, "HRESULT")
        return pSddl
    }

    /**
     * Sets the security descriptor that is used as credentials for the registered task.
     * @remarks
     * You can specify the access control list (ACL) in the security descriptor for a task in order to allow or deny certain users and groups access to a task.
     * @param {BSTR} sddl The security descriptor that is used as credentials for the registered task.
     * 
     * <div class="alert"><b>Note</b>   If the Local System account is denied access to a task, then the Task Scheduler service can produce unexpected results.</div>
     * <div> </div>
     * @param {Integer} flags Flags that specify how to set the security descriptor. The TASK_DONT_ADD_PRINCIPAL_ACE flag from the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/ne-taskschd-task_creation">TASK_CREATION</a> enumeration can be specified.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-setsecuritydescriptor
     */
    SetSecurityDescriptor(sddl, flags) {
        sddl := sddl is String ? BSTR.Alloc(sddl).Value : sddl

        result := ComCall(22, this, BSTR, sddl, "int", flags, "HRESULT")
        return result
    }

    /**
     * Stops the registered task immediately.
     * @remarks
     * The <b>IRegisteredTask::Stop</b> function stops all instances of the task.
     * 
     * System account users can stop a task, users with Administrator group privileges can stop a task, and if a user has rights to execute and read a task, then the user can stop the task. A user can stop the task instances that are running under the same credentials as the user account. In all other cases, the user is denied access to stop the task.
     * @param {Integer} flags Reserved. Must be zero.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All instances of the registered task that user has permissions to stop were stopped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user cannot successfully stop instances of the task.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-stop
     */
    Stop(flags) {
        result := ComCall(23, this, "int", flags, "HRESULT")
        return result
    }

    /**
     * Gets the times that the registered task is scheduled to run during a specified time.
     * @remarks
     * If the registered task contains triggers that are individually disabled, these triggers will still affect the next scheduled run time that is returned even though they are disabled.
     * @param {Pointer<SYSTEMTIME>} pstStart The starting time for the query.
     * @param {Pointer<SYSTEMTIME>} pstEnd The ending time for the query.
     * @param {Pointer<Integer>} pCount The requested number of runs on input and the returned number of runs on output.
     * @returns {Pointer<SYSTEMTIME>} The scheduled times that the task will run. A <b>NULL</b> LPSYSTEMTIME object should be passed into this parameter. On return, this array contains <i>pCount</i> run times. You must free this array by a calling the <b>CoTaskMemFree</b> function.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-getruntimes
     */
    GetRunTimes(pstStart, pstEnd, pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, SYSTEMTIME.Ptr, pstStart, SYSTEMTIME.Ptr, pstEnd, pCountMarshal, pCount, "ptr*", &pRunTimes := 0, "HRESULT")
        return pRunTimes
    }

    Query(iid) {
        if (IRegisteredTask.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.Run := CallbackCreate(GetMethod(implObj, "Run"), flags, 3)
        this.vtbl.RunEx := CallbackCreate(GetMethod(implObj, "RunEx"), flags, 6)
        this.vtbl.GetInstances := CallbackCreate(GetMethod(implObj, "GetInstances"), flags, 3)
        this.vtbl.get_LastRunTime := CallbackCreate(GetMethod(implObj, "get_LastRunTime"), flags, 2)
        this.vtbl.get_LastTaskResult := CallbackCreate(GetMethod(implObj, "get_LastTaskResult"), flags, 2)
        this.vtbl.get_NumberOfMissedRuns := CallbackCreate(GetMethod(implObj, "get_NumberOfMissedRuns"), flags, 2)
        this.vtbl.get_NextRunTime := CallbackCreate(GetMethod(implObj, "get_NextRunTime"), flags, 2)
        this.vtbl.get_Definition := CallbackCreate(GetMethod(implObj, "get_Definition"), flags, 2)
        this.vtbl.get_Xml := CallbackCreate(GetMethod(implObj, "get_Xml"), flags, 2)
        this.vtbl.GetSecurityDescriptor := CallbackCreate(GetMethod(implObj, "GetSecurityDescriptor"), flags, 3)
        this.vtbl.SetSecurityDescriptor := CallbackCreate(GetMethod(implObj, "SetSecurityDescriptor"), flags, 3)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 2)
        this.vtbl.GetRunTimes := CallbackCreate(GetMethod(implObj, "GetRunTimes"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.Run)
        CallbackFree(this.vtbl.RunEx)
        CallbackFree(this.vtbl.GetInstances)
        CallbackFree(this.vtbl.get_LastRunTime)
        CallbackFree(this.vtbl.get_LastTaskResult)
        CallbackFree(this.vtbl.get_NumberOfMissedRuns)
        CallbackFree(this.vtbl.get_NextRunTime)
        CallbackFree(this.vtbl.get_Definition)
        CallbackFree(this.vtbl.get_Xml)
        CallbackFree(this.vtbl.GetSecurityDescriptor)
        CallbackFree(this.vtbl.SetSecurityDescriptor)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.GetRunTimes)
    }
}
