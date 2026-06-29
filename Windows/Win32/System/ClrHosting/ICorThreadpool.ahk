#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICorThreadpool extends IUnknown {
    /**
     * The interface identifier for ICorThreadpool
     * @type {Guid}
     */
    static IID := Guid("{84680d3a-b2c1-46e8-acc2-dbc0a359159a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorThreadpool interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CorRegisterWaitForSingleObject : IntPtr
        CorUnregisterWait              : IntPtr
        CorQueueUserWorkItem           : IntPtr
        CorCreateTimer                 : IntPtr
        CorChangeTimer                 : IntPtr
        CorDeleteTimer                 : IntPtr
        CorBindIoCompletionCallback    : IntPtr
        CorCallOrQueueUserWorkItem     : IntPtr
        CorSetMaxThreads               : IntPtr
        CorGetMaxThreads               : IntPtr
        CorGetAvailableThreads         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorThreadpool.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phNewWaitObject 
     * @param {HANDLE} hWaitObject 
     * @param {Pointer<WAITORTIMERCALLBACK>} Callback 
     * @param {Pointer<Void>} _Context 
     * @param {Integer} timeout 
     * @param {BOOL} executeOnlyOnce 
     * @returns {BOOL} 
     */
    CorRegisterWaitForSingleObject(phNewWaitObject, hWaitObject, Callback, _Context, timeout, executeOnlyOnce) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, HANDLE.Ptr, phNewWaitObject, HANDLE, hWaitObject, "ptr", Callback, _ContextMarshal, _Context, "uint", timeout, BOOL, executeOnlyOnce, BOOL.Ptr, &result := 0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hWaitObject 
     * @param {HANDLE} CompletionEvent 
     * @returns {BOOL} 
     */
    CorUnregisterWait(hWaitObject, CompletionEvent) {
        result := ComCall(4, this, HANDLE, hWaitObject, HANDLE, CompletionEvent, BOOL.Ptr, &result := 0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPTHREAD_START_ROUTINE>} Function 
     * @param {Pointer<Void>} _Context 
     * @param {BOOL} executeOnlyOnce 
     * @returns {BOOL} 
     */
    CorQueueUserWorkItem(Function, _Context, executeOnlyOnce) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", Function, _ContextMarshal, _Context, BOOL, executeOnlyOnce, BOOL.Ptr, &result := 0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phNewTimer 
     * @param {Pointer<WAITORTIMERCALLBACK>} Callback 
     * @param {Pointer<Void>} Parameter 
     * @param {Integer} DueTime 
     * @param {Integer} Period 
     * @returns {BOOL} 
     */
    CorCreateTimer(phNewTimer, Callback, Parameter, DueTime, Period) {
        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, HANDLE.Ptr, phNewTimer, "ptr", Callback, ParameterMarshal, Parameter, "uint", DueTime, "uint", Period, BOOL.Ptr, &result := 0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} Timer 
     * @param {Integer} DueTime 
     * @param {Integer} Period 
     * @returns {BOOL} 
     */
    CorChangeTimer(Timer, DueTime, Period) {
        result := ComCall(7, this, HANDLE, Timer, "uint", DueTime, "uint", Period, BOOL.Ptr, &result := 0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} Timer 
     * @param {HANDLE} CompletionEvent 
     * @returns {BOOL} 
     */
    CorDeleteTimer(Timer, CompletionEvent) {
        result := ComCall(8, this, HANDLE, Timer, HANDLE, CompletionEvent, BOOL.Ptr, &result := 0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} fileHandle 
     * @param {Pointer<LPOVERLAPPED_COMPLETION_ROUTINE>} callback 
     * @returns {HRESULT} 
     */
    CorBindIoCompletionCallback(fileHandle, callback) {
        result := ComCall(9, this, HANDLE, fileHandle, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPTHREAD_START_ROUTINE>} Function 
     * @param {Pointer<Void>} _Context 
     * @returns {BOOL} 
     */
    CorCallOrQueueUserWorkItem(Function, _Context) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "ptr", Function, _ContextMarshal, _Context, BOOL.Ptr, &result := 0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MaxWorkerThreads 
     * @param {Integer} MaxIOCompletionThreads 
     * @returns {HRESULT} 
     */
    CorSetMaxThreads(MaxWorkerThreads, MaxIOCompletionThreads) {
        result := ComCall(11, this, "uint", MaxWorkerThreads, "uint", MaxIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} MaxWorkerThreads 
     * @param {Pointer<Integer>} MaxIOCompletionThreads 
     * @returns {HRESULT} 
     */
    CorGetMaxThreads(MaxWorkerThreads, MaxIOCompletionThreads) {
        MaxWorkerThreadsMarshal := MaxWorkerThreads is VarRef ? "uint*" : "ptr"
        MaxIOCompletionThreadsMarshal := MaxIOCompletionThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, MaxWorkerThreadsMarshal, MaxWorkerThreads, MaxIOCompletionThreadsMarshal, MaxIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} AvailableWorkerThreads 
     * @param {Pointer<Integer>} AvailableIOCompletionThreads 
     * @returns {HRESULT} 
     */
    CorGetAvailableThreads(AvailableWorkerThreads, AvailableIOCompletionThreads) {
        AvailableWorkerThreadsMarshal := AvailableWorkerThreads is VarRef ? "uint*" : "ptr"
        AvailableIOCompletionThreadsMarshal := AvailableIOCompletionThreads is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, AvailableWorkerThreadsMarshal, AvailableWorkerThreads, AvailableIOCompletionThreadsMarshal, AvailableIOCompletionThreads, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICorThreadpool.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CorRegisterWaitForSingleObject := CallbackCreate(GetMethod(implObj, "CorRegisterWaitForSingleObject"), flags, 8)
        this.vtbl.CorUnregisterWait := CallbackCreate(GetMethod(implObj, "CorUnregisterWait"), flags, 4)
        this.vtbl.CorQueueUserWorkItem := CallbackCreate(GetMethod(implObj, "CorQueueUserWorkItem"), flags, 5)
        this.vtbl.CorCreateTimer := CallbackCreate(GetMethod(implObj, "CorCreateTimer"), flags, 7)
        this.vtbl.CorChangeTimer := CallbackCreate(GetMethod(implObj, "CorChangeTimer"), flags, 5)
        this.vtbl.CorDeleteTimer := CallbackCreate(GetMethod(implObj, "CorDeleteTimer"), flags, 4)
        this.vtbl.CorBindIoCompletionCallback := CallbackCreate(GetMethod(implObj, "CorBindIoCompletionCallback"), flags, 3)
        this.vtbl.CorCallOrQueueUserWorkItem := CallbackCreate(GetMethod(implObj, "CorCallOrQueueUserWorkItem"), flags, 4)
        this.vtbl.CorSetMaxThreads := CallbackCreate(GetMethod(implObj, "CorSetMaxThreads"), flags, 3)
        this.vtbl.CorGetMaxThreads := CallbackCreate(GetMethod(implObj, "CorGetMaxThreads"), flags, 3)
        this.vtbl.CorGetAvailableThreads := CallbackCreate(GetMethod(implObj, "CorGetAvailableThreads"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CorRegisterWaitForSingleObject)
        CallbackFree(this.vtbl.CorUnregisterWait)
        CallbackFree(this.vtbl.CorQueueUserWorkItem)
        CallbackFree(this.vtbl.CorCreateTimer)
        CallbackFree(this.vtbl.CorChangeTimer)
        CallbackFree(this.vtbl.CorDeleteTimer)
        CallbackFree(this.vtbl.CorBindIoCompletionCallback)
        CallbackFree(this.vtbl.CorCallOrQueueUserWorkItem)
        CallbackFree(this.vtbl.CorSetMaxThreads)
        CallbackFree(this.vtbl.CorGetMaxThreads)
        CallbackFree(this.vtbl.CorGetAvailableThreads)
    }
}
