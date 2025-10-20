#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides notifications to the sequencer source.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasourcepresentationprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSourcePresentationProvider extends IUnknown{
    /**
     * The interface identifier for IMFMediaSourcePresentationProvider
     * @type {Guid}
     */
    static IID => Guid("{0e1d600a-c9f3-442d-8c51-a42d2d49452f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} pPresentationDescriptor 
     * @returns {HRESULT} 
     */
    ForceEndOfPresentation(pPresentationDescriptor) {
        result := ComCall(3, this, "ptr", pPresentationDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
