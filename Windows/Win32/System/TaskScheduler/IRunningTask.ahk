#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    InstanceGuid {
        get => this.get_InstanceGuid()
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
     * @type {BSTR} 
     */
    CurrentAction {
        get => this.get_CurrentAction()
    }

    /**
     * @type {Integer} 
     */
    EnginePID {
        get => this.get_EnginePID()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_instanceguid
     */
    get_InstanceGuid() {
        pGuid := BSTR()
        result := ComCall(8, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_path
     */
    get_Path() {
        pPath := BSTR()
        result := ComCall(9, this, "ptr", pPath, "HRESULT")
        return pPath
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_state
     */
    get_State() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_currentaction
     */
    get_CurrentAction() {
        pName := BSTR()
        result := ComCall(11, this, "ptr", pName, "HRESULT")
        return pName
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_enginepid
     */
    get_EnginePID() {
        result := ComCall(14, this, "uint*", &pPID := 0, "HRESULT")
        return pPID
    }
}
