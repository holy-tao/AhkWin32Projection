#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a synchronization mechanism between an app that creates and manages a virtual camera and the virtual camera source.
 * @remarks
 * Get an instance of this interface by calling [IMFVirtualCamera::CreateSyncEvent](nf-mfvirtualcamera-imfvirtualcamera-createsyncevent.md) or [IMFVirtualCamera::CreateSyncSemaphore](nf-mfvirtualcamera-imfvirtualcamera-createsyncsemaphore.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nn-mfvirtualcamera-imfcamerasyncobject
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraSyncObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraSyncObject
     * @type {Guid}
     */
    static IID => Guid("{6338b23a-3042-49d2-a3ea-ec0fed815407}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WaitOnSignal", "Shutdown"]

    /**
     * Blocks until the time out specified timeout interval has elapsed or the synchronization object was signaled.
     * @param {Integer} timeOutInMs The timeout value in milliseconds.  Specifying INFINITE will result in the call blocking until the synchronization object is signaled.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfcamerasyncobject-waitonsignal
     */
    WaitOnSignal(timeOutInMs) {
        result := ComCall(3, this, "uint", timeOutInMs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Shuts down the sync object.
     * @remarks
     * **Shutdown** must be called on all sync objects created with calls to [IMFVirtualCamera::CreateSyncEvent](nf-mfvirtualcamera-imfvirtualcamera-createsyncevent.md) or [IMFVirtualCamera::CreateSyncSemaphore](nf-mfvirtualcamera-imfvirtualcamera-createsyncsemaphore.md).
     * 
     * For non-ONESHOT event or semaphore objects, **Shutdown** will unregister the event or semaphore handle with the virtual camera.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/mfvirtualcamera/nf-mfvirtualcamera-imfcamerasyncobject-shutdown
     */
    Shutdown() {
        ComCall(4, this)
    }
}
