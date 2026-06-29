#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFSample.ahk" { IMFSample }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFVideoSampleAllocatorNotify.ahk" { IMFVideoSampleAllocatorNotify }

/**
 * The callback for the IMFVideoSampleAllocatorCallback interface. (IMFVideoSampleAllocatorNotifyEx)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfvideosampleallocatornotifyex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoSampleAllocatorNotifyEx extends IMFVideoSampleAllocatorNotify {
    /**
     * The interface identifier for IMFVideoSampleAllocatorNotifyEx
     * @type {Guid}
     */
    static IID := Guid("{3978aa1a-6d5b-4b7f-a340-90899189ae34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoSampleAllocatorNotifyEx interfaces
    */
    struct Vtbl extends IMFVideoSampleAllocatorNotify.Vtbl {
        NotifyPrune : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoSampleAllocatorNotifyEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when allocator samples are released for pruning by the allocator, or when the allocator is removed.
     * @param {IMFSample} __MIDL__IMFVideoSampleAllocatorNotifyEx0000 The sample to be pruned.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocatornotifyex-notifyprune
     */
    NotifyPrune(__MIDL__IMFVideoSampleAllocatorNotifyEx0000) {
        result := ComCall(4, this, "ptr", __MIDL__IMFVideoSampleAllocatorNotifyEx0000, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFVideoSampleAllocatorNotifyEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifyPrune := CallbackCreate(GetMethod(implObj, "NotifyPrune"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifyPrune)
    }
}
