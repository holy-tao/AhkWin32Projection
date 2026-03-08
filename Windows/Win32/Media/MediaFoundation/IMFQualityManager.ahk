#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Adjusts playback quality. This interface is exposed by the quality manager.
 * @remarks
 * Media Foundation provides a default quality manager that is tuned for playback. Applications can provide a custom quality manager to the Media Session by setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-session-quality-manager-attribute">MF_SESSION_QUALITY_MANAGER</a> attribute when creating the Media Session.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfqualitymanager
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFQualityManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFQualityManager
     * @type {Guid}
     */
    static IID => Guid("{8d009d86-5b9f-4115-b1fc-9f80d52ab8ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyTopology", "NotifyPresentationClock", "NotifyProcessInput", "NotifyProcessOutput", "NotifyQualityEvent", "Shutdown"]

    /**
     * Called when the Media Session is about to start playing a new topology.
     * @remarks
     * In a typical quality manager this method does the following:
     * 
     * <ol>
     * <li>
     * Enumerates the nodes in the topology.
     * 
     * </li>
     * <li>
     * Calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftopologynode-getobject">IMFTopologyNode::GetObject</a> to get the node's underlying object.
     * 
     * </li>
     * <li>
     * Queries for the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfqualityadvise">IMFQualityAdvise</a> interface.
     * 
     * </li>
     * </ol>
     * The quality manager can then use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfqualityadvise">IMFQualityAdvise</a> pointers to adjust audio-video quality as needed.
     * @param {IMFTopology} pTopology Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the new topology. If this parameter is <b>NULL</b>, the quality manager should release any references to the previous topology.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifytopology
     */
    NotifyTopology(pTopology) {
        result := ComCall(3, this, "ptr", pTopology, "HRESULT")
        return result
    }

    /**
     * Called when the Media Session selects a presentation clock.
     * @param {IMFPresentationClock} pClock Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface of the presentation clock. If this parameter is <b>NULL</b>, the quality manager should release any references to the presentation clock.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifypresentationclock
     */
    NotifyPresentationClock(pClock) {
        result := ComCall(4, this, "ptr", pClock, "HRESULT")
        return result
    }

    /**
     * Called when the media processor is about to deliver an input sample to a pipeline component.
     * @remarks
     * This method is called for every sample passing through every pipeline component. Therefore, the method must return quickly to avoid introducing too much latency into the pipeline.
     * @param {IMFTopologyNode} pNode Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface of the topology node that represents the pipeline component.
     * @param {Integer} lInputIndex Index of the input stream on the topology node.
     * @param {IMFSample} pSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the input sample.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifyprocessinput
     */
    NotifyProcessInput(pNode, lInputIndex, pSample) {
        result := ComCall(5, this, "ptr", pNode, "int", lInputIndex, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * Called after the media processor gets an output sample from a pipeline component.
     * @remarks
     * This method is called for every sample passing through every pipeline component. Therefore, the method must return quickly to avoid introducing too much latency into the pipeline.
     * @param {IMFTopologyNode} pNode Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopologynode">IMFTopologyNode</a> interface of the topology node that represents the pipeline component.
     * @param {Integer} lOutputIndex Index of the output stream on the topology node.
     * @param {IMFSample} pSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the output sample.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifyprocessoutput
     */
    NotifyProcessOutput(pNode, lOutputIndex, pSample) {
        result := ComCall(6, this, "ptr", pNode, "int", lOutputIndex, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * Called when a pipeline component sends an MEQualityNotify event.
     * @param {IUnknown} pObject Pointer to the <b>IUnknown</b> interface of the object that sent the event. The object is either a Media Foundation transform (MFT) or a stream sink.
     * @param {IMFMediaEvent} pEvent Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface of the event.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-notifyqualityevent
     */
    NotifyQualityEvent(pObject, pEvent) {
        result := ComCall(7, this, "ptr", pObject, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * Called when the Media Session is shutting down.
     * @remarks
     * The quality manager should release all references to the Media Session when this method is called.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualitymanager-shutdown
     */
    Shutdown() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
