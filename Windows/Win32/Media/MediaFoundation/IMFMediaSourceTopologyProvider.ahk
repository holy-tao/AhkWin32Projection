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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMediaSourceTopology"]

    /**
     * 
     * @param {IMFPresentationDescriptor} pPresentationDescriptor 
     * @param {Pointer<IMFTopology>} ppTopology 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasourcetopologyprovider-getmediasourcetopology
     */
    GetMediaSourceTopology(pPresentationDescriptor, ppTopology) {
        result := ComCall(3, this, "ptr", pPresentationDescriptor, "ptr*", ppTopology, "HRESULT")
        return result
    }
}
