#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMemAllocator.ahk" { IMemAllocator }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMemAllocatorNotifyCallbackTemp.ahk" { IMemAllocatorNotifyCallbackTemp }

/**
 * The IMemAllocatorCallbackTemp interface enables a filter to receive a callback notification from an allocator whenever a sample is returned to the allocator's free list.The use of this interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-imemallocatorcallbacktemp
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMemAllocatorCallbackTemp extends IMemAllocator {
    /**
     * The interface identifier for IMemAllocatorCallbackTemp
     * @type {Guid}
     */
    static IID := Guid("{379a0cf0-c1de-11d2-abf5-00a0c905f375}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMemAllocatorCallbackTemp interfaces
    */
    struct Vtbl extends IMemAllocator.Vtbl {
        SetNotify    : IntPtr
        GetFreeCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMemAllocatorCallbackTemp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetNotify method sets or removes a callback on the allocator. The allocator calls the callback method whenever the allocator's IMemAllocator::ReleaseBuffer method is called.
     * @remarks
     * Whenever the allocator's <b>ReleaseBuffer</b> method is called, the allocator calls the <b>NotifyRelease</b> method on the interface provided in <i>pNotify</i>. The <b>ReleaseBuffer</b> method returns a media sample to the allocator's free list. Samples call this method when their reference counts reach zero.
     * 
     * The allocator holds a reference count on the caller's <b>IMemAllocatorNotifyCallbackTemp</b> interface. This can create circular reference counts, thereby preventing objects in the graph from being released correctly. Therefore, when the caller no longer needs callback notifications, it should call this method again with the value <b>NULL</b>. An appropriate time to do this is when the graph stops, or else when the pins are disconnected.
     * @param {IMemAllocatorNotifyCallbackTemp} pNotify Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imemallocatornotifycallbacktemp">IMemAllocatorNotifyCallbackTemp</a> interface that will be used for the callback. The caller must implement the interface. Use the value <b>NULL</b> to remove the callback.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocatorcallbacktemp-setnotify
     */
    SetNotify(pNotify) {
        result := ComCall(9, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * The GetFreeCount method returns the number of free media samples. This number equals the total number of media samples minus the number of samples that are currently held by filters.
     * @remarks
     * A filter holds a sample by keeping a reference count on it. It releases the sample by releasing the reference count.
     * 
     * Until the allocator is committed, the samples are not guaranteed to be allocated.
     * @returns {Integer} Pointer to a variable that receives the number of free media samples.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imemallocatorcallbacktemp-getfreecount
     */
    GetFreeCount() {
        result := ComCall(10, this, "int*", &plBuffersFree := 0, "HRESULT")
        return plBuffersFree
    }

    Query(iid) {
        if (IMemAllocatorCallbackTemp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetNotify := CallbackCreate(GetMethod(implObj, "SetNotify"), flags, 2)
        this.vtbl.GetFreeCount := CallbackCreate(GetMethod(implObj, "GetFreeCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetNotify)
        CallbackFree(this.vtbl.GetFreeCount)
    }
}
