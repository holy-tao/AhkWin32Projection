#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGraphBuilder.ahk
#Include .\IPin.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICaptureGraphBuilder2 interface builds capture graphs and other custom filter graphs.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-icapturegraphbuilder2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ICaptureGraphBuilder2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICaptureGraphBuilder2
     * @type {Guid}
     */
    static IID => Guid("{93e5a4e0-2d50-11d2-abfa-00a0c9c6e38d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFiltergraph", "GetFiltergraph", "SetOutputFileName", "FindInterface", "RenderStream", "ControlStream", "AllocCapFile", "CopyCaptureFile", "FindPin"]

    /**
     * The SetFiltergraph method specifies a filter graph for the capture graph builder to use.
     * @remarks
     * If you do not call this method, the capture graph builder automatically creates a filter graph when it needs one. If the capture graph builder already has a filter graph, this method returns E_UNEXPECTED.
     * @param {IGraphBuilder} pfg Pointer to the filter graph's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-setfiltergraph
     */
    SetFiltergraph(pfg) {
        result := ComCall(3, this, "ptr", pfg, "HRESULT")
        return result
    }

    /**
     * The GetFiltergraph method retrieves the filter graph that the capture graph builder is using.
     * @remarks
     * Initially, the capture graph builder does not hold a pointer to a filter graph. This method returns E_UNEXPECTED until one of the following methods has been called:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-renderstream">ICaptureGraphBuilder2::RenderStream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-setfiltergraph">ICaptureGraphBuilder2::SetFiltergraph</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-setoutputfilename">ICaptureGraphBuilder2::SetOutputFileName</a>
     * </li>
     * </ul>
     * This method increments the reference count on the <b>IGraphBuilder</b> interface. Be sure to release the interface when you are done with it.
     * @returns {IGraphBuilder} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-getfiltergraph
     */
    GetFiltergraph() {
        result := ComCall(4, this, "ptr*", &ppfg := 0, "HRESULT")
        return IGraphBuilder(ppfg)
    }

    /**
     * The SetOutputFileName method creates the file writing section of the filter graph.
     * @remarks
     * This method creates a multiplexer filter based on the value of the <i>pType</i> parameter. For AVI, it creates the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avi-mux-filter">AVI Mux Filter</a>. For ASF, it creates the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wm-asf-writer-filter">WM ASF Writer</a>. For other values, it creates the filter identified by the CLSID. It adds the multiplexer to the filter graph, and returns a pointer to its <b>IBaseFilter</b> interface in the <i>ppf</i> parameter.
     * 
     * If the multiplexer supports the <b>IFileSinkFilter</b> interface, the method calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifilesinkfilter-setfilename">IFileSinkFilter::SetFileName</a> to set the output file name, using the value given in the <i>lpwstrFile</i> parameter. If the multiplexer does not support <b>IFileSinkFilter</b> interface, the method adds the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/file-writer-filter">File Writer Filter</a> to the filter graph, connects the multiplexer to the file writer, and uses the file writer's <b>IFileSinkFilter</b> interface to call <b>SetFileName</b>. If the <i>pSink</i> parameter is not <b>NULL</b>, it receives a pointer to the <b>IFileSinkFilter</b> interface.
     * 
     * You can use the pointer to the multiplexer filter, returned in the <i>ppf</i> parameter, as the <i>pSink</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-renderstream">ICaptureGraphBuilder2::RenderStream</a> method.
     * 
     * For custom multiplexer filters, the method fails if the filter does not support a connection on its output pin before its input pins are connected. For example, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wavdest-filter-sample">WavDest Filter Sample</a> included with the SDK has this limitation.
     * 
     * If the method succeeds, the <b>IBaseFilter</b> interface returned in the <i>ppf</i> parameter has an outstanding reference count. If the method succeeds and <i>pSink</i> is not <b>NULL</b>, the <b>IFileSinkFilter</b> interface also has an outstanding reference count. Be sure to release both interfaces when you are done using them.
     * @param {Pointer<Guid>} pType Pointer to a <b>GUID</b> that represents either the media subtype of the output or the class identifier (CLSID) of a multiplexer filter or file writer filter. If you specify a media subtype, it must be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>MEDIASUBTYPE_Avi</td>
     * <td>Audio-Video Interleaved (AVI)</td>
     * </tr>
     * <tr>
     * <td>MEDIASUBTYPE_Asf</td>
     * <td>Advanced Systems Format (ASF)</td>
     * </tr>
     * </table>
     * @param {PWSTR} lpstrFile Pointer to a wide-character string that contains the output file name.
     * @param {Pointer<IBaseFilter>} ppf Address of a pointer that receives the multiplexer's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface.
     * @param {Pointer<IFileSinkFilter>} ppSink Address of a pointer that receives the file writer's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifilesinkfilter">IFileSinkFilter</a> interface. Can be <b>NULL</b>.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-setoutputfilename
     */
    SetOutputFileName(pType, lpstrFile, ppf, ppSink) {
        lpstrFile := lpstrFile is String ? StrPtr(lpstrFile) : lpstrFile

        result := ComCall(5, this, "ptr", pType, "ptr", lpstrFile, "ptr*", ppf, "ptr*", ppSink, "HRESULT")
        return result
    }

    /**
     * The FindInterface method searches the graph for a specified interface, starting from a specified filter.
     * @remarks
     * In a capture graph, various filters and pins might expose interfaces for setting properties such as compression parameters (<a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamvideocompression">IAMVideoCompression</a>) or stream formats (<a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamstreamconfig">IAMStreamConfig</a>). Depending on the capture device, other useful interfaces might include <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamcrossbar">IAMCrossbar</a>, which routes analog signals, or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamtvtuner">IAMTVTuner</a>, which controls a TV tuner device. You can use this method to find an interface, without writing special code that traverses the graph.
     * 
     * <div class="alert"><b>Important</b>  Do not call this method to obtain an <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-ivideowindow">IVideoWindow</a> interface pointer. Always query the filter graph manager for this interface. Otherwise, the filter graph manager will not respond correctly to changes in screen resolution and other events.</div>
     * <div> </div>
     * If the <i>pCategory</i> parameter is <b>NULL</b>, this method searches the entire graph for the requested interface. Starting from the filter specified by the <i>pf</i> parameter, it queries the following objects in the graph.
     * 
     * <ul>
     * <li>The filter</li>
     * <li>The filter's pins</li>
     * <li>All the downstream filters, including their pins</li>
     * <li>All the upstream filters, including their pins</li>
     * </ul>
     * You can restrict the search by setting the <i>pCategory</i> and <i>pType</i> parameters, as follows:
     * 
     * <ul>
     * <li>If <i>pCategory</i> equals &amp;LOOK_UPSTREAM_ONLY, the search starts from the filter's input pins and continues upstream. It does not include the filter or anything downstream from the filter. The <i>pType</i> parameter is ignored.</li>
     * <li>If <i>pCategory</i> equals &amp;LOOK_DOWNSTREAM_ONLY, the search starts from the filter's output pins and continues downstream. It does not include the filter or anything upstream from the filter. The <i>pType</i> parameter is ignored.</li>
     * <li>If <i>pCategory</i> specifies a pin category, the downstream portion of the search is restricted to output pins on the filter that match both the pin category and the media type given in the <i>pType</i> parameter. In this case, the method also searches the filter and everything upstream from the filter.</li>
     * </ul>
     * In addition, if <i>pCategory</i> is non-<b>NULL</b>, the method may add certain Windows Driver Model (WDM) filters upstream from filter specified in <i>pf</i>. See the remarks under "Supporting Filters" in this section for more information.
     * 
     * Pin categories are useful for finding pin interfaces on capture filters. For example, a capture filter might have separate pins for capture and preview. If you specify a pin category, you should also specify the media type, to make certain the method selects the correct filter and pin.
     * 
     * Some video capture filters have a video port pin (PIN_CATEGORY_VIDEOPORT) instead of a preview pin. If you specify PIN_CATEGORY_PREVIEW and MEDIATYPE_Video, the method treats any video port pins as preview pins. Your application does not have to test for this possibility.
     * 
     * <b>Supporting Filters</b>. If a capture device uses a Windows Driver Model (WDM) driver, the graph may require certain filters upstream from the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture</a> filter, such as a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/tv-tuner-filter">TV Tuner</a> filter or an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/analog-video-crossbar-filter">Analog Video Crossbar</a> filter. If the <i>pCategory</i> parameter does not equal <b>NULL</b>, this method automatically inserts any required WDM filters into the graph. To do so, it queries the input pins on the capture filter to determine what mediums they support, and connects them to matching filters. If the <i>pCategory</i> parameter is <b>NULL</b>, the method does not add the upstream filters.
     * @param {Pointer<Guid>} pCategory A pointer to a GUID that specifies the search criteria. See Remarks for more information. The following values are possible:
     * 
     * <ul>
     * <li>&amp;LOOK_UPSTREAM_ONLY.</li>
     * <li>&amp;LOOK_DOWNSTREAM_ONLY.</li>
     * <li>One of the pin categories listed in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a>. </li>
     * <li><b>NULL</b></li>
     * </ul>
     * See Remarks for more information.
     * @param {Pointer<Guid>} pType Pointer to a GUID that specifies the major media type of an output pin, or <b>NULL</b>.
     * @param {IBaseFilter} pf Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter. The method begins searching from this filter.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the interface to locate.
     * @returns {Pointer<Void>} Address of a variable that receives the interface pointer. Be sure to release the retrieved interface pointer when you are done with the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-findinterface
     */
    FindInterface(pCategory, pType, pf, riid) {
        result := ComCall(6, this, "ptr", pCategory, "ptr", pType, "ptr", pf, "ptr", riid, "ptr*", &ppint := 0, "HRESULT")
        return ppint
    }

    /**
     * The RenderStream method connects an output pin on a source filter to a sink filter, optionally through an intermediate filter.
     * @remarks
     * This method renders a stream by connecting two or more filters together in a chain:
     * 
     * <ul>
     * <li>The <i>pSource</i> parameter specifies the start of the chain, either a filter or an output pin.</li>
     * <li>The <i>pIntermediate</i> parameter specifies an intermediate filter, typically a compression filter. This parameter can be <b>NULL</b>.</li>
     * <li>The <i>pSink</i> parameter specifies the filter at the end of the chain. Typically, this filter is either a renderer for preview, or a mux for file capture.</li>
     * </ul>
     * The method connects <i>pSource</i> to <i>pIntermediate</i>, and then connects <i>pIntermediate</i> to <i>pSink</i>. If <i>pIntermediate</i> is <b>NULL</b>, the method just connects <i>pSource</i> to <i>pSink</i>. All of the filters specified by <i>pSource</i>, <i>pIntermediate</i>, and <i>pSink</i> must be added to the graph prior to calling the method. The method uses <a href="https://docs.microsoft.com/windows/desktop/DirectShow/intelligent-connect">Intelligent Connect</a>, so additional filters such as decoders might be added to the graph.
     * 
     * If the <i>pSink</i> parameter is <b>NULL</b>, the method tries to use a default renderer. For video it uses the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-renderer-filter">Video Renderer</a>, and for audio it uses the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/directsound-renderer-filter">DirectSound Renderer</a>.
     * 
     * If <i>pSource</i> is a filter, the method searches for an output pin on that filter. In that case, use the <i>pCategory</i> and <i>pType</i> parameters to narrow the search. For example, if a filter has separate pins for preview and capture, you can specify either PIN_CATEGORY_CAPTURE or PIN_CATEGORY_PREVIEW. If <i>pSource</i> is an output pin, set the <i>pCategory</i> and <i>pType</i> to <b>NULL</b>.
     * 
     * In all cases, the method searches for unconnected pins. If more than one pin meets the specified criteria, the method uses the first such pin that it finds.
     * 
     * Note that for DV capture, if the media type is MEDIATYPE_Interleaved and the <i>pSink</i> parameter is <b>NULL</b>, the method splits the interleaved stream into an audio stream and a video stream, and renders both of those streams.
     * 
     * The <c>RenderStream</c> method handles many of the details required for capture graphs:
     * 
     * <b>Smart Tee</b>. Some capture filters have a capture pin but no preview pin. To preview, the capture pin must be connected to the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/smart-tee-filter">Smart Tee Filter</a>. This filter splits the data into two streams, a capture stream and a preview stream. When you specify PIN_CATEGORY_PREVIEW or PIN_CATEGORY_CAPTURE, the method inserts a Smart Tee filter if one is needed. Then it renders the specified stream on the Smart Tee filter. If you render a preview stream and the method uses a Smart Tee filter, it returns VFW_S_NOPREVIEWPIN.
     * 
     * <b>Closed Captioning</b>. You can use this method to capture or preview closed captioning. Some capture filters deliver Vertical Blanking Interval (VBI) data, others deliver closed captioning data. To handle either case, call the method twice, once using PIN_CATEGORY_VBI and once using PIN_CATEGORY_CC. The method inserts any filters needed to convert VBI data to closed captioning. To preview the data, set the <i>pSink</i> parameter to <b>NULL</b>. To capture the data to a file, use the multiplexer filter's <b>IBaseFilter</b> interface pointer. You can capture and preview the data in the same graph. Call the method once using <b>NULL</b> and again using the multiplexer. Set the <i>pIntermediate</i> parameter to <b>NULL</b>.
     * 
     * <b>Video Port Pins</b>. Filters that work with video port extension (VPE) video capture hardware might have video port pins (PIN_CATEGORY_VIDEOPORT) instead of preview pins. For preview or capture to work, a video port pin must connect to the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer Filter</a>. The method handles this detail. You do not have to specify PIN_CATEGORY_VIDEOPORT. Specify PIN_CATEGORY_PREVIEW or PIN_CATEGORY_CAPTURE, and the method will connect the pin correctly. In a similar way, some filters deliver VBI data using video port pins (PIN_CATEGORY_VIDEOPORT_VBI). As with PIN_CATEGORY_VIDEOPORT, the method handles this detail. You do not have to specify PIN_CATEGORY_VIDEOPORT_VBI.
     * 
     * <b>Supporting Filters</b>. If a capture device uses a Windows Driver Model (WDM) driver, the graph may require certain filters upstream from the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a>, such as a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/tv-tuner-filter">TV Tuner Filter</a> or an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/analog-video-crossbar-filter">Analog Video Crossbar Filter</a>. If this method successfully renders the stream, it also inserts any WDM filters that are required in your graph. The method queries the input pins on the capture filter to determine what mediums they support, and connects them to matching filters.
     * 
     * <h3><a id="Example_Code"></a><a id="example_code"></a><a id="EXAMPLE_CODE"></a>Example Code</h3>
     * For a typical capture graph, connect the preview pin to the default renderer, with no intermediate filter:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * // Video: 
     * pBuilder-&gt;RenderStream(&amp;PIN_CATEGORY_PREVIEW, &amp;MEDIATYPE_Video, 
     *     pCaptureFilter, NULL, NULL); 
     * // Audio:
     * pBuilder-&gt;RenderStream(&amp;PIN_CATEGORY_PREVIEW, &amp;MEDIATYPE_Audio, 
     *     pCaptureFilter, NULL, NULL); 
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * Connect the capture pin to a mux filter or file writer filter, depending on what type of file you wish to output. For AVI files, use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avi-mux-filter">AVI Mux</a> filter. For ASF files, use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wm-asf-writer-filter">WM ASF Writer</a> filter. Typically, you will get a pointer to this filter from the <i>ppf</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-setoutputfilename">ICaptureGraphBuilder2::SetOutputFileName</a> method.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * pBuilder-&gt;SetOutputFileName(&amp;MEDIASUBTYPE_Avi, L"C:\\Example.avi", 
     *     &amp;ppf, &amp;pSink);
     * pBuilder-&gt;RenderStream(&amp;PIN_CATEGORY_CAPTURE, &amp;MEDIATYPE_Video,
     *     pCaptureFilter, NULL, ppf);
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * <h3><a id="File_Sources"></a><a id="file_sources"></a><a id="FILE_SOURCES"></a>File Sources</h3>
     * You can use this method to transcode or recompress a file. The following discussion assumes that the file has at most one video stream and one audio stream, or else a single interleaved stream. Otherwise, the method will not work correctly.
     * 
     * A file source has one output pin, so set <i>pCategory</i> and <i>pType</i> to <b>NULL</b>. Call the method twice—once to render the video stream, and once to render the audio stream. The first call connects the source filter to a parser filter and renders one of the parser filter's output pins. The second call renders the parser's remaining output pin. If you are compressing one stream but not the other, make sure to specify the compressor filter in the first call. The method will automatically pick the correct stream based on the compression type.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * pBuilder-&gt;RenderStream(NULL, NULL, pSrc, pCompressor, pMux);
     * pBuilder-&gt;RenderStream(NULL, NULL, pSrc, NULL, pMux);
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * For a complete example, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/recompressing-an-avi-file">Recompressing an AVI File</a>.
     * @param {Pointer<Guid>} pCategory A pointer to a GUID that specifies one of the pin categories listed in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a>. To match any pin, regardless of category, set this parameter to <b>NULL</b>. Typical values include the following.
     * 
     * <ul>
     * <li>PIN_CATEGORY_CAPTURE</li>
     * <li>PIN_CATEGORY_PREVIEW</li>
     * <li>PIN_CATEGORY_CC</li>
     * </ul>
     * @param {Pointer<Guid>} pType Pointer to a major-type GUID that specifies the media type of the output pin; or <b>NULL</b> to use any pin, regardless of media type. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/major-types">Major Types</a>.
     * @param {IUnknown} pSource Specifies a pointer to the starting filter for the connection, or to an output pin.
     * @param {IBaseFilter} pfCompressor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of an intermediate filter, such as a compression filter. Can be <b>NULL</b>.
     * @param {IBaseFilter} pfRenderer Pointer to the <b>IBaseFilter</b> interface of a sink filter, such as a renderer or mux filter. If the value is <b>NULL</b>, the method uses a default renderer (see Remarks).
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible return values include the following.
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
     * <dt><b>VFW_S_NOPREVIEWPIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Preview was rendered through the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/smart-tee-filter">Smart Tee Filter</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * Invalid argument.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_IN_GRAPH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A filter is not in the filter graph. This error can occur if you did not call <b>AddFilter</b> to add <i>pSource</i>, <i>pIntermediate</i>, or <i>pSink</i> to the graph. It can also occur if you did not call <b>SetFiltergraph</b> to connect your graph to the Capture Graph Builder; in this case, the Capture Graph Builder object automatically creates its own filter graph. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/about-the-capture-graph-builder">About the Capture Graph Builder</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-renderstream
     */
    RenderStream(pCategory, pType, pSource, pfCompressor, pfRenderer) {
        result := ComCall(7, this, "ptr", pCategory, "ptr", pType, "ptr", pSource, "ptr", pfCompressor, "ptr", pfRenderer, "HRESULT")
        return result
    }

    /**
     * The ControlStream method sets the start and stop times for one or more streams of captured data.
     * @remarks
     * This method locates output pins on capture filters, using search criteria that you supply in the method call. Then it calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamstreamcontrol">IAMStreamControl</a> methods on those pins. This method enables an application to control streams without the application needing to enumerate the filters and pins in the graph.
     * 
     * Use this method for frame-accurate capture, or for individual control of capture and preview. For example, you can stop capturing to disk but leave video preview running.
     * 
     * The first three parameters specify which pins to control. A capture graph can have more than one capture filter. For example, it might have filters for video, audio, and closed captioning data. Also, a capture filter can have more than one output pin. Some capture filters have separate pins for preview and capture, or separate pins for video-only data and audio-video interleaved data. To control video preview, for example, specify PIN_CATEGORY_PREVIEW for <i>pCategory</i> and MEDIATYPE_Video for <i>pType</i>.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">If the pin category is PIN_CATEGORY_PREVIEW, you cannot set specific start and stop times, because the samples delivered by a preview pin have no time stamps (see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/time-stamps">Time Stamps</a>). Instead, use the values <b>NULL</b> and <b>MAXLONGLONG</b> to start and stop the pin at the desired times.
     * 
     * <p class="note">Also, this method is not supported for preview if the device uses a video port pin, because in that case the device is delivering the preview samples directly over hardware.
     * 
     * </div>
     * <div> </div>
     * To control a pin, this method calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamcontrol-startat">IAMStreamControl::StartAt</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamstreamcontrol-stopat">IAMStreamControl::StopAt</a> methods. Each pin sends an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-stream-control-started">EC_STREAM_CONTROL_STARTED</a> event notification when it starts. The second parameter of the event notification is the value given in <i>wStartCookie</i>. When the pin stops, it sends an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-stream-control-stopped">EC_STREAM_CONTROL_STOPPED</a> event notification. The second parameter of that event notification is the value given in <i>wStopCookie</i>.
     * 
     * When this method locates a matching pin, it searches downstream for another filter that supports <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamstreamcontrol">IAMStreamControl</a> (typically a multiplexer). If it finds one, it also sets the start and stop times on that filter. This generates two pairs of stop notifications: one for the capture filter, and one for the downstream filter. Only the stop notification from the downstream filter uses the <i>wStopCookie</i> parameter. Waiting for this event guarantees that the downstream filter receives the last sample.
     * 
     * If no downstream filter supports <b>IAMStreamControl</b>, the method returns S_FALSE. In that case, you might receive the stop notification before the last sample is rendered.
     * 
     * <b>MAXLONGLONG</b> is the largest possible <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> value. In the DirectShow base class library, it is also defined as the constant <b>MAX_TIME</b>.
     * @param {Pointer<Guid>} pCategory A pointer to a GUID that specifies one of the pin categories listed in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a>. The value of this parameter cannot be <b>NULL</b>.
     * @param {Pointer<Guid>} pType Pointer to a major type GUID that specifies the media type, or <b>NULL</b>. If this parameter is <b>NULL</b>, set the <i>pFilter</i> parameter to <b>NULL</b> as well. Otherwise, you might control the wrong pin and get unpredictable results.
     * @param {IBaseFilter} pFilter Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface that specifies which filter to control. To control all the capture filters in the graph, set this parameter to <b>NULL</b>.
     * @param {Pointer<Integer>} pstart Pointer to a variable that contains the start time. If the value is <b>MAXLONGLONG</b> (0x7FFFFFFFFFFFFFFF), the method cancels the previous start request. If the value is <b>NULL</b>, the pin starts immediately when the graph runs.
     * @param {Pointer<Integer>} pstop Pointer to a variable that contains the stop time. If the value is <b>MAXLONGLONG</b>, the method cancels any previous stop request. If the value is <b>NULL</b>, the pin stops immediately.
     * @param {Integer} wStartCookie Value that is sent as the second parameter of the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-stream-control-started">EC_STREAM_CONTROL_STARTED</a> event notification. See Remarks for more information.
     * @param {Integer} wStopCookie Value that is sent as the second parameter of the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-stream-control-stopped">EC_STREAM_CONTROL_STOPPED</a> event notification. See Remarks for more information.
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
     * At least one downstream renderer will not send a stop notification.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find a matching pin, or the pin did not support stream control.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-controlstream
     */
    ControlStream(pCategory, pType, pFilter, pstart, pstop, wStartCookie, wStopCookie) {
        pstartMarshal := pstart is VarRef ? "int64*" : "ptr"
        pstopMarshal := pstop is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "ptr", pCategory, "ptr", pType, "ptr", pFilter, pstartMarshal, pstart, pstopMarshal, pstop, "ushort", wStartCookie, "ushort", wStopCookie, "HRESULT")
        return result
    }

    /**
     * The AllocCapFile method preallocates a capture file to a specified size. For best results, always capture to a defragmented, preallocated capture file that is larger than the size of the capture data.
     * @remarks
     * This method fails if the file is read-only.
     * 
     * It is best to allocate as much space as possible—ideally, more than needed. However, this can result in a very large file that contains relatively little data. For example, a 1-gigabyte (GB) capture file might contain a few megabytes of captured video. Use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-copycapturefile">ICaptureGraphBuilder2::CopyCaptureFile</a> method to copy the data into a new file. That method copies only the data and ignores the empty portion of the original file.
     * 
     * If you use this method to preallocate the file, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifilesinkfilter2-setmode">IFileSinkFilter2::SetMode</a> on the file-writer filter with the value zero. If the filter is set to AM_FILE_OVERWRITE, it will delete the preallocated file. Note that some file-writer filters do not support mode 0.
     * @param {PWSTR} lpstr Pointer to a wide-character string that contains the name of the file to create or resize.
     * @param {Integer} dwlSize Size of the file to allocate, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-alloccapfile
     */
    AllocCapFile(lpstr, dwlSize) {
        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        result := ComCall(9, this, "ptr", lpstr, "uint", dwlSize, "HRESULT")
        return result
    }

    /**
     * The CopyCaptureFile method copies the valid media data from a capture file.
     * @remarks
     * Typically, you will first capture to a large preallocated file. This method copies just the valid data to a new file. As a result, the new file can be much smaller than the original file.
     * 
     * The source and destination files must be AVI files. Other file types are not supported.
     * 
     * To display the progress of the copy operation, implement the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamcopycapturefileprogress">IAMCopyCaptureFileProgress</a> interface and pass a pointer to the interface in the <i>pCallback</i> parameter. If <i>pCallback</i> is non-<b>NULL</b>, this method periodically calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamcopycapturefileprogress-progress">IAMCopyCaptureFileProgress::Progress</a> method with an integer between 0 and 100 that specifies the percentage complete.
     * @param {PWSTR} lpwstrOld Pointer to a wide-character string that contains the source file name.
     * @param {PWSTR} lpwstrNew Pointer to a wide-character string that contains the destination file name. Valid data is copied to this file.
     * @param {Integer} fAllowEscAbort Boolean value that specifies whether pressing the ESC key cancels the copy operation. If the value is <b>TRUE</b> and the user presses the ESC key, the operation halts. If the value is <b>FALSE</b>, the method ignores the ESC key.
     * @param {IAMCopyCaptureFileProgress} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamcopycapturefileprogress">IAMCopyCaptureFileProgress</a> interface to display progress information, or <b>NULL</b>. See Remarks for more information.
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
     * User canceled the operation before it completed.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * Could not open the source file or destination file.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-copycapturefile
     */
    CopyCaptureFile(lpwstrOld, lpwstrNew, fAllowEscAbort, pCallback) {
        lpwstrOld := lpwstrOld is String ? StrPtr(lpwstrOld) : lpwstrOld
        lpwstrNew := lpwstrNew is String ? StrPtr(lpwstrNew) : lpwstrNew

        result := ComCall(10, this, "ptr", lpwstrOld, "ptr", lpwstrNew, "int", fAllowEscAbort, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * The FindPin method retrieves a particular pin on a filter, or determines whether a given pin matches the specified criteria.
     * @remarks
     * If <i>pSource</i> is a pointer to a filter, the method searches for the <i>n</i>th pin on that filter that matches the search criteria, where <i>n</i> is given by the <i>num</i> parameter. If the method finds a matching pin, it returns a pointer to the pin in the <i>ppPin</i> parameter.
     * 
     * If <i>pSource</i> is a pointer to a pin, the method tests that pin against the search criteria. If the pin matches the criteria, the method returns S_OK, and returns a pointer to the pin's <b>IPin</b> interface in the <i>ppPin</i> parameter. Otherwise, it returns E_FAIL.
     * 
     * In either case, if the method succeeds, the <b>IPin</b> interface returned in the <i>ppPin</i> parameter has an outstanding reference count. Be sure to release the interface when you are done using it.
     * 
     * Typically, an application will not need to use this method. It is provided for unusually complex tasks, when the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder2-renderstream">ICaptureGraphBuilder2::RenderStream</a> method cannot build the filter graph. Use this method to retrieve a desired pin from a capture filter, and then build the rest of the graph manually.
     * @param {IUnknown} pSource Pointer to an interface on a filter, or to an interface on a pin.
     * @param {Integer} pindir Member of the [PIN_DIRECTION](/windows/desktop/api/strmif/ne-strmif-pin_direction) enumeration that specifies the pin direction (input or output).
     * @param {Pointer<Guid>} pCategory A pointer to a GUID that specifies one of the pin categories listed in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a>. To match any pin, regardless of category, set this parameter to <b>NULL</b>.
     * @param {Pointer<Guid>} pType Pointer to a major type GUID that specifies the media type. Use <b>NULL</b> to match any media type.
     * @param {BOOL} fUnconnected Boolean value that specifies whether the pin must be unconnected. If <b>TRUE</b>, the pin must be unconnected. If <b>FALSE</b>, the pin can be connected or unconnected.
     * @param {Integer} num Zero-based index of the pin to retrieve, from the set of matching pins. If <i>pSource</i> is a pointer to a filter, and more than one pin matches the search criteria, this parameter specifies which pin to retrieve. If <i>pSource</i> is a pointer to a pin, this parameter is ignored.
     * @returns {IPin} Address of a pointer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the matching pin.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder2-findpin
     */
    FindPin(pSource, pindir, pCategory, pType, fUnconnected, num) {
        result := ComCall(11, this, "ptr", pSource, "int", pindir, "ptr", pCategory, "ptr", pType, "int", fUnconnected, "int", num, "ptr*", &ppPin := 0, "HRESULT")
        return IPin(ppPin)
    }
}
