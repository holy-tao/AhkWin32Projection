#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBaseFilter.ahk
#Include .\IFilterGraph.ahk

/**
 * This interface provides methods that enable an application to build a filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-igraphbuilder
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphbuilder-connect
     */
    Connect(ppinOut, ppinIn) {
        result := ComCall(11, this, "ptr", ppinOut, "ptr", ppinIn, "HRESULT")
        return result
    }

    /**
     * The Render method builds a filter graph that renders the data from a specified output pin.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphbuilder-render
     */
    Render(ppinOut) {
        result := ComCall(12, this, "ptr", ppinOut, "HRESULT")
        return result
    }

    /**
     * The RenderFile method builds a filter graph that renders the specified file.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphbuilder-renderfile
     */
    RenderFile(lpcwstrFile, lpcwstrPlayList) {
        lpcwstrFile := lpcwstrFile is String ? StrPtr(lpcwstrFile) : lpcwstrFile
        lpcwstrPlayList := lpcwstrPlayList is String ? StrPtr(lpcwstrPlayList) : lpcwstrPlayList

        result := ComCall(13, this, "ptr", lpcwstrFile, "ptr", lpcwstrPlayList, "HRESULT")
        return result
    }

    /**
     * The AddSourceFilter method adds a source filter for a specified file to the filter graph.
     * @param {PWSTR} lpcwstrFileName Specifies the name of the file to load.
     * @param {PWSTR} lpcwstrFilterName Specifies a name for the source filter.
     * @returns {IBaseFilter} Receives a pointer to the filter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ibasefilter">IBaseFilter</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphbuilder-addsourcefilter
     */
    AddSourceFilter(lpcwstrFileName, lpcwstrFilterName) {
        lpcwstrFileName := lpcwstrFileName is String ? StrPtr(lpcwstrFileName) : lpcwstrFileName
        lpcwstrFilterName := lpcwstrFilterName is String ? StrPtr(lpcwstrFilterName) : lpcwstrFilterName

        result := ComCall(14, this, "ptr", lpcwstrFileName, "ptr", lpcwstrFilterName, "ptr*", &ppFilter := 0, "HRESULT")
        return IBaseFilter(ppFilter)
    }

    /**
     * The SetLogFile method sets the file for logging actions taken when attempting to perform an operation.
     * @param {Pointer} hFile Handle to the log file.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphbuilder-setlogfile
     */
    SetLogFile(hFile) {
        result := ComCall(15, this, "ptr", hFile, "HRESULT")
        return result
    }

    /**
     * The Abort method requests the Filter Graph Manager to halt its current task as quickly as possible.
     * @returns {HRESULT} Returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphbuilder-abort
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-igraphbuilder-shouldoperationcontinue
     */
    ShouldOperationContinue() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
