#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMultiMediaStream.ahk
#Include .\IStreamSample.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is deprecated.
 * @see https://learn.microsoft.com/windows/win32/api//content/mmstream/nn-mmstream-imediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStream
     * @type {Guid}
     */
    static IID => Guid("{b502d1bd-9a57-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMultiMediaStream", "GetInformation", "SetSameFormat", "AllocateSample", "CreateSharedSample", "SendEndOfStream"]

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves a pointer to the multimedia stream that contains the specified media stream.
     * @remarks
     * This method increments the reference count of the retrieved object pointer.
     * @returns {IMultiMediaStream} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imultimediastream">IMultiMediaStream</a> interface object that will point to the multimedia stream from which the current media stream was created.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmstream/nf-mmstream-imediastream-getmultimediastream
     */
    GetMultiMediaStream() {
        result := ComCall(3, this, "ptr*", &ppMultiMediaStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMultiMediaStream(ppMultiMediaStream)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves the stream's purpose ID and media type.
     * @remarks
     * The value retrieved in the <i>pPurposeId</i> parameter will usually be either MSPID_PrimaryVideo, which identifies the primary video stream, or MSPID_PrimaryAudio, which identifies the primary audio stream; however, you can define other values if necessary.
     * @param {Pointer<Guid>} pPurposeId Pointer to an <b>MSPID</b> value that will contain the stream's purpose ID (see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/multimedia-streaming-data-types">Multimedia Streaming Data Types</a>). If this parameter is <b>NULL</b> on entry, the method won't retrieve the purpose ID.
     * @param {Pointer<Integer>} pType Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mmstream/ne-mmstream-stream_type">STREAM_TYPE</a> enumerated data type value that will contain the stream's media type. If this parameter is <b>NULL</b> on entry, the method won't retrieve the media type.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if one of the parameters is invalid.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmstream/nf-mmstream-imediastream-getinformation
     */
    GetInformation(pPurposeId, pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pPurposeId, pTypeMarshal, pType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Sets the media stream to the same format as a previous stream.
     * @param {IMediaStream} pStreamThatHasDesiredFormat Pointer to a media stream object that has the same format.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if one of the parameters is invalid.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmstream/nf-mmstream-imediastream-setsameformat
     */
    SetSameFormat(pStreamThatHasDesiredFormat, dwFlags) {
        result := ComCall(5, this, "ptr", pStreamThatHasDesiredFormat, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Allocates a new stream sample object for the current media stream.
     * @remarks
     * This method allocates the sample and its associated backing object or buffer. The backing object is either the DirectDraw surface for video or the <a href="https://docs.microsoft.com/windows/desktop/api/austream/nn-austream-iaudiodata">IAudioData</a> object for audio.
     * @param {Integer} dwFlags Flags. Must be zero.
     * @returns {IStreamSample} Address of a pointer to the newly created stream sample's <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-istreamsample">IStreamSample</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmstream/nf-mmstream-imediastream-allocatesample
     */
    AllocateSample(dwFlags) {
        result := ComCall(6, this, "uint", dwFlags, "ptr*", &ppSample := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStreamSample(ppSample)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Creates a new stream sample that shares the same backing object as the existing sample.
     * @remarks
     * This method calls <b>IUnknown::QueryInterface</b> on the existing sample to retrieve the media type-specific information, which it uses to create the shared sample.
     * @param {IStreamSample} pExistingSample Pointer to the existing sample.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {IStreamSample} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-istreamsample">IStreamSample</a> interface that will point to the newly created shared sample.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmstream/nf-mmstream-imediastream-createsharedsample
     */
    CreateSharedSample(pExistingSample, dwFlags) {
        result := ComCall(7, this, "ptr", pExistingSample, "uint", dwFlags, "ptr*", &ppNewSample := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStreamSample(ppNewSample)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Forces the current stream to end. If the current stream isn't writable, this method does nothing.
     * @remarks
     * Applications do not call this internal method.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {HRESULT} Returns S_OK if successful or MS_E_INCOMPATIBLE if the existing sample isn't compatible with the current media stream.
     * @see https://learn.microsoft.com/windows/win32/api//content/mmstream/nf-mmstream-imediastream-sendendofstream
     */
    SendEndOfStream(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
