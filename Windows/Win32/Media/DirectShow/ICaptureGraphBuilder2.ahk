#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGraphBuilder.ahk
#Include .\IPin.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICaptureGraphBuilder2 interface builds capture graphs and other custom filter graphs.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-icapturegraphbuilder2
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icapturegraphbuilder2-setfiltergraph
     */
    SetFiltergraph(pfg) {
        result := ComCall(3, this, "ptr", pfg, "HRESULT")
        return result
    }

    /**
     * The GetFiltergraph method retrieves the filter graph that the capture graph builder is using.
     * @returns {IGraphBuilder} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icapturegraphbuilder2-getfiltergraph
     */
    GetFiltergraph() {
        result := ComCall(4, this, "ptr*", &ppfg := 0, "HRESULT")
        return IGraphBuilder(ppfg)
    }

    /**
     * The SetOutputFileName method creates the file writing section of the filter graph.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icapturegraphbuilder2-setoutputfilename
     */
    SetOutputFileName(pType, lpstrFile, ppf, ppSink) {
        lpstrFile := lpstrFile is String ? StrPtr(lpstrFile) : lpstrFile

        result := ComCall(5, this, "ptr", pType, "ptr", lpstrFile, "ptr*", ppf, "ptr*", ppSink, "HRESULT")
        return result
    }

    /**
     * The FindInterface method searches the graph for a specified interface, starting from a specified filter.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icapturegraphbuilder2-findinterface
     */
    FindInterface(pCategory, pType, pf, riid) {
        result := ComCall(6, this, "ptr", pCategory, "ptr", pType, "ptr", pf, "ptr", riid, "ptr*", &ppint := 0, "HRESULT")
        return ppint
    }

    /**
     * The RenderStream method connects an output pin on a source filter to a sink filter, optionally through an intermediate filter.
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
     * Preview was rendered through the <a href="/windows/desktop/DirectShow/smart-tee-filter">Smart Tee Filter</a>.
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
     * A filter is not in the filter graph. This error can occur if you did not call <b>AddFilter</b> to add <i>pSource</i>, <i>pIntermediate</i>, or <i>pSink</i> to the graph. It can also occur if you did not call <b>SetFiltergraph</b> to connect your graph to the Capture Graph Builder; in this case, the Capture Graph Builder object automatically creates its own filter graph. See <a href="/windows/desktop/DirectShow/about-the-capture-graph-builder">About the Capture Graph Builder</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icapturegraphbuilder2-renderstream
     */
    RenderStream(pCategory, pType, pSource, pfCompressor, pfRenderer) {
        result := ComCall(7, this, "ptr", pCategory, "ptr", pType, "ptr", pSource, "ptr", pfCompressor, "ptr", pfRenderer, "HRESULT")
        return result
    }

    /**
     * The ControlStream method sets the start and stop times for one or more streams of captured data.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icapturegraphbuilder2-controlstream
     */
    ControlStream(pCategory, pType, pFilter, pstart, pstop, wStartCookie, wStopCookie) {
        pstartMarshal := pstart is VarRef ? "int64*" : "ptr"
        pstopMarshal := pstop is VarRef ? "int64*" : "ptr"

        result := ComCall(8, this, "ptr", pCategory, "ptr", pType, "ptr", pFilter, pstartMarshal, pstart, pstopMarshal, pstop, "ushort", wStartCookie, "ushort", wStopCookie, "HRESULT")
        return result
    }

    /**
     * The AllocCapFile method preallocates a capture file to a specified size. For best results, always capture to a defragmented, preallocated capture file that is larger than the size of the capture data.
     * @param {PWSTR} lpstr Pointer to a wide-character string that contains the name of the file to create or resize.
     * @param {Integer} dwlSize Size of the file to allocate, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icapturegraphbuilder2-alloccapfile
     */
    AllocCapFile(lpstr, dwlSize) {
        lpstr := lpstr is String ? StrPtr(lpstr) : lpstr

        result := ComCall(9, this, "ptr", lpstr, "uint", dwlSize, "HRESULT")
        return result
    }

    /**
     * The CopyCaptureFile method copies the valid media data from a capture file.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icapturegraphbuilder2-copycapturefile
     */
    CopyCaptureFile(lpwstrOld, lpwstrNew, fAllowEscAbort, pCallback) {
        lpwstrOld := lpwstrOld is String ? StrPtr(lpwstrOld) : lpwstrOld
        lpwstrNew := lpwstrNew is String ? StrPtr(lpwstrNew) : lpwstrNew

        result := ComCall(10, this, "ptr", lpwstrOld, "ptr", lpwstrNew, "int", fAllowEscAbort, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * The FindPin method retrieves a particular pin on a filter, or determines whether a given pin matches the specified criteria.
     * @param {IUnknown} pSource Pointer to an interface on a filter, or to an interface on a pin.
     * @param {Integer} pindir Member of the [PIN_DIRECTION](/windows/desktop/api/strmif/ne-strmif-pin_direction) enumeration that specifies the pin direction (input or output).
     * @param {Pointer<Guid>} pCategory A pointer to a GUID that specifies one of the pin categories listed in <a href="https://docs.microsoft.com/windows/desktop/DirectShow/pin-property-set">Pin Property Set</a>. To match any pin, regardless of category, set this parameter to <b>NULL</b>.
     * @param {Pointer<Guid>} pType Pointer to a major type GUID that specifies the media type. Use <b>NULL</b> to match any media type.
     * @param {BOOL} fUnconnected Boolean value that specifies whether the pin must be unconnected. If <b>TRUE</b>, the pin must be unconnected. If <b>FALSE</b>, the pin can be connected or unconnected.
     * @param {Integer} num Zero-based index of the pin to retrieve, from the set of matching pins. If <i>pSource</i> is a pointer to a filter, and more than one pin matches the search criteria, this parameter specifies which pin to retrieve. If <i>pSource</i> is a pointer to a pin, this parameter is ignored.
     * @returns {IPin} Address of a pointer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the matching pin.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-icapturegraphbuilder2-findpin
     */
    FindPin(pSource, pindir, pCategory, pType, fUnconnected, num) {
        result := ComCall(11, this, "ptr", pSource, "int", pindir, "ptr", pCategory, "ptr", pType, "int", fUnconnected, "int", num, "ptr*", &ppPin := 0, "HRESULT")
        return IPin(ppPin)
    }
}
