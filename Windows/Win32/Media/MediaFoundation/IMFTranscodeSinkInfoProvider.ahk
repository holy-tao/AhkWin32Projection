#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFActivate.ahk" { IMFActivate }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMFTranscodeProfile.ahk" { IMFTranscodeProfile }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_TRANSCODE_SINK_INFO.ahk" { MF_TRANSCODE_SINK_INFO }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

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
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imftranscodesinkinfoprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTranscodeSinkInfoProvider extends IUnknown {
    /**
     * The interface identifier for IMFTranscodeSinkInfoProvider
     * @type {Guid}
     */
    static IID := Guid("{8cffcd2e-5a03-4a3a-aff7-edcd107c620e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTranscodeSinkInfoProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetOutputFile       : IntPtr
        SetOutputByteStream : IntPtr
        SetProfile          : IntPtr
        GetSinkInfo         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTranscodeSinkInfoProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the name of the encoded output file.
     * @remarks
     * The media sink will create a local file with the specified file name.
     * 
     * Alternately, you can call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setoutputbytestream">IMFTranscodeSinkInfoProvider::SetOutputByteStream</a> to specify a byte stream  that will receive the transcoded data. These two methods are mutually exclusive.
     * @param {PWSTR} pwszFileName Pointer to a null-terminated string that contains the name of the output file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setoutputfile
     */
    SetOutputFile(pwszFileName) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := ComCall(3, this, "ptr", pwszFileName, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setoutputbytestream
     */
    SetOutputByteStream(pByteStreamActivate) {
        result := ComCall(4, this, "ptr", pByteStreamActivate, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setprofile
     */
    SetProfile(pProfile) {
        result := ComCall(5, this, "ptr", pProfile, "HRESULT")
        return result
    }

    /**
     * Gets the media types for the audio and video streams specified in the transcode profile.
     * @remarks
     * Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-setprofile">IMFTranscodeSinkInfoProvider::SetProfile</a> to set the transcode profile. The <b>GetSinkInfo</b> method  uses the profile to create media types for the audio and video streams.
     * @returns {MF_TRANSCODE_SINK_INFO} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mf_transcode_sink_info">MF_TRANSCODE_SINK_INFO</a> structure.
     * 
     * If the method succeeds, the method assigns <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> pointers to the <b>pAudioMediaType</b> and <b>pVideoMediaType</b> members of this structure. The method might set either member to <b>NULL</b>. If either member is non-NULL after the method returns, the caller must release the <b>IMFMediaType</b> pointers.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-getsinkinfo
     */
    GetSinkInfo() {
        pSinkInfo := MF_TRANSCODE_SINK_INFO()
        result := ComCall(6, this, MF_TRANSCODE_SINK_INFO.Ptr, pSinkInfo, "HRESULT")
        return pSinkInfo
    }

    Query(iid) {
        if (IMFTranscodeSinkInfoProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOutputFile := CallbackCreate(GetMethod(implObj, "SetOutputFile"), flags, 2)
        this.vtbl.SetOutputByteStream := CallbackCreate(GetMethod(implObj, "SetOutputByteStream"), flags, 2)
        this.vtbl.SetProfile := CallbackCreate(GetMethod(implObj, "SetProfile"), flags, 2)
        this.vtbl.GetSinkInfo := CallbackCreate(GetMethod(implObj, "GetSinkInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOutputFile)
        CallbackFree(this.vtbl.SetOutputByteStream)
        CallbackFree(this.vtbl.SetProfile)
        CallbackFree(this.vtbl.GetSinkInfo)
    }
}
