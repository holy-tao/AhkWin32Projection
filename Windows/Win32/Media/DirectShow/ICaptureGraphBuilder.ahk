#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGraphBuilder.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated. (ICaptureGraphBuilder)
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-icapturegraphbuilder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ICaptureGraphBuilder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICaptureGraphBuilder
     * @type {Guid}
     */
    static IID => Guid("{bf87b6e0-8c27-11d0-b3f0-00aa003761c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFiltergraph", "GetFiltergraph", "SetOutputFileName", "FindInterface", "RenderStream", "ControlStream", "AllocCapFile", "CopyCaptureFile"]

    /**
     * Note  The ICaptureGraphBuilder interface is deprecated. Use ICaptureGraphBuilder2 instead. Tells the graph builder object which filter graph to use.
     * @remarks
     * The graph builder will automatically create a filter graph if you don't call this method. If you call this method after the graph builder has created its own filter graph, the call will fail.
     * @param {IGraphBuilder} pfg Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface that specifies the filter graph to use for subsequent calls to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltergraph-addfilter">IFilterGraph::AddFilter</a> method.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-setfiltergraph
     */
    SetFiltergraph(pfg) {
        result := ComCall(3, this, "ptr", pfg, "HRESULT")
        return result
    }

    /**
     * Note  The ICaptureGraphBuilder interface is deprecated. Use ICaptureGraphBuilder2 instead. Retrieves the filter graph that the builder is using.
     * @remarks
     * This method increments the reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface; be sure to decrement the reference count on <b>IGraphBuilder</b> by calling the <b>Release</b> method.
     * @returns {IGraphBuilder} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-getfiltergraph
     */
    GetFiltergraph() {
        result := ComCall(4, this, "ptr*", &ppfg := 0, "HRESULT")
        return IGraphBuilder(ppfg)
    }

    /**
     * Note  The ICaptureGraphBuilder interface is deprecated. Use ICaptureGraphBuilder2 instead. Creates the rendering section of the filter graph, which will save bits to disk with the specified file name.
     * @remarks
     * This method inserts the multiplexer and the file writer into the filter graph and calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifilesinkfilter-setfilename">IFileSinkFilter::SetFileName</a> to set the output file name.
     * 
     * You can use the <i>ppf</i> parameter returned by this method as the <i>pfRenderer</i> parameter in calls to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder-renderstream">RenderStream</a>.
     * 
     * You can use the <i>pSink</i> parameter from this method in a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifilesinkfilter-setfilename">SetFileName</a> to change the file name set by <c>ICaptureGraphBuilder::SetOutputFileName</c>.
     * @param {Pointer<Guid>} pType Pointer to a <b>GUID</b> representing the media subtype. Must be <c>&amp;MEDIASUBTYPE_Avi</c>.
     * @param {PWSTR} lpstrFile Pointer to a wide-character string containing the output file name.
     * @param {Pointer<IBaseFilter>} ppf Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface representing the multiplexer filter. This method increments the reference count on the <b>IBaseFilter</b> interface so you must decrement the reference count by using the <b>Release</b> method on this parameter when done using the filter.
     * @param {Pointer<IFileSinkFilter>} ppSink Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifilesinkfilter">IFileSinkFilter</a> interface representing the file writer. This method increments the reference count on the IFileSinkFilter interface so you must decrement the reference count using <b>Release</b> when done using the filter.
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
     * Invalid argument. Audio-Video Interleaved (AVI) is the only supported output format.
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
     * Out of memory.
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
     * Unexpected error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NOERROR</b></dt>
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Instance of the AVI multiplexer filter was successfully created.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-setoutputfilename
     */
    SetOutputFileName(pType, lpstrFile, ppf, ppSink) {
        lpstrFile := lpstrFile is String ? StrPtr(lpstrFile) : lpstrFile

        result := ComCall(5, this, "ptr", pType, "ptr", lpstrFile, "ptr*", ppf, "ptr*", ppSink, "HRESULT")
        return result
    }

    /**
     * Note  The ICaptureGraphBuilder interface is deprecated. Use ICaptureGraphBuilder2 instead. Looks for the specified interface on the filter, upstream and downstream from the filter, and, optionally, only on the output pin of the given category.
     * @remarks
     * This method looks for the interface on the filter, and upstream and downstream of the filter, unless a category is given. If a category is given, it only looks downstream of the output pin of that category. It can be used to find interfaces on renderers, multiplexers, TV tuners, crossbars, and so forth.
     * 
     * If <i>pCategory</i> equals &amp;LOOK_UPSTREAM_ONLY, then the graph builder will look upstream of the filter given in parameter <i>pf</i>, but not on the filter itself, nor downstream of the filter.
     * 
     * If <i>pCategory</i> equals &amp;LOOK_DOWNSTREAM_ONLY, then the graph builder will look downstream of the filter given in parameter <i>pf</i>, but not on the filter itself, nor upstream of the filter.
     * @param {Pointer<Guid>} pCategory Pointer to a GUID specifying the output pin category. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a> for a list of all pin categories. <b>NULL</b> indicates search all the output pins regardless of category.
     * @param {IBaseFilter} pf Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface of the filter.
     * @param {Pointer<Guid>} riid Reference ID of the desired interface.
     * @returns {Pointer<Void>} Address of a void pointer. If the interface was found, this method initializes <i>ppint</i> so that it contains the address of a pointer to the found interface. Call the <b>Release</b> method to decrement the reference count when you're done with the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-findinterface
     */
    FindInterface(pCategory, pf, riid) {
        result := ComCall(6, this, "ptr", pCategory, "ptr", pf, "ptr", riid, "ptr*", &ppint := 0, "HRESULT")
        return ppint
    }

    /**
     * Note  The ICaptureGraphBuilder interface is deprecated. Use ICaptureGraphBuilder2 instead. Connects a source filter's pin, of an optionally specified category, to the rendering filter, and optionally through another filter.
     * @remarks
     * If you specify a non-<b>NULL</b><a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a> GUID for <i>pCategory</i> and a capture filter for <i>pSource</i>, this method instantiates and connects additional required upstream filters, such as TV tuners and crossbars. It then renders the capture pin of <i>pSource</i>.
     * 
     * If <i>pSource</i> is a pin, then specify <b>NULL</b> for <i>pCategory</i> and this method renders the stream from that pin.
     * 
     * If the source filter has only one output pin, specify <b>NULL</b> for <i>pCategory</i>.
     * 
     * <i>pSource</i>, <i>pfCompressor</i>, and <i>pfRenderer</i> filters given as parameters must be present in the graph before this method is called.
     * 
     * If you are building a capture graph that is using WDM capture filters, this method will build all necessary upstream filters as well as the downstream filters.
     * 
     * Some capture filters that work with new WDM VPE (Video Port Extension) video capture hardware have video port pins instead of preview pins meant for previewing. Video port pins do not connect directly to a video renderer, but instead to a special filter called the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a>. Your application does not need to worry about this. All you have to do is call <c>RenderStream</c> with PIN_CATEGORY_PREVIEW and the capture graph builder will correctly render the VIDEO PORT pin through an overlay mixer if that is what is necessary.
     * 
     * When you render a capture or preview pin of a video capture filter (using <c>RenderStream</code> with the PIN_CATEGORY_CAPTURE or PIN_CATEGORY_PREVIEW category) and the capture filter has a capture pin but no preview pin, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/smart-tee-filter">Smart Tee</a> filter will be used automatically to allow simultaneous capture and preview. For example, calling <code>RenderStream</code> with the PIN_CATEGORY_CAPTURE category will actually connect a Smart Tee filter to the capture pin of the filter, and then render the capture pin of the Smart Tee. If you then call <code>RenderStream</code> with the PIN_CATEGORY_PREVIEW category on the capture pin, it will actually render the preview pin of the Smart Tee. If calling <code>RenderStream</code> with PIN_CATEGORY_PREVIEW results in using the capture pin and a Smart Tee filter, <code>RenderStream</c> will return VFW_S_NOPREVIEWPIN to indicate this. Thus, if <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder-findinterface">FindInterface</a> fails to find a preview interface, you may need to call <b>FindInterface</b> with the PIN_CATEGORY_PREVIEW category and with the PIN_CATEGORY_CAPTURE category, because the preview interface can be found by looking downstream of the capture pin of the capture filter.
     * @param {Pointer<Guid>} pCategory Pointer to a GUID specifying which output pin of the source filter to connect. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a> for a list of all pin categories. <b>NULL</b> indicates render the only output pin, regardless of category.
     * @param {IUnknown} pSource Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> or an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface representing either the source filter or an output pin. Source filters are typically a file source filter, such as an AVI file source filter or a capture filter.
     * @param {IBaseFilter} pfCompressor Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface representing the optional compression filter.
     * @param {IBaseFilter} pfRenderer Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface representing the renderer. You can use the <i>ppf</i> (multiplexer) parameter from <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-icapturegraphbuilder-setoutputfilename">ICaptureGraphBuilder::SetOutputFileName</a> to supply this value.
     * @returns {HRESULT} Returns VFW_S_NOPREVIEWPIN if the capture filter has a capture pin but no preview pin, and you call <c>RenderStream</code> with the &amp;PIN_CATEGORY_PREVIEW category on the capture pin. In this case, <code>RenderStream</c> will render the preview pin of the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/smart-tee-filter">Smart Tee</a> filter. For more information, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-renderstream
     */
    RenderStream(pCategory, pSource, pfCompressor, pfRenderer) {
        result := ComCall(7, this, "ptr", pCategory, "ptr", pSource, "ptr", pfCompressor, "ptr", pfRenderer, "HRESULT")
        return result
    }

    /**
     * Note  The ICaptureGraphBuilder interface is deprecated. Use ICaptureGraphBuilder2 instead. Sends stream control messages to the pin of the specified category on one or more capture filters in a graph.
     * @remarks
     * Use this method for frame-accurate capture, or for individual control of capture and preview. For example, you could turn off writing of the captured image to disk if you only want to preview the captured image.
     * 
     * This method uses the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamstreamcontrol">IAMStreamControl</a> interface on the pins.
     * 
     * This method sends one notification for each filter found with a pin of the specified category.
     * @param {Pointer<Guid>} pCategory Pointer to a <b>GUID</b> specifying the output pin category. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a> for a list of all pin categories. This value cannot be <b>NULL</b>.
     * @param {IBaseFilter} pFilter Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface on the filter to control. Specifying <b>NULL</b> controls all capture filters in the graph. You will get one notification for each capture filter.
     * @param {Pointer<Integer>} pstart Pointer to the start time for capture. <b>NULL</b> means start now. <b>MAX_TIME</b> means cancel previous request, or take no action if there is no previous request.
     * @param {Pointer<Integer>} pstop Pointer to the stop time for capture. <b>NULL</b> means stop now. <b>MAX_TIME</b> means cancel previous request, or take no action if there is no previous request.
     * @param {Integer} wStartCookie Specifies a particular value to be sent when the start occurs.
     * @param {Integer} wStopCookie Specifies a particular value to be sent when the stop occurs.
     * @returns {HRESULT} Returns S_FALSE if the stop notification is sent before the last sample sent by the capture filter is rendered, otherwise returns S_OK.
     * 
     * If this method returns S_FALSE, the application might want to wait before stopping the filter graph to allow all samples to pass through the graph and be rendered. Otherwise, samples might be lost. 
     * 
     * 
     * 
     * If there are no pins matching the description you provide, or if stream control cannot be supported on all of the indicated pins, this function will return a failure code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-controlstream
     */
    ControlStream(pCategory, pFilter, pstart, pstop, wStartCookie, wStopCookie) {
        pstartMarshal := pstart is VarRef ? "int64*" : "ptr"
        pstopMarshal := pstop is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "ptr", pCategory, "ptr", pFilter, pstartMarshal, pstart, pstopMarshal, pstop, "ushort", wStartCookie, "ushort", wStopCookie, "HRESULT")
        return result
    }

    /**
     * Note  The ICaptureGraphBuilder interface is deprecated. Use ICaptureGraphBuilder2 instead. Preallocates a capture file to a specified size.
     * @remarks
     * The call will fail if the file is read-only. For best capture results, always capture to a defragmented, preallocated capture file that is larger than the size of the capture data.
     * @param {PWSTR} lpstr Pointer to a wide-character string containing the name of the file to create or resize.
     * @param {Integer} dwlSize Size, in bytes, of the file to be allocated.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-alloccapfile
     */
    AllocCapFile(lpstr, dwlSize) {
        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        result := ComCall(9, this, "ptr", lpstr, "uint", dwlSize, "HRESULT")
        return result
    }

    /**
     * Note  The ICaptureGraphBuilder interface is deprecated. Use ICaptureGraphBuilder2 instead. Copies the valid media data from the preallocated capture file.
     * @remarks
     * The new file will contain only valid data and therefore can be much shorter than the source file. Typically, you will always capture to the same huge preallocated file and use this method to copy the data you want to save from each capture to a new file.
     * 
     * If you specify <i>pCallback</i>, the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamcopycapturefileprogress-progress">Progress</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamcopycapturefileprogress">IAMCopyCaptureFileProgress</a> interface will be called periodically with an integer between 0 and 100 representing the percentage complete.
     * @param {PWSTR} lpwstrOld Pointer to a Unicode™ string containing the source file name.
     * @param {PWSTR} lpwstrNew Pointer to a Unicode string containing the destination file name. Valid data is copied to this file.
     * @param {Integer} fAllowEscAbort Value indicating whether pressing the ESC key will cancel the copy operation. <b>TRUE</b> indicates that it will; <b>FALSE</b> indicates that this method will ignore that keystroke.
     * @param {IAMCopyCaptureFileProgress} pCallback Optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamcopycapturefileprogress">IAMCopyCaptureFileProgress</a> show the progress (percentage complete) of the copy operation.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-icapturegraphbuilder-copycapturefile
     */
    CopyCaptureFile(lpwstrOld, lpwstrNew, fAllowEscAbort, pCallback) {
        lpwstrOld := lpwstrOld is String ? StrPtr(lpwstrOld) : lpwstrOld
        lpwstrNew := lpwstrNew is String ? StrPtr(lpwstrNew) : lpwstrNew

        result := ComCall(10, this, "ptr", lpwstrOld, "ptr", lpwstrNew, "int", fAllowEscAbort, "ptr", pCallback, "HRESULT")
        return result
    }
}
