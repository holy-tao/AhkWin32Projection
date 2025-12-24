#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaStream.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-iammediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMediaStream extends IMediaStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMMediaStream
     * @type {Guid}
     */
    static IID => Guid("{bebe595d-9a6f-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SetState", "JoinAMMultiMediaStream", "JoinFilter", "JoinFilterGraph"]

    /**
     * Note  This interface is deprecated. New applications should not use it. The Initialize method creates and initializes a new media stream with the specified stream type and purpose ID.
     * @param {IUnknown} pSourceObject Pointer to an <b>IUnknown</b> source object.
     * @param {Integer} dwFlags 
     * @param {Pointer<Guid>} PurposeId Purpose ID for the new media stream.
     * @param {Integer} StreamType <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mmstream/ne-mmstream-stream_type">STREAM_TYPE</a> enumeration value that specifies the new media stream's media type.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if one or more of the required parameters are invalid.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediastream-initialize
     */
    Initialize(pSourceObject, dwFlags, PurposeId, StreamType) {
        result := ComCall(9, this, "ptr", pSourceObject, "uint", dwFlags, "ptr", PurposeId, "int", StreamType, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The SetState method sets the filter state.
     * @param {Integer} State Sets the filter's state, as specified by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-filter_state">FILTER_STATE</a> enumerated type.
     * @returns {HRESULT} Returns S_OK if successful or E_INVALIDARG if the <i>State</i> parameter is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediastream-setstate
     */
    SetState(State) {
        result := ComCall(10, this, "int", State, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The IAMMultiMediaStream::AddMediaStream method calls this method, which adds the specified media stream to the current multimedia stream.
     * @param {IAMMultiMediaStream} pAMMultiMediaStream Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-iammultimediastream">IAMMultiMediaStream</a> object to add the current media stream to.
     * @returns {HRESULT} Returns S_OK if successful or MS_E_SAMPLEALLOC if the media stream already has allocated stream samples.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediastream-joinammultimediastream
     */
    JoinAMMultiMediaStream(pAMMultiMediaStream) {
        result := ComCall(11, this, "ptr", pAMMultiMediaStream, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The JoinFilter method connects a media stream to the Media Stream filter, which is used internally by the multimedia stream object. Applications should not call this method.
     * @param {IMediaStreamFilter} pMediaStreamFilter Pointer to the filter's <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nn-amstream-imediastreamfilter">IMediaStreamFilter</a> interface.
     * @returns {HRESULT} Returns S_OK if successful.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediastream-joinfilter
     */
    JoinFilter(pMediaStreamFilter) {
        result := ComCall(12, this, "ptr", pMediaStreamFilter, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. The JoinFilterGraph method connects a media stream filter to a filter graph.
     * @param {IFilterGraph} pFilterGraph Pointer to the current media stream filter to add to the specified filter graph.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if <i>pGraph</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//amstream/nf-amstream-iammediastream-joinfiltergraph
     */
    JoinFilterGraph(pFilterGraph) {
        result := ComCall(13, this, "ptr", pFilterGraph, "HRESULT")
        return result
    }
}
