#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a synchronization mechanism between an app that creates and manages a virtual camera and the virtual camera source.
 * @remarks
 * Get an instance of this interface by calling [IMFVirtualCamera::CreateSyncEvent](nf-mfvirtualcamera-imfvirtualcamera-createsyncevent.md) or [IMFVirtualCamera::CreateSyncSemaphore](nf-mfvirtualcamera-imfvirtualcamera-createsyncsemaphore.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nn-mfvirtualcamera-imfcamerasyncobject
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCameraSyncObject extends IUnknown {
    /**
     * The interface identifier for IMFCameraSyncObject
     * @type {Guid}
     */
    static IID := Guid("{6338b23a-3042-49d2-a3ea-ec0fed815407}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCameraSyncObject interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        WaitOnSignal : IntPtr
        Shutdown     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCameraSyncObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Blocks until the time out specified timeout interval has elapsed or the synchronization object was signaled.
     * @param {Integer} timeOutInMs The timeout value in milliseconds.  Specifying INFINITE will result in the call blocking until the synchronization object is signaled.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfcamerasyncobject-waitonsignal
     */
    WaitOnSignal(timeOutInMs) {
        result := ComCall(3, this, "uint", timeOutInMs, "HRESULT")
        return result
    }

    /**
     * Shuts down the sync object.
     * @remarks
     * **Shutdown** must be called on all sync objects created with calls to [IMFVirtualCamera::CreateSyncEvent](nf-mfvirtualcamera-imfvirtualcamera-createsyncevent.md) or [IMFVirtualCamera::CreateSyncSemaphore](nf-mfvirtualcamera-imfvirtualcamera-createsyncsemaphore.md).
     * 
     * For non-ONESHOT event or semaphore objects, **Shutdown** will unregister the event or semaphore handle with the virtual camera.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfvirtualcamera/nf-mfvirtualcamera-imfcamerasyncobject-shutdown
     */
    Shutdown() {
        ComCall(4, this)
    }

    Query(iid) {
        if (IMFCameraSyncObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WaitOnSignal := CallbackCreate(GetMethod(implObj, "WaitOnSignal"), flags, 2)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WaitOnSignal)
        CallbackFree(this.vtbl.Shutdown)
    }
}
