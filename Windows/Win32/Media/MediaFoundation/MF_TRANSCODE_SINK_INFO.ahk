#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMFMediaType.ahk" { IMFMediaType }

/**
 * Contains information about the audio and video streams for the transcode sink activation object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-getsinkinfo">IMFTranscodeSinkInfoProvider::GetSinkInfo</a> method assigns <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> pointers to the <b>pAudioMediaType</b> and <b>pVideoMediaType</b> members of this structure. The method might set either member to <b>NULL</b>. If either member is non-<b>NULL</b> after the method returns, the caller must release the <b>IMFMediaType</b> pointers.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mf_transcode_sink_info
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TRANSCODE_SINK_INFO {
    #StructPack 8

    /**
     * The stream identifier of the video stream.
     */
    dwVideoStreamID : UInt32

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type for the  video stream. This member can be <b>NULL</b>.
     */
    pVideoMediaType : IMFMediaType

    /**
     * The stream identifier of the audio stream.
     */
    dwAudioStreamID : UInt32

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type for the  audio stream. This member can be <b>NULL</b>.
     */
    pAudioMediaType : IMFMediaType

}
