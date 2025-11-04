#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_name
     */
    get_Name(pName) {
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_path
     */
    get_Path(pPath) {
        result := ComCall(8, this, "ptr", pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_state
     */
    get_State(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pStateMarshal, pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_enabled
     */
    get_Enabled(pEnabled) {
        result := ComCall(10, this, "ptr", pEnabled, "HRESULT")
        return result
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
     * @param {Pointer<IRunningTask>} ppRunningTask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-run
     */
    Run(params, ppRunningTask) {
        result := ComCall(12, this, "ptr", params, "ptr*", ppRunningTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} params 
     * @param {Integer} flags 
     * @param {Integer} sessionID 
     * @param {BSTR} user 
     * @param {Pointer<IRunningTask>} ppRunningTask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-runex
     */
    RunEx(params, flags, sessionID, user, ppRunningTask) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(13, this, "ptr", params, "int", flags, "int", sessionID, "ptr", user, "ptr*", ppRunningTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<IRunningTaskCollection>} ppRunningTasks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-getinstances
     */
    GetInstances(flags, ppRunningTasks) {
        result := ComCall(14, this, "int", flags, "ptr*", ppRunningTasks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pLastRunTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_lastruntime
     */
    get_LastRunTime(pLastRunTime) {
        pLastRunTimeMarshal := pLastRunTime is VarRef ? "double*" : "ptr"

        result := ComCall(15, this, pLastRunTimeMarshal, pLastRunTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLastTaskResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_lasttaskresult
     */
    get_LastTaskResult(pLastTaskResult) {
        pLastTaskResultMarshal := pLastTaskResult is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pLastTaskResultMarshal, pLastTaskResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumberOfMissedRuns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_numberofmissedruns
     */
    get_NumberOfMissedRuns(pNumberOfMissedRuns) {
        pNumberOfMissedRunsMarshal := pNumberOfMissedRuns is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pNumberOfMissedRunsMarshal, pNumberOfMissedRuns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pNextRunTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_nextruntime
     */
    get_NextRunTime(pNextRunTime) {
        pNextRunTimeMarshal := pNextRunTime is VarRef ? "double*" : "ptr"

        result := ComCall(18, this, pNextRunTimeMarshal, pNextRunTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITaskDefinition>} ppDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_definition
     */
    get_Definition(ppDefinition) {
        result := ComCall(19, this, "ptr*", ppDefinition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pXml 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-get_xml
     */
    get_Xml(pXml) {
        result := ComCall(20, this, "ptr", pXml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} securityInformation 
     * @param {Pointer<BSTR>} pSddl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-getsecuritydescriptor
     */
    GetSecurityDescriptor(securityInformation, pSddl) {
        result := ComCall(21, this, "int", securityInformation, "ptr", pSddl, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<SYSTEMTIME>>} pRunTimes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregisteredtask-getruntimes
     */
    GetRunTimes(pstStart, pstEnd, pCount, pRunTimes) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"
        pRunTimesMarshal := pRunTimes is VarRef ? "ptr*" : "ptr"

        result := ComCall(24, this, "ptr", pstStart, "ptr", pstEnd, pCountMarshal, pCount, pRunTimesMarshal, pRunTimes, "HRESULT")
        return result
    }
}
