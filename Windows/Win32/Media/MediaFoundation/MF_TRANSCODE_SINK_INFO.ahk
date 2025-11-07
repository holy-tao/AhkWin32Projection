#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the audio and video streams for the transcode sink activation object.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftranscodesinkinfoprovider-getsinkinfo">IMFTranscodeSinkInfoProvider::GetSinkInfo</a> method assigns <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> pointers to the <b>pAudioMediaType</b> and <b>pVideoMediaType</b> members of this structure. The method might set either member to <b>NULL</b>. If either member is non-<b>NULL</b> after the method returns, the caller must release the <b>IMFMediaType</b> pointers.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ns-mfidl-mf_transcode_sink_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TRANSCODE_SINK_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The stream identifier of the video stream.
     * @type {Integer}
     */
    dwVideoStreamID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type for the  video stream. This member can be <b>NULL</b>.
     * @type {IMFMediaType}
     */
    pVideoMediaType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The stream identifier of the audio stream.
     * @type {Integer}
     */
    dwAudioStreamID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type for the  audio stream. This member can be <b>NULL</b>.
     * @type {IMFMediaType}
     */
    pAudioMediaType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
