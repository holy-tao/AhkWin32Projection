#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMStreamConfig interface sets the output format on certain capture and compression filters, for both audio and video.
 * @remarks
 * Filters expose this interface on their output pins. To use the interface, enumerate the filter's pins and query for <b>IAMStreamConfig</b>. Or, if you are using the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/capture-graph-builder">Capture Graph Builder</a> object to build the filter graph, you can call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-findinterface">ICaptureGraphBuilder2::FindInterface</a> method. Note that a capture filter might have separate pins for capture and preview.
 * 
 * <h3><a id="Filter_Developers"></a><a id="filter_developers"></a><a id="FILTER_DEVELOPERS"></a>Filter Developers</h3>
 * If you are writing a capture filter or compression filter, implement this interface on the video or audio output pin. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/exposing-capture-and-compression-formats">Exposing Capture and Compression Formats</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-iamstreamconfig
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
     * @remarks
     * This method specifies the format for the output pin. If the pin is not connected, it will use this format for its next connection. If the pin is already connected, it will attempt to reconnect with this format. The method might fail if the other pin rejects the new type.
     * 
     * If this method succeeds, subsequent calls to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-enummediatypes">IPin::EnumMediaTypes</a> method will return the new type, and no others.
     * 
     * On most filters, this method fails if the filter is paused or running. On some compression filters, the method fails if the filter's input pin is not connected.
     * 
     * With some filters, you can call this method with the value <b>NULL</b> to reset the pin to its default format.
     * 
     * <b>Filter Developers</b>: The following remarks describe how to implement this method:
     * 
     * If the output pin is not connected, and the pin supports the specified media type, return S_OK. Store the media type and offer it as format number zero in the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasepin-getmediatype">CBasePin::GetMediaType</a> method. Do not offer other formats, and reject other formats in the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasepin-checkmediatype">CBasePin::CheckMediaType</a> method.
     * 
     * If the pin is already connected, and the pin supports the media type, reconnect the pin with that type. If the other pin rejects the new type, return VFW_E_INVALIDMEDIATYPE and restore the original connection.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamstreamconfig-setformat
     */
    SetFormat(pmt) {
        result := ComCall(3, this, "ptr", pmt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetFormat method retrieves the current or preferred output format.
     * @remarks
     * If the pin is connected, this method returns the format that the pin is currently using. Otherwise, the method returns the pin's preferred format for the next pin connection. If you have already called the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-setformat">IAMStreamConfig::SetFormat</a> method to set the format, <c>GetFormat</c> returns the same format. If not, it returns the first format in the pin's list of preferred formats, as determined by the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipin-enummediatypes">IPin::EnumMediaTypes</a> method.
     * 
     * The method allocates the memory for the <b>AM_MEDIA_TYPE</b> structure, fills in the structure, and returns it in the <i>pmt</i> parameter. The caller must release the memory, including the format block. You can use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/deletemediatype">DeleteMediaType</a> helper function in the base class library.
     * 
     * On some compression filters, the method fails if the filter's input pin is not connected.
     * @returns {Pointer<AM_MEDIA_TYPE>} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamstreamconfig-getformat
     */
    GetFormat() {
        result := ComCall(4, this, "ptr*", &ppmt := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppmt
    }

    /**
     * The GetNumberOfCapabilities method retrieves the number of format capabilities that this pin supports.
     * @remarks
     * An output pin can support more than one set of format capabilities. This method returns the total number of capabilities that the pin supports; the number is returned in the <i>piCount</i> parameter. To retrieve a particular set of capabilities, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-getstreamcaps">IAMStreamConfig::GetStreamCaps</a> method. Format capabilities are indexed from zero, so the value returned in <i>piCount</i> is one more than the upper bound.
     * 
     * Depending on the pin's format type, the [VIDEO_STREAM_CONFIG_CAPS](/windows/desktop/api/strmif/ns-strmif-video_stream_config_caps) structure (for video) or an [AUDIO_STREAM_CONFIG_CAPS](/windows/desktop/api/strmif/ns-strmif-audio_stream_config_caps) structure (for audio). The <i>piSize</i> parameter receives the size of the structure, in bytes.
     * 
     * On some compression filters, this method fails if the filter's input pin is not connected.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamstreamconfig-getnumberofcapabilities
     */
    GetNumberOfCapabilities(piCount, piSize) {
        piCountMarshal := piCount is VarRef ? "int*" : "ptr"
        piSizeMarshal := piSize is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, piCountMarshal, piCount, piSizeMarshal, piSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetStreamCaps method retrieves a set of format capabilities.
     * @remarks
     * This method returns two pieces of information:
     * 
     * <ul>
     * <li>The <i>pmt</i> parameter receives a filled-in <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure, which describes one supported output format.</li>
     * <li>The <i>pSCC</i> parameter receives a structure that contains additional format information. For video, <i>pSCC</i> receives a <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-video_stream_config_caps">VIDEO_STREAM_CONFIG_CAPS</a> structure. For audio, it receives an <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-audio_stream_config_caps">AUDIO_STREAM_CONFIG_CAPS</a> structure.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  Use of the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-video_stream_config_caps">VIDEO_STREAM_CONFIG_CAPS</a> structure to configure a video device is deprecated. Although the caller must allocate the buffer, it should ignore the contents after the method returns. The capture device will return its supported formats through the <i>pmt</i> parameter.</div>
     * <div> </div>
     * To configure the output pin so that it uses this format, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-setformat">IAMStreamConfig::SetFormat</a> method and pass in the value of <i>pmt</i>.
     * 
     * Before calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamconfig-setformat">SetFormat</a>, you can modify the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure in <i>pmt</i>, using the information in <i>pSCC</i>. For example, an audio pin might return a default media type of 44-kHz, 16-bit stereo in the <i>pmt</i> parameter. Based on the values returned in the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-audio_stream_config_caps">AUDIO_STREAM_CONFIG_CAPS</a> structure, you might change this format to 8-bit mono before calling <b>SetFormat</b>.
     * 
     * The method allocates the memory for the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that is returned in the <i>pmt</i> parameter. The caller must release the memory, including the format block. You can use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/deletemediatype">DeleteMediaType</a> helper function in the base class library. The caller must allocate the memory for the <i>pSCC</i> parameter.
     * 
     * On some compression filters, this method fails if the filter's input pin is not connected.
     * 
     * <b>Filter Developers</b>: For more information on implementing this method, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/exposing-capture-and-compression-formats">Exposing Capture and Compression Formats</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamstreamconfig-getstreamcaps
     */
    GetStreamCaps(iIndex, ppmt, pSCC) {
        ppmtMarshal := ppmt is VarRef ? "ptr*" : "ptr"
        pSCCMarshal := pSCC is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "int", iIndex, ppmtMarshal, ppmt, pSCCMarshal, pSCC, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
