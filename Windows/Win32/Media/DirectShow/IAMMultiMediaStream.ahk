#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IGraphBuilder.ahk
#Include .\IMediaStreamFilter.ahk
#Include .\IMediaStream.ahk
#Include .\IMultiMediaStream.ahk

/**
 * Note  This interface is deprecated. New applications should not use it. The IAMMultiMediaStream interface is supported by the multimedia stream object. It contains methods for creating the underlying filter graph that the object manages.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-iammultimediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMultiMediaStream extends IMultiMediaStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMMultiMediaStream
     * @type {Guid}
     */
    static IID => Guid("{bebe595c-9a6f-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetFilterGraph", "GetFilter", "AddMediaStream", "OpenFile", "OpenMoniker", "Render"]

    /**
     * Note  This interface is deprecated. New applications should not use it. The Initialize method initializes the multimedia stream object.
     * @param {Integer} StreamType Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mmstream/ne-mmstream-stream_type">STREAM_TYPE</a> enumeration, specifying whether the streams are read-only, write-only, or read/write.
     * @param {Integer} dwFlags 
     * @param {IGraphBuilder} pFilterGraph [optional] Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface, or <b>NULL</b>. If this parameter is non-<b>NULL</b>, it specifies a filter graph that the multimedia stream object will use. Otherwise, the multimedia stream object creates a new filter graph.
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammultimediastream-initialize
     */
    Initialize(StreamType, dwFlags, pFilterGraph) {
        result := ComCall(12, this, "int", StreamType, "uint", dwFlags, "ptr", pFilterGraph, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetFilterGraph method retrieves the Filter Graph Manager that is managed by the multimedia stream object.
     * @returns {IGraphBuilder} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface pointer. If there is no filter graph associated with the multimedia stream object, the returned pointer is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammultimediastream-getfiltergraph
     */
    GetFilterGraph() {
        result := ComCall(13, this, "ptr*", &ppGraphBuilder := 0, "HRESULT")
        return IGraphBuilder(ppGraphBuilder)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetFilter method retrieves the Media Stream filter, which is used internally by the multimedia stream object.
     * @returns {IMediaStreamFilter} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-imediastreamfilter">IMediaStreamFilter</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammultimediastream-getfilter
     */
    GetFilter() {
        result := ComCall(14, this, "ptr*", &ppFilter := 0, "HRESULT")
        return IMediaStreamFilter(ppFilter)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The AddMediaStream method adds a new media stream to the filter graph.
     * @param {IUnknown} pStreamObject Pointer to the <b>IUnknown</b> interface of an object that is used to create the new media stream. This parameter can be <b>NULL</b>. See Remarks for more information.
     * @param {Pointer<Guid>} PurposeId Pointer an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mspid">MSPID</a> the specifies the type of media stream to create. This parameter can be <b>NULL</b>.
     * @param {Integer} dwFlags Bitwise combination of zero or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AMMSF_ADDDEFAULTRENDERER</td>
     * <td>Add a default renderer (audio streams only).</td>
     * </tr>
     * <tr>
     * <td>AMMSF_CREATEPEER</td>
     * <td>Create a new stream based on the object specified in <i>pStreamObject</i>.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_NOSTALL</td>
     * <td>Create a stream that does not block waiting for <b>Update</b> calls.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_STOPIFNOSAMPLES</td>
     * <td>Create a stream that stops if there are not samples.</td>
     * </tr>
     * </table>
     * @returns {IMediaStream} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imediastream">IMediaStream</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammultimediastream-addmediastream
     */
    AddMediaStream(pStreamObject, PurposeId, dwFlags) {
        result := ComCall(15, this, "ptr", pStreamObject, "ptr", PurposeId, "uint", dwFlags, "ptr*", &ppNewStream := 0, "HRESULT")
        return IMediaStream(ppNewStream)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The OpenFile method opens and automatically creates a filter graph for the specified media file. If DirectShow doesn't support the file format, this method does nothing.
     * @param {PWSTR} pszFileName Pointer to the name of the file you want to open.
     * @param {Integer} dwFlags Value that modifies how the filter graph will render the specified file. This value is a combination of one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AMMSF_NOCLOCK</td>
     * <td>Run the stream with no clock.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_NORENDER</td>
     * <td>Open the file, but do not render any streams. This flag should always be accompanied with the AMMSF_RUN flag.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_RENDERALLSTREAMS</td>
     * <td>Render all streams, including those that do not have an existing media stream.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_RENDERTOEXISTING</td>
     * <td>Only render to existing streams.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_RUN</td>
     * <td>Set the stream into the run state.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwFlags</i> parameter is invalid.
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
     * This method tried to access an invalid pointer.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammultimediastream-openfile
     */
    OpenFile(pszFileName, dwFlags) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(16, this, "ptr", pszFileName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The OpenMoniker method opens a file or device moniker; you can read media data from this moniker if DirectShow supports the moniker.
     * @param {IBindCtx} pCtx Pointer to the bind context associated with the moniker.
     * @param {IMoniker} pMoniker Pointer to an <b>IMoniker</b> interface that specifies the moniker you want to open.
     * @param {Integer} dwFlags Value that modifies how the filter graph will render the specified file. This value is a combination of one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>AMMSF_NOCLOCK</td>
     * <td>Run the stream with no clock.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_NORENDER</td>
     * <td>Open the file, but do not render any streams. This flag should always be accompanied with the AMMSF_RUN flag.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_RENDERALLSTREAMS</td>
     * <td>Render all streams, including those that do not have an existing media stream.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_RENDERTOEXISTING</td>
     * <td>Only render to existing streams.</td>
     * </tr>
     * <tr>
     * <td>AMMSF_RUN</td>
     * <td>Set the stream into the run state.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns S_OK if successful or E_INVALIDARG if the <i>dwFlags</i> parameter is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammultimediastream-openmoniker
     */
    OpenMoniker(pCtx, pMoniker, dwFlags) {
        result := ComCall(17, this, "ptr", pCtx, "ptr", pMoniker, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The Render method renders the current filter graph.
     * @param {Integer} dwFlags Value that specifies how the filter graph renders the current multimedia stream. This value currently must be AMMSF_NOCLOCK.
     * @returns {HRESULT} Returns S_OK if successful or E_INVALIDARG if the <i>dwFlags</i> parameter is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammultimediastream-render
     */
    Render(dwFlags) {
        result := ComCall(18, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
