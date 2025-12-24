#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFVideoSampleAllocatorNotify.ahk

/**
 * The callback for the IMFVideoSampleAllocatorCallback interface.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfvideosampleallocatornotifyex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoSampleAllocatorNotifyEx extends IMFVideoSampleAllocatorNotify{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoSampleAllocatorNotifyEx
     * @type {Guid}
     */
    static IID => Guid("{3978aa1a-6d5b-4b7f-a340-90899189ae34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyPrune"]

    /**
     * Called when allocator samples are released for pruning by the allocator, or when the allocator is removed.
     * @param {IMFSample} __MIDL__IMFVideoSampleAllocatorNotifyEx0000 The sample to be pruned.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfvideosampleallocatornotifyex-notifyprune
     */
    NotifyPrune(__MIDL__IMFVideoSampleAllocatorNotifyEx0000) {
        result := ComCall(4, this, "ptr", __MIDL__IMFVideoSampleAllocatorNotifyEx0000, "HRESULT")
        return result
    }
}
