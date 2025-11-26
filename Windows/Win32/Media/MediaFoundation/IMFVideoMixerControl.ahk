#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFVideoNormalizedRect.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how the Enhanced Video Renderer (EVR) mixes video substreams.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideomixercontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoMixerControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoMixerControl
     * @type {Guid}
     */
    static IID => Guid("{a5c6c53f-c202-4aa5-9695-175ba8c508a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStreamZOrder", "GetStreamZOrder", "SetStreamOutputRect", "GetStreamOutputRect"]

    /**
     * Sets the z-order of a video stream.
     * @param {Integer} dwStreamID Identifier of the stream. For the EVR media sink, the stream identifier is defined when the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> method is called. For the DirectShow EVR filter, the stream identifier corresponds to the pin index. The reference stream is always stream 0.
     * @param {Integer} dwZ Z-order value. The z-order of the reference stream must be zero. The maximum z-order value is the number of streams minus one.
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
     * The value of <i>dwZ</i> is larger than the maximum z-order value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid z-order for this stream. For the reference stream, <i>dwZ</i> must be zero. For all other streams, <i>dwZ</i> must be greater than zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream identifier.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideomixercontrol-setstreamzorder
     */
    SetStreamZOrder(dwStreamID, dwZ) {
        result := ComCall(3, this, "uint", dwStreamID, "uint", dwZ, "HRESULT")
        return result
    }

    /**
     * Retrieves the z-order of a video stream.
     * @param {Integer} dwStreamID Identifier of the stream. For the EVR media sink, the stream identifier is defined when the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> method is called. For the DirectShow EVR filter, the stream identifier corresponds to the pin index. The reference stream is always stream 0.
     * @returns {Integer} Receives the z-order value.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideomixercontrol-getstreamzorder
     */
    GetStreamZOrder(dwStreamID) {
        result := ComCall(4, this, "uint", dwStreamID, "uint*", &pdwZ := 0, "HRESULT")
        return pdwZ
    }

    /**
     * Sets the position of a video stream within the composition rectangle.
     * @param {Integer} dwStreamID Identifier of the stream. For the EVR media sink, the stream identifier is defined when the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> method is called. For the DirectShow EVR filter, the stream identifier corresponds to the pin index. The reference stream is always stream 0.
     * @param {Pointer<MFVideoNormalizedRect>} pnrcOutput Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that defines the bounding rectangle for the video stream.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * The coordinates of the bounding rectangle given in <i>pnrcOutput</i> are not valid.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream identifier.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideomixercontrol-setstreamoutputrect
     */
    SetStreamOutputRect(dwStreamID, pnrcOutput) {
        result := ComCall(5, this, "uint", dwStreamID, "ptr", pnrcOutput, "HRESULT")
        return result
    }

    /**
     * Retrieves the position of a video stream within the composition rectangle.
     * @param {Integer} dwStreamID The identifier of the stream. For the EVR media sink, the stream identifier is defined when the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> method is called. For the DirectShow EVR filter, the stream identifier corresponds to the pin index. The reference stream is always stream 0.
     * @returns {MFVideoNormalizedRect} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that receives the bounding rectangle, in normalized coordinates.
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfvideomixercontrol-getstreamoutputrect
     */
    GetStreamOutputRect(dwStreamID) {
        pnrcOutput := MFVideoNormalizedRect()
        result := ComCall(6, this, "uint", dwStreamID, "ptr", pnrcOutput, "HRESULT")
        return pnrcOutput
    }
}
