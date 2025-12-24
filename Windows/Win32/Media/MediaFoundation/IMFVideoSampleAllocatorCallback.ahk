#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables an application to track video samples allocated by the enhanced video renderer (EVR).
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfvideosampleallocatorcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoSampleAllocatorCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoSampleAllocatorCallback
     * @type {Guid}
     */
    static IID => Guid("{992388b4-3372-4f67-8b6f-c84c071f4751}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCallback", "GetFreeSampleCount"]

    /**
     * Sets the callback object that receives notification whenever a video sample is returned to the allocator.
     * @param {IMFVideoSampleAllocatorNotify} pNotify A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfvideosampleallocatornotify">IMFVideoSampleAllocatorNotify</a> interface that receives notification, or <b>NULL</b> to remove the callback.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfvideosampleallocatorcallback-setcallback
     */
    SetCallback(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * Gets the number of video samples that are currently available for use.
     * @returns {Integer} Receives the number of available samples.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfvideosampleallocatorcallback-getfreesamplecount
     */
    GetFreeSampleCount() {
        result := ComCall(4, this, "int*", &plSamples := 0, "HRESULT")
        return plSamples
    }
}
