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
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_Name(pName) {
        result := ComCall(7, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPath 
     * @returns {HRESULT} 
     */
    get_Path(pPath) {
        result := ComCall(8, this, "ptr", pPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    get_State(pState) {
        result := ComCall(9, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pEnabled 
     * @returns {HRESULT} 
     */
    get_Enabled(pEnabled) {
        result := ComCall(10, this, "ptr", pEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     */
    put_Enabled(enabled) {
        result := ComCall(11, this, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} params 
     * @param {Pointer<IRunningTask>} ppRunningTask 
     * @returns {HRESULT} 
     */
    Run(params, ppRunningTask) {
        result := ComCall(12, this, "ptr", params, "ptr", ppRunningTask, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    RunEx(params, flags, sessionID, user, ppRunningTask) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(13, this, "ptr", params, "int", flags, "int", sessionID, "ptr", user, "ptr", ppRunningTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<IRunningTaskCollection>} ppRunningTasks 
     * @returns {HRESULT} 
     */
    GetInstances(flags, ppRunningTasks) {
        result := ComCall(14, this, "int", flags, "ptr", ppRunningTasks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pLastRunTime 
     * @returns {HRESULT} 
     */
    get_LastRunTime(pLastRunTime) {
        result := ComCall(15, this, "double*", pLastRunTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLastTaskResult 
     * @returns {HRESULT} 
     */
    get_LastTaskResult(pLastTaskResult) {
        result := ComCall(16, this, "int*", pLastTaskResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pNumberOfMissedRuns 
     * @returns {HRESULT} 
     */
    get_NumberOfMissedRuns(pNumberOfMissedRuns) {
        result := ComCall(17, this, "int*", pNumberOfMissedRuns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pNextRunTime 
     * @returns {HRESULT} 
     */
    get_NextRunTime(pNextRunTime) {
        result := ComCall(18, this, "double*", pNextRunTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITaskDefinition>} ppDefinition 
     * @returns {HRESULT} 
     */
    get_Definition(ppDefinition) {
        result := ComCall(19, this, "ptr", ppDefinition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pXml 
     * @returns {HRESULT} 
     */
    get_Xml(pXml) {
        result := ComCall(20, this, "ptr", pXml, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} securityInformation 
     * @param {Pointer<BSTR>} pSddl 
     * @returns {HRESULT} 
     */
    GetSecurityDescriptor(securityInformation, pSddl) {
        result := ComCall(21, this, "int", securityInformation, "ptr", pSddl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} sddl 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    SetSecurityDescriptor(sddl, flags) {
        sddl := sddl is String ? BSTR.Alloc(sddl).Value : sddl

        result := ComCall(22, this, "ptr", sddl, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    Stop(flags) {
        result := ComCall(23, this, "int", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstStart 
     * @param {Pointer<SYSTEMTIME>} pstEnd 
     * @param {Pointer<UInt32>} pCount 
     * @param {Pointer<SYSTEMTIME>} pRunTimes 
     * @returns {HRESULT} 
     */
    GetRunTimes(pstStart, pstEnd, pCount, pRunTimes) {
        result := ComCall(24, this, "ptr", pstStart, "ptr", pstEnd, "uint*", pCount, "ptr", pRunTimes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
