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
     * Gets the name of the task.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-irunningtask-get_name
     */
    get_Name() {
        pName := BSTR()
        result := ComCall(7, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * Gets the GUID identifier for this instance of the task.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-irunningtask-get_instanceguid
     */
    get_InstanceGuid() {
        pGuid := BSTR()
        result := ComCall(8, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * Gets the path to where the task is stored.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-irunningtask-get_path
     */
    get_Path() {
        pPath := BSTR()
        result := ComCall(9, this, "ptr", pPath, "HRESULT")
        return pPath
    }

    /**
     * Gets an identifier for the state of the running task.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-irunningtask-get_state
     */
    get_State() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Gets the name of the current action that the running task is performing.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-irunningtask-get_currentaction
     */
    get_CurrentAction() {
        pName := BSTR()
        result := ComCall(11, this, "ptr", pName, "HRESULT")
        return pName
    }

    /**
     * Stops this instance of the task.
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
     * The task was stopped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have permission to stop the task, the task is disabled, or the task is not allowed to be run on demand.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-irunningtask-stop
     */
    Stop() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Refreshes all of the local instance variables of the task.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-irunningtask-refresh
     */
    Refresh() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Gets the process ID for the engine (process) which is running the task.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-irunningtask-get_enginepid
     */
    get_EnginePID() {
        result := ComCall(14, this, "uint*", &pPID := 0, "HRESULT")
        return pPID
    }
}
