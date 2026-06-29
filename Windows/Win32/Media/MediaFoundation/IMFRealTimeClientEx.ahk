#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies a pipeline object to register itself with the Multimedia Class Scheduler Service (MMCSS). (IMFRealTimeClientEx)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfrealtimeclientex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFRealTimeClientEx extends IUnknown {
    /**
     * The interface identifier for IMFRealTimeClientEx
     * @type {Guid}
     */
    static IID := Guid("{03910848-ab16-4611-b100-17b88ae2f248}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFRealTimeClientEx interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterThreadsEx : IntPtr
        UnregisterThreads : IntPtr
        SetWorkQueueEx    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFRealTimeClientEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the object to register its worker threads with the Multimedia Class Scheduler Service (MMCSS). (IMFRealTimeClientEx.RegisterThreadsEx)
     * @remarks
     * If the object does not create worker threads, the method should simply return S_OK and take no further action. 
     * 
     * Otherwise, if the value of <c>*pdwTaskIndex</c> is zero on input, the object should perform the following steps:
     * 
     * <ol>
     * <li>A single worker thread calls <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmthreadcharacteristicsa">AvSetMmThreadCharacteristics</a> to create a new MMCSS task identifier. Store this value.</li>
     * <li>Any additional worker threads call <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmthreadcharacteristicsa">AvSetMmThreadCharacteristics</a> using the new task identifier.</li>
     * <li>Return the new task identifier to the caller, by setting <c>*pdwTaskIndex</c> equal to the task identifier.</li>
     * </ol>
     * If the value of <c>*pdwTaskIndex</c> is nonzero on input, the parameter contains an existing MMCSS task identifier. In that case, all worker threads of the object should register themselves for that task by calling <a href="https://docs.microsoft.com/windows/desktop/api/avrt/nf-avrt-avsetmmthreadcharacteristicsa">AvSetMmThreadCharacteristics</a>.
     * @param {Pointer<Integer>} pdwTaskIndex The MMCSS task identifier. If the value is zero on input,  the object should create a new MCCSS task group. See Remarks.
     * @param {PWSTR} wszClassName The name of the MMCSS task.
     * @param {Integer} lBasePriority The base priority of the thread.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrealtimeclientex-registerthreadsex
     */
    RegisterThreadsEx(pdwTaskIndex, wszClassName, lBasePriority) {
        wszClassName := wszClassName is String ? StrPtr(wszClassName) : wszClassName

        pdwTaskIndexMarshal := pdwTaskIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwTaskIndexMarshal, pdwTaskIndex, "ptr", wszClassName, "int", lBasePriority, "HRESULT")
        return result
    }

    /**
     * Notifies the object to unregister its worker threads from the Multimedia Class Scheduler Service (MMCSS). (IMFRealTimeClientEx.UnregisterThreads)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrealtimeclientex-unregisterthreads
     */
    UnregisterThreads() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Specifies the work queue that this object should use for asynchronous work items.
     * @remarks
     * The object should use the values of <i>dwMultithreadedWorkQueueId</i> and <i>lWorkItemBasePriority</i> when it queues new work items. Use the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfputworkitem2">MFPutWorkItem2</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfputworkitemex2">MFPutWorkItemEx2</a> function to queue the work item.
     * @param {Integer} dwMultithreadedWorkQueueId The work queue identifier.
     * @param {Integer} lWorkItemBasePriority The base priority for work items.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrealtimeclientex-setworkqueueex
     */
    SetWorkQueueEx(dwMultithreadedWorkQueueId, lWorkItemBasePriority) {
        result := ComCall(5, this, "uint", dwMultithreadedWorkQueueId, "int", lWorkItemBasePriority, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFRealTimeClientEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterThreadsEx := CallbackCreate(GetMethod(implObj, "RegisterThreadsEx"), flags, 4)
        this.vtbl.UnregisterThreads := CallbackCreate(GetMethod(implObj, "UnregisterThreads"), flags, 1)
        this.vtbl.SetWorkQueueEx := CallbackCreate(GetMethod(implObj, "SetWorkQueueEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterThreadsEx)
        CallbackFree(this.vtbl.UnregisterThreads)
        CallbackFree(this.vtbl.SetWorkQueueEx)
    }
}
