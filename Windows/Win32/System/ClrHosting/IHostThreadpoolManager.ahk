#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostThreadpoolManager extends IUnknown {
    /**
     * The interface identifier for IHostThreadpoolManager
     * @type {Guid}
     */
    static IID := Guid("{983d50e2-cb15-466b-80fc-845dc6e8c5fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostThreadpoolManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueueUserWorkItem   : IntPtr
        SetMaxThreads       : IntPtr
        GetMaxThreads       : IntPtr
        GetAvailableThreads : IntPtr
        SetMinThreads       : IntPtr
        GetMinThreads       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostThreadpoolManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queues a work item to a worker thread in the thread pool.
     * @remarks
     * If a function in a DLL is queued to a worker thread, be sure that the function has completed execution before the DLL is unloaded.
     * 
     * By default, the thread pool has a maximum of 512 threads per process. To raise the queue limit, use the <b>WT_SET_MAX_THREADPOOL_THREAD</b> macro defined in WinNT.h.
     * 
     * 
     * ``` syntax
     * @param {Pointer<LPTHREAD_START_ROUTINE>} Function A pointer to the application-defined callback function of type <b>LPTHREAD_START_ROUTINE</b> to be executed by the thread in the thread pool. This value represents the starting address of the thread. This callback function must not call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-terminatethread">TerminateThread</a> function. 
     * 
     * The return value of the callback function is not used.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms686736(v=vs.85)">ThreadProc</a>.
     * @param {Pointer<Void>} _Context A single parameter value to be passed to the thread function.
     * @param {Integer} Flags 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-queueuserworkitem
     */
    QueueUserWorkItem(Function, _Context, Flags) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", Function, _ContextMarshal, _Context, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxWorkerThreads 
     * @returns {HRESULT} 
     */
    SetMaxThreads(dwMaxWorkerThreads) {
        result := ComCall(4, this, "uint", dwMaxWorkerThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxThreads() {
        result := ComCall(5, this, "uint*", &pdwMaxWorkerThreads := 0, "HRESULT")
        return pdwMaxWorkerThreads
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAvailableThreads() {
        result := ComCall(6, this, "uint*", &pdwAvailableWorkerThreads := 0, "HRESULT")
        return pdwAvailableWorkerThreads
    }

    /**
     * 
     * @param {Integer} dwMinIOCompletionThreads 
     * @returns {HRESULT} 
     */
    SetMinThreads(dwMinIOCompletionThreads) {
        result := ComCall(7, this, "uint", dwMinIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMinThreads() {
        result := ComCall(8, this, "uint*", &pdwMinIOCompletionThreads := 0, "HRESULT")
        return pdwMinIOCompletionThreads
    }

    Query(iid) {
        if (IHostThreadpoolManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueueUserWorkItem := CallbackCreate(GetMethod(implObj, "QueueUserWorkItem"), flags, 4)
        this.vtbl.SetMaxThreads := CallbackCreate(GetMethod(implObj, "SetMaxThreads"), flags, 2)
        this.vtbl.GetMaxThreads := CallbackCreate(GetMethod(implObj, "GetMaxThreads"), flags, 2)
        this.vtbl.GetAvailableThreads := CallbackCreate(GetMethod(implObj, "GetAvailableThreads"), flags, 2)
        this.vtbl.SetMinThreads := CallbackCreate(GetMethod(implObj, "SetMinThreads"), flags, 2)
        this.vtbl.GetMinThreads := CallbackCreate(GetMethod(implObj, "GetMinThreads"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueueUserWorkItem)
        CallbackFree(this.vtbl.SetMaxThreads)
        CallbackFree(this.vtbl.GetMaxThreads)
        CallbackFree(this.vtbl.GetAvailableThreads)
        CallbackFree(this.vtbl.SetMinThreads)
        CallbackFree(this.vtbl.GetMinThreads)
    }
}
