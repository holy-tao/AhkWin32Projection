#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables an application to get a topology from the sequencer source.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasourcetopologyprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSourceTopologyProvider extends IUnknown{
    /**
     * The interface identifier for IMFMediaSourceTopologyProvider
     * @type {Guid}
     */
    static IID => Guid("{0e1d6009-c9f3-442d-8c51-a42d2d49452f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} pPresentationDescriptor 
     * @param {Pointer<IMFTopology>} ppTopology 
     * @returns {HRESULT} 
     */
    GetMediaSourceTopology(pPresentationDescriptor, ppTopology) {
        result := ComCall(3, this, "ptr", pPresentationDescriptor, "ptr", ppTopology, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
