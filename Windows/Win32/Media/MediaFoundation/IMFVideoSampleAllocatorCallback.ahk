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
     * 
     * @param {IMFVideoSampleAllocatorNotify} pNotify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocatorcallback-setcallback
     */
    SetCallback(pNotify) {
        result := ComCall(3, this, "ptr", pNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSamples 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocatorcallback-getfreesamplecount
     */
    GetFreeSampleCount(plSamples) {
        result := ComCall(4, this, "int*", plSamples, "HRESULT")
        return result
    }
}
