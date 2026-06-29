#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TASK_STATE.ahk" { TASK_STATE }

/**
 * Provides the methods to get information from and control a running task.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-irunningtask
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IRunningTask extends IDispatch {
    /**
     * The interface identifier for IRunningTask
     * @type {Guid}
     */
    static IID := Guid("{653758fb-7b9a-4f1e-a471-beeb8e9b834e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRunningTask interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name          : IntPtr
        get_InstanceGuid  : IntPtr
        get_Path          : IntPtr
        get_State         : IntPtr
        get_CurrentAction : IntPtr
        Stop              : IntPtr
        Refresh           : IntPtr
        get_EnginePID     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRunningTask.Vtbl()
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
     * @type {TASK_STATE} 
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_name
     */
    get_Name() {
        pName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pName, "HRESULT")
        return pName
    }

    /**
     * Gets the GUID identifier for this instance of the task.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_instanceguid
     */
    get_InstanceGuid() {
        pGuid := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pGuid, "HRESULT")
        return pGuid
    }

    /**
     * Gets the path to where the task is stored.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_path
     */
    get_Path() {
        pPath := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pPath, "HRESULT")
        return pPath
    }

    /**
     * Gets an identifier for the state of the running task.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * @returns {TASK_STATE} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_state
     */
    get_State() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Gets the name of the current action that the running task is performing.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-irunningtask-refresh">IRunningTask::Refresh</a> method is called before the property value is returned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_currentaction
     */
    get_CurrentAction() {
        pName := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pName, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-stop
     */
    Stop() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Refreshes all of the local instance variables of the task.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-refresh
     */
    Refresh() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Gets the process ID for the engine (process) which is running the task.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irunningtask-get_enginepid
     */
    get_EnginePID() {
        result := ComCall(14, this, "uint*", &pPID := 0, "HRESULT")
        return pPID
    }

    Query(iid) {
        if (IRunningTask.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_InstanceGuid := CallbackCreate(GetMethod(implObj, "get_InstanceGuid"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_CurrentAction := CallbackCreate(GetMethod(implObj, "get_CurrentAction"), flags, 2)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.Refresh := CallbackCreate(GetMethod(implObj, "Refresh"), flags, 1)
        this.vtbl.get_EnginePID := CallbackCreate(GetMethod(implObj, "get_EnginePID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_InstanceGuid)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_CurrentAction)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.Refresh)
        CallbackFree(this.vtbl.get_EnginePID)
    }
}
