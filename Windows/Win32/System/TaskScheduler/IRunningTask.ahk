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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_InstanceGuid", "get_Path", "get_State", "get_CurrentAction", "Stop", "Refresh", "get_EnginePID"]

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_name
     */
    get_Name(pName) {
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_instanceguid
     */
    get_InstanceGuid(pGuid) {
        result := ComCall(8, this, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_path
     */
    get_Path(pPath) {
        result := ComCall(9, this, "ptr", pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_state
     */
    get_State(pState) {
        result := ComCall(10, this, "int*", pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_currentaction
     */
    get_CurrentAction(pName) {
        result := ComCall(11, this, "ptr", pName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-stop
     */
    Stop() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-refresh
     */
    Refresh() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_enginepid
     */
    get_EnginePID(pPID) {
        result := ComCall(14, this, "uint*", pPID, "HRESULT")
        return result
    }
}
