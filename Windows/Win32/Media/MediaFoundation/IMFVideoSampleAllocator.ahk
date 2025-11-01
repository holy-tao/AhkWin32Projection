#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allocates video samples for a video media sink.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfvideosampleallocator
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoSampleAllocator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoSampleAllocator
     * @type {Guid}
     */
    static IID => Guid("{86cbc910-e533-4751-8e3b-f19b5b806a03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDirectXManager", "UninitializeSampleAllocator", "InitializeSampleAllocator", "AllocateSample"]

    /**
     * 
     * @param {IUnknown} pManager 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocator-setdirectxmanager
     */
    SetDirectXManager(pManager) {
        result := ComCall(3, this, "ptr", pManager, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocator-uninitializesampleallocator
     */
    UninitializeSampleAllocator() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cRequestedFrames 
     * @param {IMFMediaType} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocator-initializesampleallocator
     */
    InitializeSampleAllocator(cRequestedFrames, pMediaType) {
        result := ComCall(5, this, "uint", cRequestedFrames, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFSample>} ppSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocator-allocatesample
     */
    AllocateSample(ppSample) {
        result := ComCall(6, this, "ptr*", ppSample, "HRESULT")
        return result
    }
}
