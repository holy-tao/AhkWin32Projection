#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import ".\STREAM_TYPE.ahk" { STREAM_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import ".\IMediaStreamFilter.ahk" { IMediaStreamFilter }
#Import ".\IMediaStream.ahk" { IMediaStream }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IGraphBuilder.ahk" { IGraphBuilder }
#Import ".\IMultiMediaStream.ahk" { IMultiMediaStream }

/**
 * Note  This interface is deprecated. New applications should not use it. The IAMMultiMediaStream interface is supported by the multimedia stream object. It contains methods for creating the underlying filter graph that the object manages.
 * @see https://learn.microsoft.com/windows/win32/api/amstream/nn-amstream-iammultimediastream
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMMultiMediaStream extends IMultiMediaStream {
    /**
     * The interface identifier for IAMMultiMediaStream
     * @type {Guid}
     */
    static IID := Guid("{bebe595c-9a6f-11d0-8fde-00c04fd9189d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMMultiMediaStream interfaces
    */
    struct Vtbl extends IMultiMediaStream.Vtbl {
        Initialize     : IntPtr
        GetFilterGraph : IntPtr
        GetFilter      : IntPtr
        AddMediaStream : IntPtr
        OpenFile       : IntPtr
        OpenMoniker    : IntPtr
        Render         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMMultiMediaStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The Initialize method initializes the multimedia stream object.
     * @remarks
     * If you specify AMMSF_NOGRAPHTHREAD in the <i>dwFlags</i> parameter, the calling thread must process window messages, and it must release all multimedia streaming objects before the thread exits. Otherwise, the application might deadlock.
     * @param {STREAM_TYPE} StreamType Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mmstream/ne-mmstream-stream_type">STREAM_TYPE</a> enumeration, specifying whether the streams are read-only, write-only, or read/write.
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
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-initialize
     */
    Initialize(StreamType, dwFlags, pFilterGraph) {
        result := ComCall(12, this, STREAM_TYPE, StreamType, "uint", dwFlags, "ptr", pFilterGraph, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetFilterGraph method retrieves the Filter Graph Manager that is managed by the multimedia stream object.
     * @remarks
     * If the method succeeds and *<i>ppGraphBuilder</i> is non-<b>NULL</b>, the caller must release the <b>IGraphBuilder</b> pointer.
     * @returns {IGraphBuilder} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-igraphbuilder">IGraphBuilder</a> interface pointer. If there is no filter graph associated with the multimedia stream object, the returned pointer is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-getfiltergraph
     */
    GetFilterGraph() {
        result := ComCall(13, this, "ptr*", &ppGraphBuilder := 0, "HRESULT")
        return IGraphBuilder(ppGraphBuilder)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The GetFilter method retrieves the Media Stream filter, which is used internally by the multimedia stream object.
     * @remarks
     * Applications should not call this method. The <b>IMediaStreamFilter</b> interface is not intended for applications to use.
     * 
     * If the method succeeds, the caller must release the <b>IMediaStreamFilter</b> interface.
     * @returns {IMediaStreamFilter} Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-imediastreamfilter">IMediaStreamFilter</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-getfilter
     */
    GetFilter() {
        result := ComCall(14, this, "ptr*", &ppFilter := 0, "HRESULT")
        return IMediaStreamFilter(ppFilter)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The AddMediaStream method adds a new media stream to the filter graph.
     * @remarks
     * If <i>pPurposeID</i> is <b>NULL</b>, <i>pStreamObject</i> must specify an <b>IMediaStream</b> object. The object's <b>GetInformation</b> method is used to determine the purpose ID, which is then used to create the new media stream.
     * 
     * If the purpose ID is MSPID_PrimaryAudio and <i>dwFlags</i> includes the AMMSF_ADDDEFAULTRENDERER flag, the method adds the DirectSound Renderer to the filter graph.
     * 
     * If <i>dwFlags</i> includes the AMMSF_CREATEPEER flag, the method uses the object specified by <i>pStreamObject</i> to create a new media stream. In that case, <i>pStreamObject</i> can specify any of the following:
     * 
     * <ul>
     * <li>An <b>IAMMediaStream</b> pointer.</li>
     * <li>An <b>IMediaStream</b> pointer.</li>
     * <li>An <b>IDirectDraw</b> pointer.</li>
     * </ul>
     * If neither flag is set, <i>pStreamObject</i> can be any of the following:
     * 
     * <ul>
     * <li>An <b>IAMMediaStream</b> pointer. The object is added to the multimedia stream.</li>
     * <li>An <b>IDirectDraw</b> pointer. The DirectDraw object is used to create a default video stream.</li>
     * <li><b>NULL</b>. A default media stream object is created.</li>
     * </ul>
     * If the method succeeds, the caller must release the returned <b>IMediaStream</b> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-addmediastream
     */
    AddMediaStream(pStreamObject, PurposeId, dwFlags) {
        result := ComCall(15, this, "ptr", pStreamObject, Guid.Ptr, PurposeId, "uint", dwFlags, "ptr*", &ppNewStream := 0, "HRESULT")
        return IMediaStream(ppNewStream)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The OpenFile method opens and automatically creates a filter graph for the specified media file. If DirectShow doesn't support the file format, this method does nothing.
     * @remarks
     * The AMMSF_RENDERALLSTREAMS flag will create default rendering filters for video and audio if they do not exist. However, these default filters cannot be accessed by the <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nf-mmstream-istreamsample-getmediastream">IStreamSample::GetMediaStream</a> method.
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
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-openfile
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
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-openmoniker
     */
    OpenMoniker(pCtx, pMoniker, dwFlags) {
        result := ComCall(17, this, "ptr", pCtx, "ptr", pMoniker, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The Render method renders the current filter graph.
     * @remarks
     * This method renders each of the source streams for a stream of type STREAMTYPE_WRITE. This can be called several times, for instance, each time a source stream is added, the stream is not set into running mode. Use the <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nf-mmstream-imultimediastream-setstate">IMultiMediaStream::SetState</a> method to set the stream into running mode after calling this method.
     * 
     * The AMMSF_RENDERALLSTREAMS flag will create default rendering streams for video and audio if they do not exist.
     * @param {Integer} dwFlags Value that specifies how the filter graph renders the current multimedia stream. This value currently must be AMMSF_NOCLOCK.
     * @returns {HRESULT} Returns S_OK if successful or E_INVALIDARG if the <i>dwFlags</i> parameter is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammultimediastream-render
     */
    Render(dwFlags) {
        result := ComCall(18, this, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMMultiMediaStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.GetFilterGraph := CallbackCreate(GetMethod(implObj, "GetFilterGraph"), flags, 2)
        this.vtbl.GetFilter := CallbackCreate(GetMethod(implObj, "GetFilter"), flags, 2)
        this.vtbl.AddMediaStream := CallbackCreate(GetMethod(implObj, "AddMediaStream"), flags, 5)
        this.vtbl.OpenFile := CallbackCreate(GetMethod(implObj, "OpenFile"), flags, 3)
        this.vtbl.OpenMoniker := CallbackCreate(GetMethod(implObj, "OpenMoniker"), flags, 4)
        this.vtbl.Render := CallbackCreate(GetMethod(implObj, "Render"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetFilterGraph)
        CallbackFree(this.vtbl.GetFilter)
        CallbackFree(this.vtbl.AddMediaStream)
        CallbackFree(this.vtbl.OpenFile)
        CallbackFree(this.vtbl.OpenMoniker)
        CallbackFree(this.vtbl.Render)
    }
}
