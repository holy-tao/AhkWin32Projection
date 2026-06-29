#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines the methods that are called by the Task Scheduler service to manage a COM handler.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itaskhandler
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskHandler extends IUnknown {
    /**
     * The interface identifier for ITaskHandler
     * @type {Guid}
     */
    static IID := Guid("{839d7762-5121-4009-9234-4f0d19394f04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start  : IntPtr
        Stop   : IntPtr
        Pause  : IntPtr
        Resume : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called to start the COM handler.
     * @remarks
     * When implementing this method, the handler should return control immediately to the Task Scheduler (starting its own thread if inproc).
     * 
     * After  the handler starts its processing, it can call the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskhandlerstatus-updatestatus">UpdateStatus</a> method to indicate  its percentage of completion or call the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itaskhandlerstatus-taskcompleted">TaskCompleted</a> method to indicate when the handler has completed its processing. These methods are provided by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskhandlerstatus">ITaskHandlerStatus</a> interface.
     * @param {IUnknown} pHandlerServices An <b>IUnkown</b> interface that is used to communicate back with the Task Scheduler.
     * @param {BSTR} data The arguments that are required by the handler.  These arguments are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-icomhandleraction-get_data">Data</a> property of the COM handler action.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskhandler-start
     */
    Start(pHandlerServices, data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(3, this, "ptr", pHandlerServices, BSTR, data, "HRESULT")
        return result
    }

    /**
     * Called to stop the COM handler.
     * @returns {HRESULT} The return code that the Task Schedule will raise as an event when the COM handler action is completed.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskhandler-stop
     */
    Stop() {
        result := ComCall(4, this, "int*", &pRetCode := 0, "HRESULT")
        return pRetCode
    }

    /**
     * Called to pause the COM handler.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskhandler-pause
     */
    Pause() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Called to resume the COM handler.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskhandler-resume
     */
    Resume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 3)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 2)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Resume := CallbackCreate(GetMethod(implObj, "Resume"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Resume)
    }
}
