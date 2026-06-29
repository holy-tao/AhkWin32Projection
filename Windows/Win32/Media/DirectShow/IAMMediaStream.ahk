#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FILTER_STATE.ahk" { FILTER_STATE }
#Import ".\IFilterGraph.ahk" { IFilterGraph }
#Import ".\IAMMultiMediaStream.ahk" { IAMMultiMediaStream }
#Import ".\STREAM_TYPE.ahk" { STREAM_TYPE }
#Import ".\IMediaStreamFilter.ahk" { IMediaStreamFilter }
#Import ".\IMediaStream.ahk" { IMediaStream }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api/amstream/nn-amstream-iammediastream
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMMediaStream extends IMediaStream {
    /**
     * The interface identifier for IAMMediaStream
     * @type {Guid}
     */
    static IID := Guid("{bebe595d-9a6f-11d0-8fde-00c04fd9189d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMMediaStream interfaces
    */
    struct Vtbl extends IMediaStream.Vtbl {
        Initialize             : IntPtr
        SetState               : IntPtr
        JoinAMMultiMediaStream : IntPtr
        JoinFilter             : IntPtr
        JoinFilterGraph        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMMediaStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The Initialize method creates and initializes a new media stream with the specified stream type and purpose ID.
     * @remarks
     * If <i>dwFlags</i> specifies AMMSF_ADDDEFAULTRENDERER, then the default renderer for the given purpose ID is created, if possible. Currently, the only default renderer supported is for audio using DirectSound. In this case, the <i>pStreamObject</i> parameter must be <b>NULL</b> and any calls to the <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nf-mmstream-imultimediastream-getmediastream">IMultiMediaStream::GetMediaStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nf-mmstream-imultimediastream-enummediastreams">IMultiMediaStream::EnumMediaStreams</a> method will not recognize the stream.
     * 
     * If <i>dwFlags</i> specifies AMMSF_CREATEPEER, then a media stream is created using <i>pStreamObject</i> and added to the current multimedia stream. The <i>pStreamObject</i> parameter varies depending on the stream type. In general, <i>pStreamObject</i> can point to an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imediastream">IMediaStream</a> object, in which case a stream with the sample purpose ID and format is created. For <b>IDirectDraw</b> streams, it can also be a pointer to an <b>IDirectDraw</b> interface.
     * 
     * If <i>dwFlags</i> specifies AMMSF_STOPIFNOSAMPLES, then the stream is terminated.
     * 
     * If no flags are set, then <i>pStreamObject</i> can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>An <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-iammediastream">IAMMediaStream</a> object</td>
     * <td>This stream is then added to the streams in the multimedia stream.</td>
     * </tr>
     * <tr>
     * <td><b>NULL</b></td>
     * <td>In this case a default <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imediastream">IMediaStream</a> object is added to the stream with a default underlying object, if required.</td>
     * </tr>
     * <tr>
     * <td>A pointer to an underlying object</td>
     * <td>This is used to construct default streams. For video streams, this can be an <b>IDirectDraw</b> pointer.</td>
     * </tr>
     * </table>
     * @param {IUnknown} pSourceObject Pointer to an <b>IUnknown</b> source object.
     * @param {Integer} dwFlags 
     * @param {Pointer<Guid>} PurposeId Purpose ID for the new media stream.
     * @param {STREAM_TYPE} StreamType <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mmstream/ne-mmstream-stream_type">STREAM_TYPE</a> enumeration value that specifies the new media stream's media type.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if one or more of the required parameters are invalid.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediastream-initialize
     */
    Initialize(pSourceObject, dwFlags, PurposeId, StreamType) {
        result := ComCall(9, this, "ptr", pSourceObject, "uint", dwFlags, Guid.Ptr, PurposeId, STREAM_TYPE, StreamType, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetState method sets the filter state.
     * @remarks
     * Applications should not call this method.
     * @param {FILTER_STATE} State Sets the filter's state, as specified by the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-filter_state">FILTER_STATE</a> enumerated type.
     * @returns {HRESULT} Returns S_OK if successful or E_INVALIDARG if the <i>State</i> parameter is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediastream-setstate
     */
    SetState(State) {
        result := ComCall(10, this, FILTER_STATE, State, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The IAMMultiMediaStream::AddMediaStream method calls this method, which adds the specified media stream to the current multimedia stream.
     * @remarks
     * Don't increment the reference count of the supplied multimedia stream because it is already accounted for when created.
     * 
     * Applications should not call this method.
     * @param {IAMMultiMediaStream} pAMMultiMediaStream Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-iammultimediastream">IAMMultiMediaStream</a> object to add the current media stream to.
     * @returns {HRESULT} Returns S_OK if successful or MS_E_SAMPLEALLOC if the media stream already has allocated stream samples.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediastream-joinammultimediastream
     */
    JoinAMMultiMediaStream(pAMMultiMediaStream) {
        result := ComCall(11, this, "ptr", pAMMultiMediaStream, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The JoinFilter method connects a media stream to the Media Stream filter, which is used internally by the multimedia stream object. Applications should not call this method.
     * @param {IMediaStreamFilter} pMediaStreamFilter Pointer to the filter's <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-imediastreamfilter">IMediaStreamFilter</a> interface.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediastream-joinfilter
     */
    JoinFilter(pMediaStreamFilter) {
        result := ComCall(12, this, "ptr", pMediaStreamFilter, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The JoinFilterGraph method connects a media stream filter to a filter graph.
     * @remarks
     * Don't increment the reference count of the specified filter graph.
     * 
     * Applications should not call this method.
     * @param {IFilterGraph} pFilterGraph Pointer to the current media stream filter to add to the specified filter graph.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if <i>pGraph</i> is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/amstream/nf-amstream-iammediastream-joinfiltergraph
     */
    JoinFilterGraph(pFilterGraph) {
        result := ComCall(13, this, "ptr", pFilterGraph, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMMediaStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 5)
        this.vtbl.SetState := CallbackCreate(GetMethod(implObj, "SetState"), flags, 2)
        this.vtbl.JoinAMMultiMediaStream := CallbackCreate(GetMethod(implObj, "JoinAMMultiMediaStream"), flags, 2)
        this.vtbl.JoinFilter := CallbackCreate(GetMethod(implObj, "JoinFilter"), flags, 2)
        this.vtbl.JoinFilterGraph := CallbackCreate(GetMethod(implObj, "JoinFilterGraph"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.SetState)
        CallbackFree(this.vtbl.JoinAMMultiMediaStream)
        CallbackFree(this.vtbl.JoinFilter)
        CallbackFree(this.vtbl.JoinFilterGraph)
    }
}
