#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a filter to receive a callback notification from an allocator whenever a sample is returned to the allocator's free list.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-imemallocatornotifycallbacktemp
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMemAllocatorNotifyCallbackTemp extends IUnknown {
    /**
     * The interface identifier for IMemAllocatorNotifyCallbackTemp
     * @type {Guid}
     */
    static IID := Guid("{92980b30-c1de-11d2-abf5-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMemAllocatorNotifyCallbackTemp interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NotifyRelease : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMemAllocatorNotifyCallbackTemp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The NotifyRelease method is called whenever the allocator's IMemAllocator::ReleaseBuffer method is called. The ReleaseBuffer method returns a media sample to the allocator's free list. Samples call this method when their reference counts reach zero.
     * @remarks
     * In general, this call can occur on any thread, and the caller may be holding critical sections. Therefore, this method should not do anything that could cause a deadlock. Instead, the method should set an event or post a message to another thread, and the other thread should take any required actions.
     * @returns {HRESULT} Return S_OK or an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocatornotifycallbacktemp-notifyrelease
     */
    NotifyRelease() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMemAllocatorNotifyCallbackTemp.IID.Equals(iid)) {
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
