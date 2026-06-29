#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFVideoSampleAllocatorNotify.ahk" { IMFVideoSampleAllocatorNotify }

/**
 * Enables an application to track video samples allocated by the enhanced video renderer (EVR).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfvideosampleallocatorcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoSampleAllocatorCallback extends IUnknown {
    /**
     * The interface identifier for IMFVideoSampleAllocatorCallback
     * @type {Guid}
     */
    static IID := Guid("{992388b4-3372-4f67-8b6f-c84c071f4751}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoSampleAllocatorCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCallback        : IntPtr
        GetFreeSampleCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoSampleAllocatorCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the callback object that receives notification whenever a video sample is returned to the allocator.
     * @remarks
     * To get a video sample from the allocator, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfvideosampleallocator-allocatesample">IMFVideoSampleAllocator::AllocateSample</a> method. When the sample is released, it returns to the pool of available samples. When this happens, the allocator invokes the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfvideosampleallocatornotify-notifyrelease">IMFVideoSampleAllocatorNotify::NotifyRelease</a> callback.
     * 
     * The allocator holds at most one callback pointer. Calling this method again replaces the previous callback pointer.
     * @param {IMFVideoSampleAllocatorNotify} pNotify A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfvideosampleallocatornotify">IMFVideoSampleAllocatorNotify</a> interface that receives notification, or <b>NULL</b> to remove the callback.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocatorcallback-setcallback
     */
    SetCallback(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * Gets the number of video samples that are currently available for use.
     * @remarks
     * To get a video sample from the allocator, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfvideosampleallocator-allocatesample">IMFVideoSampleAllocator::AllocateSample</a> method. The <b>AllocateSample</b> method removes a sample from the sample pool and returns it to the caller. When a sample is released, it returns to the pool. The <b>GetFreeSampleCount</b> method returns the count of samples that remain in the sample pool.
     * @returns {Integer} Receives the number of available samples.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocatorcallback-getfreesamplecount
     */
    GetFreeSampleCount() {
        result := ComCall(4, this, "int*", &plSamples := 0, "HRESULT")
        return plSamples
    }

    Query(iid) {
        if (IMFVideoSampleAllocatorCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCallback := CallbackCreate(GetMethod(implObj, "SetCallback"), flags, 2)
        this.vtbl.GetFreeSampleCount := CallbackCreate(GetMethod(implObj, "GetFreeSampleCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCallback)
        CallbackFree(this.vtbl.GetFreeSampleCount)
    }
}
