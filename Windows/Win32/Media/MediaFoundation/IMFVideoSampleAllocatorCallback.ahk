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
     * 
     * @param {Pointer<IMFVideoSampleAllocatorNotify>} pNotify 
     * @returns {HRESULT} 
     */
    SetCallback(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSamples 
     * @returns {HRESULT} 
     */
    GetFreeSampleCount(plSamples) {
        result := ComCall(4, this, "int*", plSamples, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
