#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBaseFilter.ahk
#Include .\IFilterGraph.ahk

/**
 * This interface provides methods that enable an application to build a filter graph.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-igraphbuilder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IGraphBuilder extends IFilterGraph{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphBuilder
     * @type {Guid}
     */
    static IID => Guid("{56a868a9-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Render", "RenderFile", "AddSourceFilter", "SetLogFile", "Abort", "ShouldOperationContinue"]

    /**
     * The Connect method connects the two pins, using intermediates if necessary.
     * @remarks
     * This method connects two pins directly or indirectly, adding intermediate filters if necessary. The method starts by attempting a direct connection. If that fails, it tries to use any filters that are already in the filter graph and have unconnected input pins. (It enumerates these in an arbitrary order.) If that fails, it searches for filters in the registry, and tries them in order of merit. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/intelligent-connect">Intelligent Connect</a>.
     * 
     * During the connection process, the Filter Graph Manager ignores pins on intermediate filters if the pin name begins with a tilde (~). For more information, see [PIN_INFO](/windows/desktop/api/strmif/ns-strmif-pin_info).
     * @param {IPin} ppinOut Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface on the output pin.
     * @param {IPin} ppinIn Pointer to the <b>IPin</b> interface on the input pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
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
     * <dt><b>VFW_S_PARTIAL_RENDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial success; some of the streams from this pin use an unsupported format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operation aborted.
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
     * <dt><b>VFW_E_CANNOT_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No combination of intermediate filters could be found to make the connection.
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
     * At least one of the filters is not in the filter graph.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-connect
     */
    Connect(ppinOut, ppinIn) {
        result := ComCall(11, this, "ptr", ppinOut, "ptr", ppinIn, "HRESULT")
        return result
    }

    /**
     * The Render method builds a filter graph that renders the data from a specified output pin.
     * @remarks
     * This method renders the data from a specified output pin, adding new filters to the graph as needed. Filters are tried in the same order as for the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-connect">IGraphBuilder::Connect</a> method. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/intelligent-connect">Intelligent Connect</a>.
     * 
     * During the connection process, the Filter Graph Manager ignores pins on intermediate filters if the pin name begins with a tilde (~). For more information, see [PIN_INFO](/windows/desktop/api/strmif/ns-strmif-pin_info).
     * @param {IPin} ppinOut Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface on an output pin.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
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
     * <dt><b>VFW_S_AUDIO_NOT_RENDERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial success; the audio was not rendered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_DUPLICATE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success; the Filter Graph Manager modified a filter name to avoid duplication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_PARTIAL_RENDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial success; some of the streams in this movie are in an unsupported format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_VIDEO_NOT_RENDERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial success; the video was not rendered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operation aborted.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CANNOT_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No combination of intermediate filters could be found to make the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CANNOT_RENDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No combination of filters could be found to render the stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NO_ACCEPTABLE_TYPES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no common media type between these pins.
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
     * The filter to which this pin belongs is not in the filter graph.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-render
     */
    Render(ppinOut) {
        result := ComCall(12, this, "ptr", ppinOut, "HRESULT")
        return result
    }

    /**
     * The RenderFile method builds a filter graph that renders the specified file. (IGraphBuilder.RenderFile)
     * @remarks
     * If the <i>lpwstrFile</i> parameter specifies a media file, the method builds a filter graph for default playback. First it adds a source filter that can read the file, using the same process as the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-addsourcefilter">IGraphBuilder::AddSourceFilter</a> method. Then it renders the output pins on the source filter, adding intermediate filters if necessary. It tries filters in the same order as the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-connect">IGraphBuilder::Connect</a> method.
     * 
     * During the connection process, the Filter Graph Manager ignores pins on intermediate filters if the pin name begins with a tilde (~). For more information, see [PIN_INFO](/windows/desktop/api/strmif/ns-strmif-pin_info).
     * 
     * Note that the <c>RenderFile</code> method does not remove any filters from the graph. If you call <code>RenderFile</c> twice, the second call simply adds more filters to the graph. When you run the graph, both sources will play at the same time.
     * @param {PWSTR} lpcwstrFile Specifies a wide-character string that contains the name of a media file.
     * @param {PWSTR} lpcwstrPlayList Reserved. Must be <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
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
     * <dt><b>VFW_S_AUDIO_NOT_RENDERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial success; the audio was not rendered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_DUPLICATE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success; the Filter Graph Manager modified the filter name to avoid duplication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_PARTIAL_RENDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some of the streams in this movie are in an unsupported format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_VIDEO_NOT_RENDERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Partial success; some of the streams in this movie are in an unsupported format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Operation aborted.
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
     * Argument is invalid.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CANNOT_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No combination of intermediate filters could be found to make the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CANNOT_LOAD_SOURCE_FILTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source filter for this file could not be loaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_CANNOT_RENDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No combination of filters could be found to render the stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_INVALID_FILE_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file format is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An object or name was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_UNKNOWN_FILE_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media type of this file is not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_UNSUPPORTED_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot play back the file: the format is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-renderfile
     */
    RenderFile(lpcwstrFile, lpcwstrPlayList) {
        lpcwstrFile := lpcwstrFile is String ? StrPtr(lpcwstrFile) : lpcwstrFile
        lpcwstrPlayList := lpcwstrPlayList is String ? StrPtr(lpcwstrPlayList) : lpcwstrPlayList

        result := ComCall(13, this, "ptr", lpcwstrFile, "ptr", lpcwstrPlayList, "HRESULT")
        return result
    }

    /**
     * The AddSourceFilter method adds a source filter for a specified file to the filter graph.
     * @remarks
     * This method searches for an installed filter that can read the specified file. If it finds one, the method adds it to the filter graph and returns a pointer to the filter's <b>IBaseFilter</b> interface. To determine the media type and compression scheme of the file, the Filter Graph Manager reads the first few bytes of the file, looking for specific patterns of bytes, as documented in the article <a href="https://docs.microsoft.com/windows/desktop/DirectShow/registering-a-custom-file-type">Registering a Custom File Type</a>.
     * 
     * The application is responsible for building the rest of the filter graph. To do so, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ibasefilter-enumpins">IBaseFilter::EnumPins</a> to enumerate the output pins on the source filter. Then use either the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-connect">IGraphBuilder::Connect</a> method or the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-render">IGraphBuilder::Render</a> method.
     * 
     * If the method succeeds, the <b>IBaseFilter</b> interface has an outstanding reference count. The caller must release the interface.
     * 
     * To render a file for default playback, use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-igraphbuilder-renderfile">IGraphBuilder::RenderFile</a> method.
     * 
     * The Filter Graph Manager holds a reference count on the filter until the filter is removed from the graph or the Filter Graph Manager is released.
     * @param {PWSTR} lpcwstrFileName Specifies the name of the file to load.
     * @param {PWSTR} lpcwstrFilterName Specifies a name for the source filter.
     * @returns {IBaseFilter} Receives a pointer to the filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-addsourcefilter
     */
    AddSourceFilter(lpcwstrFileName, lpcwstrFilterName) {
        lpcwstrFileName := lpcwstrFileName is String ? StrPtr(lpcwstrFileName) : lpcwstrFileName
        lpcwstrFilterName := lpcwstrFilterName is String ? StrPtr(lpcwstrFilterName) : lpcwstrFilterName

        result := ComCall(14, this, "ptr", lpcwstrFileName, "ptr", lpcwstrFilterName, "ptr*", &ppFilter := 0, "HRESULT")
        return IBaseFilter(ppFilter)
    }

    /**
     * The SetLogFile method sets the file for logging actions taken when attempting to perform an operation.
     * @remarks
     * This method is for use in debugging; it is intended to help you determine the cause of any failure to automatically build a filter graph.
     * 
     * The <i>hFile</i> parameter must be an open file handle. Your application is responsible for opening the file and for closing it when you are done logging. Before closing the file handle, call <c>SetLogFile</c> with a <b>NULL</b> file handle. This will ensure that the component does not attempt to use the file handle after you have closed it.
     * @param {Pointer} hFile Handle to the log file.
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-setlogfile
     */
    SetLogFile(hFile) {
        result := ComCall(15, this, "ptr", hFile, "HRESULT")
        return result
    }

    /**
     * The Abort method requests the Filter Graph Manager to halt its current task as quickly as possible.
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-abort
     */
    Abort() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The ShouldOperationContinue method queries whether the current operation should continue.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
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
     * The current operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current operation should not continue.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-igraphbuilder-shouldoperationcontinue
     */
    ShouldOperationContinue() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
