#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMultiMediaStream.ahk
#Include .\IStreamSample.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//mmstream/nn-mmstream-imediastream
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
     * @returns {IMultiMediaStream} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-imultimediastream">IMultiMediaStream</a> interface object that will point to the multimedia stream from which the current media stream was created.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imediastream-getmultimediastream
     */
    GetMultiMediaStream() {
        result := ComCall(3, this, "ptr*", &ppMultiMediaStream := 0, "HRESULT")
        return IMultiMediaStream(ppMultiMediaStream)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Retrieves the stream's purpose ID and media type.
     * @param {Pointer<Guid>} pPurposeId Pointer to an <b>MSPID</b> value that will contain the stream's purpose ID (see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/multimedia-streaming-data-types">Multimedia Streaming Data Types</a>). If this parameter is <b>NULL</b> on entry, the method won't retrieve the purpose ID.
     * @param {Pointer<Integer>} pType Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mmstream/ne-mmstream-stream_type">STREAM_TYPE</a> enumerated data type value that will contain the stream's media type. If this parameter is <b>NULL</b> on entry, the method won't retrieve the media type.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if one of the parameters is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imediastream-getinformation
     */
    GetInformation(pPurposeId, pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pPurposeId, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Sets the media stream to the same format as a previous stream.
     * @param {IMediaStream} pStreamThatHasDesiredFormat Pointer to a media stream object that has the same format.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {HRESULT} Returns S_OK if successful or E_POINTER if one of the parameters is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imediastream-setsameformat
     */
    SetSameFormat(pStreamThatHasDesiredFormat, dwFlags) {
        result := ComCall(5, this, "ptr", pStreamThatHasDesiredFormat, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Allocates a new stream sample object for the current media stream.
     * @param {Integer} dwFlags Flags. Must be zero.
     * @returns {IStreamSample} Address of a pointer to the newly created stream sample's <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-istreamsample">IStreamSample</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imediastream-allocatesample
     */
    AllocateSample(dwFlags) {
        result := ComCall(6, this, "uint", dwFlags, "ptr*", &ppSample := 0, "HRESULT")
        return IStreamSample(ppSample)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Creates a new stream sample that shares the same backing object as the existing sample.
     * @param {IStreamSample} pExistingSample Pointer to the existing sample.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {IStreamSample} Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mmstream/nn-mmstream-istreamsample">IStreamSample</a> interface that will point to the newly created shared sample.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imediastream-createsharedsample
     */
    CreateSharedSample(pExistingSample, dwFlags) {
        result := ComCall(7, this, "ptr", pExistingSample, "uint", dwFlags, "ptr*", &ppNewSample := 0, "HRESULT")
        return IStreamSample(ppNewSample)
    }

    /**
     * Note  This interface is deprecated. New applications should not use it. Forces the current stream to end. If the current stream isn't writable, this method does nothing.
     * @param {Integer} dwFlags Reserved for flag data. Must be zero.
     * @returns {HRESULT} Returns S_OK if successful or MS_E_INCOMPATIBLE if the existing sample isn't compatible with the current media stream.
     * @see https://docs.microsoft.com/windows/win32/api//mmstream/nf-mmstream-imediastream-sendendofstream
     */
    SendEndOfStream(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
