#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the methods that are used by COM handlers to notify the Task Scheduler about the status of the handler.
 * @remarks
 * For information on specifying a COM handler action, see the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-icomhandleraction">IComHandlerAction</a> interface.
 * 
 * For information on the required interfaces that must be implemented by the handler, see the  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskhandler">ITaskHandler</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itaskhandlerstatus
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskHandlerStatus extends IUnknown {
    /**
     * The interface identifier for ITaskHandlerStatus
     * @type {Guid}
     */
    static IID := Guid("{eaec7a8f-27a0-4ddc-8675-14726a01a38a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskHandlerStatus interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UpdateStatus  : IntPtr
        TaskCompleted : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskHandlerStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Tells the Task Scheduler about the percentage of completion of the COM handler.
     * @param {Integer} percentComplete A value that indicates the percentage of completion for the COM handler.
     * @param {BSTR} statusMessage The message that is displayed in the Task Scheduler UI.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskhandlerstatus-updatestatus
     */
    UpdateStatus(percentComplete, statusMessage) {
        statusMessage := statusMessage is String ? BSTR.Alloc(statusMessage).Value : statusMessage

        result := ComCall(3, this, "short", percentComplete, BSTR, statusMessage, "HRESULT")
        return result
    }

    /**
     * Tells the Task Scheduler that the COM handler is completed.
     * @param {HRESULT} taskErrCode The error code that the Task Scheduler will raise as an event.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskhandlerstatus-taskcompleted
     */
    TaskCompleted(taskErrCode) {
        result := ComCall(4, this, "int", taskErrCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskHandlerStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateStatus := CallbackCreate(GetMethod(implObj, "UpdateStatus"), flags, 3)
        this.vtbl.TaskCompleted := CallbackCreate(GetMethod(implObj, "TaskCompleted"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateStatus)
        CallbackFree(this.vtbl.TaskCompleted)
    }
}
