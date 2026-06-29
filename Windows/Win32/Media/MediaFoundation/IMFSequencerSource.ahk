#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFTopology.ahk" { IMFTopology }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFPresentationDescriptor.ahk" { IMFPresentationDescriptor }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by the Sequencer Source.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsequencersource
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSequencerSource extends IUnknown {
    /**
     * The interface identifier for IMFSequencerSource
     * @type {Guid}
     */
    static IID := Guid("{197cd219-19cb-4de1-a64c-acf2edcbe59e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSequencerSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AppendTopology         : IntPtr
        DeleteTopology         : IntPtr
        GetPresentationContext : IntPtr
        UpdateTopology         : IntPtr
        UpdateTopologyFlags    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSequencerSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a topology to the end of the queue.
     * @remarks
     * The sequencer plays topologies in the order they are queued. You can queue as many topologies as you want to preroll.
     * 
     * The application must indicate to the sequencer when it has queued the last topology on the Media Session. To specify the last topology, set the SequencerTopologyFlags_Last flag in the <i>dwFlags</i> parameter when you append the topology. The sequencer uses this information to end playback with the pipeline. Otherwise, the sequencer waits indefinitely for a new topology to be queued.
     * @param {IMFTopology} pTopology Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the topology. This pointer cannot be <b>NULL</b>. If an application passes <b>NULL</b>, the call fails with an E_INVALIDARG error code.
     * @param {Integer} dwFlags A combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfsequencertopologyflags">MFSequencerTopologyFlags</a> enumeration.
     * @returns {Integer} Receives the sequencer element identifier for this topology.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-appendtopology
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-deletetopology
     */
    DeleteTopology(dwId) {
        result := ComCall(4, this, "uint", dwId, "HRESULT")
        return result
    }

    /**
     * Maps a presentation descriptor to its associated sequencer element identifier and the topology it represents.
     * @remarks
     * The topology returned in <i>ppTopology</i> is the original topology that the application specified in <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsequencersource-appendtopology">AppendTopology</a>. The source nodes in this topology contain pointers to the native sources. Do not queue this topology on the Media Session. Instead, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasourcetopologyprovider-getmediasourcetopology">IMFMediaSourceTopologyProvider::GetMediaSourceTopology</a> to get the sequencer source's modified topology. The source nodes in the modified topology contain pointers to the sequencer source, rather than the native sources.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-getpresentationcontext
     */
    GetPresentationContext(pPD, pId, ppTopology) {
        pIdMarshal := pId is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pPD, pIdMarshal, pId, IMFTopology.Ptr, ppTopology, "HRESULT")
        return result
    }

    /**
     * Updates a topology in the queue.
     * @remarks
     * This method is asynchronous. When the operation is completed, the sequencer source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mesequencersourcetopologyupdated">MESequencerSourceTopologyUpdated</a> event.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-updatetopology
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsequencersource-updatetopologyflags
     */
    UpdateTopologyFlags(dwId, dwFlags) {
        result := ComCall(7, this, "uint", dwId, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSequencerSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AppendTopology := CallbackCreate(GetMethod(implObj, "AppendTopology"), flags, 4)
        this.vtbl.DeleteTopology := CallbackCreate(GetMethod(implObj, "DeleteTopology"), flags, 2)
        this.vtbl.GetPresentationContext := CallbackCreate(GetMethod(implObj, "GetPresentationContext"), flags, 4)
        this.vtbl.UpdateTopology := CallbackCreate(GetMethod(implObj, "UpdateTopology"), flags, 3)
        this.vtbl.UpdateTopologyFlags := CallbackCreate(GetMethod(implObj, "UpdateTopologyFlags"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AppendTopology)
        CallbackFree(this.vtbl.DeleteTopology)
        CallbackFree(this.vtbl.GetPresentationContext)
        CallbackFree(this.vtbl.UpdateTopology)
        CallbackFree(this.vtbl.UpdateTopologyFlags)
    }
}
