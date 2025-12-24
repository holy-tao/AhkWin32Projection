#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMStreamConfig interface sets the output format on certain capture and compression filters, for both audio and video.
 * @remarks
 * 
 * Filters expose this interface on their output pins. To use the interface, enumerate the filter's pins and query for <b>IAMStreamConfig</b>. Or, if you are using the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/capture-graph-builder">Capture Graph Builder</a> object to build the filter graph, you can call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-findinterface">ICaptureGraphBuilder2::FindInterface</a> method. Note that a capture filter might have separate pins for capture and preview.
 * 
 * <h3><a id="Filter_Developers"></a><a id="filter_developers"></a><a id="FILTER_DEVELOPERS"></a>Filter Developers</h3>
 * If you are writing a capture filter or compression filter, implement this interface on the video or audio output pin. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/exposing-capture-and-compression-formats">Exposing Capture and Compression Formats</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamstreamconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMStreamConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMStreamConfig
     * @type {Guid}
     */
    static IID => Guid("{c6e13340-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFormat", "GetFormat", "GetNumberOfCapabilities", "GetStreamCaps"]

    /**
     * The SetFormat method sets the output format on the pin.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the new format.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_INVALIDMEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This media type is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input pin is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot set the type; the filter is not stopped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot set the type; the filter is not stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamstreamconfig-setformat
     */
    SetFormat(pmt) {
        result := ComCall(3, this, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * The GetFormat method retrieves the current or preferred output format.
     * @returns {Pointer<AM_MEDIA_TYPE>} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamstreamconfig-getformat
     */
    GetFormat() {
        result := ComCall(4, this, "ptr*", &ppmt := 0, "HRESULT")
        return ppmt
    }

    /**
     * The GetNumberOfCapabilities method retrieves the number of format capabilities that this pin supports.
     * @param {Pointer<Integer>} piCount Pointer to a variable that receives the number of format capabilities.
     * @param {Pointer<Integer>} piSize Pointer to a variable that receives the size of the configuration structure in bytes. See Remarks for more information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamstreamconfig-getnumberofcapabilities
     */
    GetNumberOfCapabilities(piCount, piSize) {
        piCountMarshal := piCount is VarRef ? "int*" : "ptr"
        piSizeMarshal := piSize is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, piCountMarshal, piCount, piSizeMarshal, piSize, "HRESULT")
        return result
    }

    /**
     * The GetStreamCaps method retrieves a set of format capabilities.
     * @param {Integer} iIndex Specifies the format capability to retrieve, indexed from zero. To determine the number of capabilities that the pin supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-getnumberofcapabilities">IAMStreamConfig::GetNumberOfCapabilities</a> method.
     * @param {Pointer<Pointer<AM_MEDIA_TYPE>>} ppmt Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure. The method allocates the structure and fills it with a media type.
     * @param {Pointer<Integer>} pSCC Pointer to a byte array allocated by the caller. For video, use the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-video_stream_config_caps">VIDEO_STREAM_CONFIG_CAPS</a> structure (see Remarks). For audio, use the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-audio_stream_config_caps">AUDIO_STREAM_CONFIG_CAPS</a> structure. To determine the required size of the array, call the <b>GetNumberOfCapabilities</b> method. The size is returned in the <i>piSize</i> parameter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specified index is too high.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
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
     * Invalid index.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamstreamconfig-getstreamcaps
     */
    GetStreamCaps(iIndex, ppmt, pSCC) {
        ppmtMarshal := ppmt is VarRef ? "ptr*" : "ptr"
        pSCCMarshal := pSCC is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "int", iIndex, ppmtMarshal, ppmt, pSCCMarshal, pSCC, "HRESULT")
        return result
    }
}
