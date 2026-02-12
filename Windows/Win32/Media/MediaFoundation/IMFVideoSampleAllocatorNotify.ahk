#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The callback for the IMFVideoSampleAllocatorCallback interface. (IMFVideoSampleAllocatorNotify)
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfvideosampleallocatornotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoSampleAllocatorNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoSampleAllocatorNotify
     * @type {Guid}
     */
    static IID => Guid("{a792cdbe-c374-4e89-8335-278e7b9956a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyRelease"]

    /**
     * Called when a video sample is returned to the allocator.
     * @remarks
     * To get a video sample from the allocator, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfvideosampleallocator-allocatesample">IMFVideoSampleAllocator::AllocateSample</a> method. When the sample is released and then returned to the pool of available samples, the allocator invokes the <b>NotifyRelease</b> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfvideosampleallocatornotify-notifyrelease
     */
    NotifyRelease() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
