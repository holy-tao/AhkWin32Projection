#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MF_TRANSCODE_SINK_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the transcode sink activation object.
 * @remarks
 * To use this interface, perform the following steps:
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatetranscodesinkactivate">MFCreateTranscodeSinkActivate</a> to create the transcode sink activation object.</li>
 * <li>Query the activation object for the <b>IMFTranscodeSinkInfoProvider</b> interface.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatetranscodeprofile">MFCreateTranscodeProfile</a> to create a transcode profile.</li>
 * <li>Set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a> attribute on the transcode profile. The attribute must have one of the following values:<ul>
 * <li><b>MFTranscodeContainerType_3GP</b></li>
 * <li><b>MFTranscodeContainerType_MP3</b></li>
 * <li><b>MFTranscodeContainerType_MPEG4</b></li>
 * </ul>
 * </li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodeprofile-setvideoattributes">IMFTranscodeProfile::SetVideoAttributes</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodeprofile-setaudioattributes">IMFTranscodeProfile::SetAudioAttributes</a> to specify the video and audio formats.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setprofile">IMFTranscodeSinkInfoProvider::SetProfile</a> to set the transcode profile.</li>
 * <li>Call one of the following methods (but not both) to specify the output file:<ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setoutputbytestream">IMFTranscodeSinkInfoProvider::SetOutputByteStream</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setoutputfile">IMFTranscodeSinkInfoProvider::SetOutputFile</a>
 * </li>
 * </ul>
 * </li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> on the activation object to create the media sink.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imftranscodesinkinfoprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTranscodeSinkInfoProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTranscodeSinkInfoProvider
     * @type {Guid}
     */
    static IID => Guid("{8cffcd2e-5a03-4a3a-aff7-edcd107c620e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutputFile", "SetOutputByteStream", "SetProfile", "GetSinkInfo"]

    /**
     * Sets the name of the encoded output file.
     * @remarks
     * The media sink will create a local file with the specified file name.
     * 
     * Alternately, you can call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setoutputbytestream">IMFTranscodeSinkInfoProvider::SetOutputByteStream</a> to specify a byte stream  that will receive the transcoded data. These two methods are mutually exclusive.
     * @param {PWSTR} pwszFileName Pointer to a null-terminated string that contains the name of the output file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setoutputfile
     */
    SetOutputFile(pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, "ptr", pwszFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets an output byte stream for the transcode media sink.
     * @remarks
     * Call this method to provide a writable byte stream 
     *         that will receive the transcoded data.
     * 
     * Alternatively, you can provide the name of an  output file, by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setoutputfile">IMFTranscodeSinkInfoProvider::SetOutputFile</a>. These two methods are mutually exclusive.
     * 
     * The <i>pByteStreamActivate</i> parameter must specify an activation object that creates a writable byte stream. Internally, the transcode media sink calls <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfactivate-activateobject">IMFActivate::ActivateObject</a> to create the byte stream, as follows:
     * 
     * 
     * ``` syntax
     * IMFByteStream *pByteStream = NULL;
     * 
     * HRESULT hr = pByteStreamActivate-&gt;ActivateObject(IID_IMFByteStream, (void**)&amp;pByteStream);
     * ```
     * 
     * Currently, Microsoft Media Foundation does not provide any byte-stream activation objects. To use this method, an application must provide a custom implementation of <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a>.
     * @param {IMFActivate} pByteStreamActivate A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of a byte-stream activation object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setoutputbytestream
     */
    SetOutputByteStream(pByteStreamActivate) {
        result := ComCall(4, this, "ptr", pByteStreamActivate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the transcoding profile on the transcode sink activation object.
     * @remarks
     * Before calling this method, initialize the profile object as follows:
     * 
     * <ul>
     * <li>Set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a> attribute to specify the container type of the output file.</li>
     * <li>If the output file will have a video stream, set video attributes by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodeprofile-setvideoattributes">IMFTranscodeProfile::SetVideoAttributes</a> method.</li>
     * <li>If the output file will have an audio stream, set audio attributes by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodeprofile-setaudioattributes">IMFTranscodeProfile::SetAudioAttributes</a> method.</li>
     * </ul>
     * @param {IMFTranscodeProfile} pProfile A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftranscodeprofile">IMFTranscodeProfile</a> interface. To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatetranscodeprofile">MFCreateTranscodeProfile</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setprofile
     */
    SetProfile(pProfile) {
        result := ComCall(5, this, "ptr", pProfile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the media types for the audio and video streams specified in the transcode profile.
     * @remarks
     * Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setprofile">IMFTranscodeSinkInfoProvider::SetProfile</a> to set the transcode profile. The <b>GetSinkInfo</b> method  uses the profile to create media types for the audio and video streams.
     * @returns {MF_TRANSCODE_SINK_INFO} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mf_transcode_sink_info">MF_TRANSCODE_SINK_INFO</a> structure.
     * 
     * If the method succeeds, the method assigns <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> pointers to the <b>pAudioMediaType</b> and <b>pVideoMediaType</b> members of this structure. The method might set either member to <b>NULL</b>. If either member is non-NULL after the method returns, the caller must release the <b>IMFMediaType</b> pointers.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imftranscodesinkinfoprovider-getsinkinfo
     */
    GetSinkInfo() {
        pSinkInfo := MF_TRANSCODE_SINK_INFO()
        result := ComCall(6, this, "ptr", pSinkInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSinkInfo
    }
}
