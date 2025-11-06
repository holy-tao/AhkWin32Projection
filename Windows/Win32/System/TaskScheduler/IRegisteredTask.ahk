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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_path
     */
    get_Path() {
        pPath := BSTR()
        result := ComCall(8, this, "ptr", pPath, "HRESULT")
        return pPath
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_state
     */
    get_State() {
        result := ComCall(9, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_enabled
     */
    get_Enabled() {
        result := ComCall(10, this, "short*", &pEnabled := 0, "HRESULT")
        return pEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-put_enabled
     */
    put_Enabled(enabled) {
        result := ComCall(11, this, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} params 
     * @returns {IRunningTask} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-run
     */
    Run(params) {
        result := ComCall(12, this, "ptr", params, "ptr*", &ppRunningTask := 0, "HRESULT")
        return IRunningTask(ppRunningTask)
    }

    /**
     * 
     * @param {VARIANT} params 
     * @param {Integer} flags 
     * @param {Integer} sessionID 
     * @param {BSTR} user 
     * @returns {IRunningTask} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-runex
     */
    RunEx(params, flags, sessionID, user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(13, this, "ptr", params, "int", flags, "int", sessionID, "ptr", user, "ptr*", &ppRunningTask := 0, "HRESULT")
        return IRunningTask(ppRunningTask)
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {IRunningTaskCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-getinstances
     */
    GetInstances(flags) {
        result := ComCall(14, this, "int", flags, "ptr*", &ppRunningTasks := 0, "HRESULT")
        return IRunningTaskCollection(ppRunningTasks)
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_lastruntime
     */
    get_LastRunTime() {
        result := ComCall(15, this, "double*", &pLastRunTime := 0, "HRESULT")
        return pLastRunTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_lasttaskresult
     */
    get_LastTaskResult() {
        result := ComCall(16, this, "int*", &pLastTaskResult := 0, "HRESULT")
        return pLastTaskResult
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_numberofmissedruns
     */
    get_NumberOfMissedRuns() {
        result := ComCall(17, this, "int*", &pNumberOfMissedRuns := 0, "HRESULT")
        return pNumberOfMissedRuns
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_nextruntime
     */
    get_NextRunTime() {
        result := ComCall(18, this, "double*", &pNextRunTime := 0, "HRESULT")
        return pNextRunTime
    }

    /**
     * 
     * @returns {ITaskDefinition} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_definition
     */
    get_Definition() {
        result := ComCall(19, this, "ptr*", &ppDefinition := 0, "HRESULT")
        return ITaskDefinition(ppDefinition)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_xml
     */
    get_Xml() {
        pXml := BSTR()
        result := ComCall(20, this, "ptr", pXml, "HRESULT")
        return pXml
    }

    /**
     * 
     * @param {Integer} securityInformation 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-getsecuritydescriptor
     */
    GetSecurityDescriptor(securityInformation) {
        pSddl := BSTR()
        result := ComCall(21, this, "int", securityInformation, "ptr", pSddl, "HRESULT")
        return pSddl
    }

    /**
     * 
     * @param {BSTR} sddl 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-setsecuritydescriptor
     */
    SetSecurityDescriptor(sddl, flags) {
        sddl := sddl is String ? BSTR.Alloc(sddl).Value : sddl

        result := ComCall(22, this, "ptr", sddl, "int", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-stop
     */
    Stop(flags) {
        result := ComCall(23, this, "int", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstStart 
     * @param {Pointer<SYSTEMTIME>} pstEnd 
     * @param {Pointer<Integer>} pCount 
     * @returns {Pointer<SYSTEMTIME>} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-getruntimes
     */
    GetRunTimes(pstStart, pstEnd, pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "ptr", pstStart, "ptr", pstEnd, pCountMarshal, pCount, "ptr*", &pRunTimes := 0, "HRESULT")
        return pRunTimes
    }
}
