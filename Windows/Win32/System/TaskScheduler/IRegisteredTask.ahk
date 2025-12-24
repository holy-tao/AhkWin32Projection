#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRunningTask.ahk
#Include .\IRunningTaskCollection.ahk
#Include .\ITaskDefinition.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods that are used to run the task immediately, get any running instances of the task, get or set the credentials that are used to register the task, and the properties that describe the task.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iregisteredtask
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IRegisteredTask extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegisteredTask
     * @type {Guid}
     */
    static IID => Guid("{9c86f320-dee3-4dd1-b972-a303f26b061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Path", "get_State", "get_Enabled", "put_Enabled", "Run", "RunEx", "GetInstances", "get_LastRunTime", "get_LastTaskResult", "get_NumberOfMissedRuns", "get_NextRunTime", "get_Definition", "get_Xml", "GetSecurityDescriptor", "SetSecurityDescriptor", "Stop", "GetRunTimes"]

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
     * @type {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * Gets the path to where the registered task is stored.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_path
     */
    get_Path() {
        pPath := BSTR()
        result := ComCall(8, this, "ptr", pPath, "HRESULT")
        return pPath
    }

    /**
     * Gets the operational state of the registered task.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_state
     */
    get_State() {
        result := ComCall(9, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Gets or sets a Boolean value that indicates if the registered task is enabled.
     * @remarks
     * 
     * This property is of type VARIANT_BOOL, which uses -1 to specify a true value and 0 to represent false. This property will not return an error if a value other than -1 or 0 is used.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_enabled
     */
    get_Enabled() {
        result := ComCall(10, this, "short*", &pEnabled := 0, "HRESULT")
        return pEnabled
    }

    /**
     * Gets or sets a Boolean value that indicates if the registered task is enabled.
     * @remarks
     * 
     * This property is of type VARIANT_BOOL, which uses -1 to specify a true value and 0 to represent false. This property will not return an error if a value other than -1 or 0 is used.
     * 
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(11, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * Runs the registered task immediately.
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
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-run
     */
    Run(params) {
        result := ComCall(12, this, "ptr", params, "ptr*", &ppRunningTask := 0, "HRESULT")
        return IRunningTask(ppRunningTask)
    }

    /**
     * Runs the registered task immediately using specified flags and a session identifier.
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
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-runex
     */
    RunEx(params, flags, sessionID, user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(13, this, "ptr", params, "int", flags, "int", sessionID, "ptr", user, "ptr*", &ppRunningTask := 0, "HRESULT")
        return IRunningTask(ppRunningTask)
    }

    /**
     * Returns all instances of the currently running registered task.
     * @param {Integer} flags This parameter is reserved for future use and must be set to 0.
     * @returns {IRunningTaskCollection} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtaskcollection">IRunningTaskCollection</a> interface that contains all currently running instances of the task under the user's context.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtaskcollection">IRunningTaskCollection</a> interface pointer.  Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-getinstances
     */
    GetInstances(flags) {
        result := ComCall(14, this, "int", flags, "ptr*", &ppRunningTasks := 0, "HRESULT")
        return IRunningTaskCollection(ppRunningTasks)
    }

    /**
     * Gets the time the registered task was last run.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_lastruntime
     */
    get_LastRunTime() {
        result := ComCall(15, this, "double*", &pLastRunTime := 0, "HRESULT")
        return pLastRunTime
    }

    /**
     * Gets the results that were returned the last time the registered task was run.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_lasttaskresult
     */
    get_LastTaskResult() {
        result := ComCall(16, this, "int*", &pLastTaskResult := 0, "HRESULT")
        return pLastTaskResult
    }

    /**
     * Gets the number of times the registered task has missed a scheduled run.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_numberofmissedruns
     */
    get_NumberOfMissedRuns() {
        result := ComCall(17, this, "int*", &pNumberOfMissedRuns := 0, "HRESULT")
        return pNumberOfMissedRuns
    }

    /**
     * Gets the time when the registered task is next scheduled to run.
     * @remarks
     * 
     * If the registered task contains triggers that are individually disabled, these triggers will still affect the next scheduled run time that is returned even though they are disabled.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_nextruntime
     */
    get_NextRunTime() {
        result := ComCall(18, this, "double*", &pNextRunTime := 0, "HRESULT")
        return pNextRunTime
    }

    /**
     * Gets the definition of the task.
     * @returns {ITaskDefinition} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_definition
     */
    get_Definition() {
        result := ComCall(19, this, "ptr*", &ppDefinition := 0, "HRESULT")
        return ITaskDefinition(ppDefinition)
    }

    /**
     * Gets the XML-formatted registration information for the registered task.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-get_xml
     */
    get_Xml() {
        pXml := BSTR()
        result := ComCall(20, this, "ptr", pXml, "HRESULT")
        return pXml
    }

    /**
     * Gets the security descriptor that is used as credentials for the registered task.
     * @param {Integer} securityInformation The security information from <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a>.
     * @returns {BSTR} The security descriptor that is used as credentials for the registered task.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-getsecuritydescriptor
     */
    GetSecurityDescriptor(securityInformation) {
        pSddl := BSTR()
        result := ComCall(21, this, "int", securityInformation, "ptr", pSddl, "HRESULT")
        return pSddl
    }

    /**
     * Sets the security descriptor that is used as credentials for the registered task.
     * @param {BSTR} sddl The security descriptor that is used as credentials for the registered task.
     * 
     * <div class="alert"><b>Note</b>   If the Local System account is denied access to a task, then the Task Scheduler service can produce unexpected results.</div>
     * <div> </div>
     * @param {Integer} flags Flags that specify how to set the security descriptor. The TASK_DONT_ADD_PRINCIPAL_ACE flag from the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/ne-taskschd-task_creation">TASK_CREATION</a> enumeration can be specified.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-setsecuritydescriptor
     */
    SetSecurityDescriptor(sddl, flags) {
        sddl := sddl is String ? BSTR.Alloc(sddl).Value : sddl

        result := ComCall(22, this, "ptr", sddl, "int", flags, "HRESULT")
        return result
    }

    /**
     * Stops the registered task immediately.
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
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-stop
     */
    Stop(flags) {
        result := ComCall(23, this, "int", flags, "HRESULT")
        return result
    }

    /**
     * Gets the times that the registered task is scheduled to run during a specified time.
     * @param {Pointer<SYSTEMTIME>} pstStart The starting time for the query.
     * @param {Pointer<SYSTEMTIME>} pstEnd The ending time for the query.
     * @param {Pointer<Integer>} pCount The requested number of runs on input and the returned number of runs on output.
     * @returns {Pointer<SYSTEMTIME>} The scheduled times that the task will run. A <b>NULL</b> LPSYSTEMTIME object should be passed into this parameter. On return, this array contains <i>pCount</i> run times. You must free this array by a calling the <b>CoTaskMemFree</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iregisteredtask-getruntimes
     */
    GetRunTimes(pstStart, pstEnd, pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "ptr", pstStart, "ptr", pstEnd, pCountMarshal, pCount, "ptr*", &pRunTimes := 0, "HRESULT")
        return pRunTimes
    }
}
