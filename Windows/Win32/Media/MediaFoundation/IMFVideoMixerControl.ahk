#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFVideoNormalizedRect.ahk" { MFVideoNormalizedRect }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls how the Enhanced Video Renderer (EVR) mixes video substreams.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imfvideomixercontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoMixerControl extends IUnknown {
    /**
     * The interface identifier for IMFVideoMixerControl
     * @type {Guid}
     */
    static IID := Guid("{a5c6c53f-c202-4aa5-9695-175ba8c508a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoMixerControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetStreamZOrder     : IntPtr
        GetStreamZOrder     : IntPtr
        SetStreamOutputRect : IntPtr
        GetStreamOutputRect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoMixerControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the z-order of a video stream.
     * @remarks
     * The EVR draws the video streams in the order of their z-order values, starting with zero. The reference stream must be first in the z-order, and the remaining streams can be in any order.
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
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol-setstreamzorder
     */
    SetStreamZOrder(dwStreamID, dwZ) {
        result := ComCall(3, this, "uint", dwStreamID, "uint", dwZ, "HRESULT")
        return result
    }

    /**
     * Retrieves the z-order of a video stream.
     * @param {Integer} dwStreamID Identifier of the stream. For the EVR media sink, the stream identifier is defined when the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> method is called. For the DirectShow EVR filter, the stream identifier corresponds to the pin index. The reference stream is always stream 0.
     * @returns {Integer} Receives the z-order value.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol-getstreamzorder
     */
    GetStreamZOrder(dwStreamID) {
        result := ComCall(4, this, "uint", dwStreamID, "uint*", &pdwZ := 0, "HRESULT")
        return pdwZ
    }

    /**
     * Sets the position of a video stream within the composition rectangle.
     * @remarks
     * The mixer draws each video stream inside a bounding rectangle that is specified relative to the final video image. This bounding rectangle is given in <i>normalized</i> coordinates. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure.
     *       
     * 
     * The coordinates of the bounding rectangle must fall within the range [0.0, 1.0]. Also, the X and Y coordinates of the upper-left corner cannot exceed the X and Y coordinates of the lower-right corner. In other words, the bounding rectangle must fit entirely within the composition rectangle and cannot be flipped vertically or horizontally.
     *       
     * 
     * The following diagram shows how the EVR mixes substreams.
     * 
     * <img alt="Diagram showing an image, then that image inside a larger output rectangle, then a portion of the image in a source rectangle" border="" src="./images/d87d365f-a004-4896-ad03-48cd28449403.gif"/>
     * The output rectangle for the stream is specified by calling <b>SetStreamOutputRect</b>. The source rectangle is specified by calling <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfvideodisplaycontrol-setvideoposition">IMFVideoDisplayControl::SetVideoPosition</a>. The mixer applies the output rectangle first, when it mixes the streams into a single bounding rectangle. This bounding rectangle is called <i>composition space</i>. Then the presenter applies the source rectangle to the composited image.
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
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol-setstreamoutputrect
     */
    SetStreamOutputRect(dwStreamID, pnrcOutput) {
        result := ComCall(5, this, "uint", dwStreamID, MFVideoNormalizedRect.Ptr, pnrcOutput, "HRESULT")
        return result
    }

    /**
     * Retrieves the position of a video stream within the composition rectangle.
     * @param {Integer} dwStreamID The identifier of the stream. For the EVR media sink, the stream identifier is defined when the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a> method is called. For the DirectShow EVR filter, the stream identifier corresponds to the pin index. The reference stream is always stream 0.
     * @returns {MFVideoNormalizedRect} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that receives the bounding rectangle, in normalized coordinates.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol-getstreamoutputrect
     */
    GetStreamOutputRect(dwStreamID) {
        pnrcOutput := MFVideoNormalizedRect()
        result := ComCall(6, this, "uint", dwStreamID, MFVideoNormalizedRect.Ptr, pnrcOutput, "HRESULT")
        return pnrcOutput
    }

    Query(iid) {
        if (IMFVideoMixerControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStreamZOrder := CallbackCreate(GetMethod(implObj, "SetStreamZOrder"), flags, 3)
        this.vtbl.GetStreamZOrder := CallbackCreate(GetMethod(implObj, "GetStreamZOrder"), flags, 3)
        this.vtbl.SetStreamOutputRect := CallbackCreate(GetMethod(implObj, "SetStreamOutputRect"), flags, 3)
        this.vtbl.GetStreamOutputRect := CallbackCreate(GetMethod(implObj, "GetStreamOutputRect"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStreamZOrder)
        CallbackFree(this.vtbl.GetStreamZOrder)
        CallbackFree(this.vtbl.SetStreamOutputRect)
        CallbackFree(this.vtbl.GetStreamOutputRect)
    }
}
