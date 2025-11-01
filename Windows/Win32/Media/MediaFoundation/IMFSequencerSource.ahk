#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the Sequencer Source.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsequencersource
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSequencerSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSequencerSource
     * @type {Guid}
     */
    static IID => Guid("{197cd219-19cb-4de1-a64c-acf2edcbe59e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AppendTopology", "DeleteTopology", "GetPresentationContext", "UpdateTopology", "UpdateTopologyFlags"]

    /**
     * 
     * @param {IMFTopology} pTopology 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pdwId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-appendtopology
     */
    AppendTopology(pTopology, dwFlags, pdwId) {
        pdwIdMarshal := pdwId is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pTopology, "uint", dwFlags, pdwIdMarshal, pdwId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-deletetopology
     */
    DeleteTopology(dwId) {
        result := ComCall(4, this, "uint", dwId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFPresentationDescriptor} pPD 
     * @param {Pointer<Integer>} pId 
     * @param {Pointer<IMFTopology>} ppTopology 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-getpresentationcontext
     */
    GetPresentationContext(pPD, pId, ppTopology) {
        pIdMarshal := pId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pPD, pIdMarshal, pId, "ptr*", ppTopology, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwId 
     * @param {IMFTopology} pTopology 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-updatetopology
     */
    UpdateTopology(dwId, pTopology) {
        result := ComCall(6, this, "uint", dwId, "ptr", pTopology, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwId 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-updatetopologyflags
     */
    UpdateTopologyFlags(dwId, dwFlags) {
        result := ComCall(7, this, "uint", dwId, "uint", dwFlags, "HRESULT")
        return result
    }
}
