#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFAsyncCallback.ahk" { IMFAsyncCallback }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMFWorkQueueServices.ahk" { IMFWorkQueueServices }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Extends the IMFWorkQueueServices interface.
 * @remarks
 * This interface allows applications to control
 * both platform and topology work queues.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfworkqueueservices">IMFWorkQueueServices</a> can be obtained from the session by querying     for the <b>MF_WORKQUEUE_SERVICES</b> service.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfworkqueueservicesex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFWorkQueueServicesEx extends IMFWorkQueueServices {
    /**
     * The interface identifier for IMFWorkQueueServicesEx
     * @type {Guid}
     */
    static IID := Guid("{96bf961b-40fe-42f1-ba9d-320238b49700}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFWorkQueueServicesEx interfaces
    */
    struct Vtbl extends IMFWorkQueueServices.Vtbl {
        GetTopologyWorkQueueMMCSSPriority         : IntPtr
        BeginRegisterPlatformWorkQueueWithMMCSSEx : IntPtr
        GetPlatformWorkQueueMMCSSPriority         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFWorkQueueServicesEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) string associated with the given topology work queue.
     * @param {Integer} dwTopologyWorkQueueId The id of the topology work queue.
     * @returns {Integer} Pointer to the buffer the work queue's MMCSS task id will be copied to.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservicesex-gettopologyworkqueuemmcsspriority
     */
    GetTopologyWorkQueueMMCSSPriority(dwTopologyWorkQueueId) {
        result := ComCall(15, this, "uint", dwTopologyWorkQueueId, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }

    /**
     * Registers a platform work queue with Multimedia Class Scheduler Service (MMCSS) using the specified class and task id.
     * @param {Integer} dwPlatformWorkQueue The id of one of the standard platform work queues.
     * @param {PWSTR} wszClass The MMCSS class which the work queue should be registered with.
     * @param {Integer} dwTaskId The task id which the work queue should be registered with. If <i>dwTaskId</i> is 0, a new MMCSS bucket will be created.
     * @param {Integer} lPriority The priority.
     * @param {IMFAsyncCallback} pCallback Standard callback used for async operations in Media Foundation.
     * @param {IUnknown} pState Standard state used for async operations in Media Foundation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservicesex-beginregisterplatformworkqueuewithmmcssex
     */
    BeginRegisterPlatformWorkQueueWithMMCSSEx(dwPlatformWorkQueue, wszClass, dwTaskId, lPriority, pCallback, pState) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(16, this, "uint", dwPlatformWorkQueue, "ptr", wszClass, "uint", dwTaskId, "int", lPriority, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Gets the priority of the Multimedia Class Scheduler Service (MMCSS) priority associated with the specified platform work queue.
     * @param {Integer} dwPlatformWorkQueueId Topology work queue id for which the info will be returned.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfworkqueueservicesex-getplatformworkqueuemmcsspriority
     */
    GetPlatformWorkQueueMMCSSPriority(dwPlatformWorkQueueId) {
        result := ComCall(17, this, "uint", dwPlatformWorkQueueId, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }

    Query(iid) {
        if (IMFWorkQueueServicesEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTopologyWorkQueueMMCSSPriority := CallbackCreate(GetMethod(implObj, "GetTopologyWorkQueueMMCSSPriority"), flags, 3)
        this.vtbl.BeginRegisterPlatformWorkQueueWithMMCSSEx := CallbackCreate(GetMethod(implObj, "BeginRegisterPlatformWorkQueueWithMMCSSEx"), flags, 7)
        this.vtbl.GetPlatformWorkQueueMMCSSPriority := CallbackCreate(GetMethod(implObj, "GetPlatformWorkQueueMMCSSPriority"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTopologyWorkQueueMMCSSPriority)
        CallbackFree(this.vtbl.BeginRegisterPlatformWorkQueueWithMMCSSEx)
        CallbackFree(this.vtbl.GetPlatformWorkQueueMMCSSPriority)
    }
}
