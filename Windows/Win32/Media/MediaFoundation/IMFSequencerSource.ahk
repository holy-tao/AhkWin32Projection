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
     * Adds a topology to the end of the queue.
     * @param {IMFTopology} pTopology Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the topology. This pointer cannot be <b>NULL</b>. If an application passes <b>NULL</b>, the call fails with an E_INVALIDARG error code.
     * @param {Integer} dwFlags A combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfsequencertopologyflags">MFSequencerTopologyFlags</a> enumeration.
     * @returns {Integer} Receives the sequencer element identifier for this topology.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsequencersource-appendtopology
     */
    AppendTopology(pTopology, dwFlags) {
        result := ComCall(3, this, "ptr", pTopology, "uint", dwFlags, "uint*", &pdwId := 0, "HRESULT")
        return pdwId
    }

    /**
     * Deletes a topology from the queue.
     * @param {Integer} dwId The sequencer element identifier of the topology to delete.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsequencersource-deletetopology
     */
    DeleteTopology(dwId) {
        result := ComCall(4, this, "uint", dwId, "HRESULT")
        return result
    }

    /**
     * Maps a presentation descriptor to its associated sequencer element identifier and the topology it represents.
     * @param {IMFPresentationDescriptor} pPD Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor.
     * @param {Pointer<Integer>} pId Receives the sequencer element identifier. This value is assigned by the sequencer source when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsequencersource-appendtopology">IMFSequencerSource::AppendTopology</a>. This parameter is optional and can be <b>NULL</b>.
     * @param {Pointer<IMFTopology>} ppTopology Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the original topology that the application added to the sequencer source. The caller must release the interface. This parameter can receive the value <b>NULL</b> if the sequencer source has switched to the next presentation. This parameter is optional and can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The presentation descriptor is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_S_SEQUENCER_CONTEXT_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This segment was canceled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsequencersource-getpresentationcontext
     */
    GetPresentationContext(pPD, pId, ppTopology) {
        pIdMarshal := pId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pPD, pIdMarshal, pId, "ptr*", ppTopology, "HRESULT")
        return result
    }

    /**
     * Updates a topology in the queue.
     * @param {Integer} dwId Sequencer element identifier of the topology to update.
     * @param {IMFTopology} pTopology Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the updated topology object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sequencer source has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsequencersource-updatetopology
     */
    UpdateTopology(dwId, pTopology) {
        result := ComCall(6, this, "uint", dwId, "ptr", pTopology, "HRESULT")
        return result
    }

    /**
     * Updates the flags for a topology in the queue.
     * @param {Integer} dwId Sequencer element identifier of the topology to update.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfsequencertopologyflags">MFSequencerTopologyFlags</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsequencersource-updatetopologyflags
     */
    UpdateTopologyFlags(dwId, dwFlags) {
        result := ComCall(7, this, "uint", dwId, "uint", dwFlags, "HRESULT")
        return result
    }
}
