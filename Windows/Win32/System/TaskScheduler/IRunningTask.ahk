#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides the methods to get information from and control a running task.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-irunningtask
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IRunningTask extends IDispatch{
    /**
     * The interface identifier for IRunningTask
     * @type {Guid}
     */
    static IID => Guid("{653758fb-7b9a-4f1e-a471-beeb8e9b834e}")

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
     * @param {Pointer<BSTR>} pGuid 
     * @returns {HRESULT} 
     */
    get_InstanceGuid(pGuid) {
        result := ComCall(8, this, "ptr", pGuid, "int")
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
        result := ComCall(9, this, "ptr", pPath, "int")
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
        result := ComCall(10, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     */
    get_CurrentAction(pName) {
        result := ComCall(11, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pPID 
     * @returns {HRESULT} 
     */
    get_EnginePID(pPID) {
        result := ComCall(14, this, "uint*", pPID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
