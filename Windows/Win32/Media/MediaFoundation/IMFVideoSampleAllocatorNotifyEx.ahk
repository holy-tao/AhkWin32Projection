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
     * 
     * @param {Pointer<IMFSample>} __MIDL__IMFVideoSampleAllocatorNotifyEx0000 
     * @returns {HRESULT} 
     */
    NotifyPrune(__MIDL__IMFVideoSampleAllocatorNotifyEx0000) {
        result := ComCall(4, this, "ptr", __MIDL__IMFVideoSampleAllocatorNotifyEx0000, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
