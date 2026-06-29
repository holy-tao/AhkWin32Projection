#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The callback for the IMFVideoSampleAllocatorCallback interface. (IMFVideoSampleAllocatorNotify)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfvideosampleallocatornotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoSampleAllocatorNotify extends IUnknown {
    /**
     * The interface identifier for IMFVideoSampleAllocatorNotify
     * @type {Guid}
     */
    static IID := Guid("{a792cdbe-c374-4e89-8335-278e7b9956a4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoSampleAllocatorNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NotifyRelease : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoSampleAllocatorNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when a video sample is returned to the allocator.
     * @remarks
     * To get a video sample from the allocator, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfvideosampleallocator-allocatesample">IMFVideoSampleAllocator::AllocateSample</a> method. When the sample is released and then returned to the pool of available samples, the allocator invokes the <b>NotifyRelease</b> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocatornotify-notifyrelease
     */
    NotifyRelease() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFVideoSampleAllocatorNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifyRelease := CallbackCreate(GetMethod(implObj, "NotifyRelease"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifyRelease)
    }
}
