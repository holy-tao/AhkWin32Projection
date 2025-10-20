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
     * 
     * @param {Pointer<IUnknown>} pManager 
     * @returns {HRESULT} 
     */
    SetDirectXManager(pManager) {
        result := ComCall(3, this, "ptr", pManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UninitializeSampleAllocator() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cRequestedFrames 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @returns {HRESULT} 
     */
    InitializeSampleAllocator(cRequestedFrames, pMediaType) {
        result := ComCall(5, this, "uint", cRequestedFrames, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFSample>} ppSample 
     * @returns {HRESULT} 
     */
    AllocateSample(ppSample) {
        result := ComCall(6, this, "ptr", ppSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
