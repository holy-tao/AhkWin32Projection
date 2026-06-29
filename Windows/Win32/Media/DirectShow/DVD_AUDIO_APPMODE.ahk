#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the current audio mode as retrieved in a call to IDvdInfo2::GetAudioAttributes.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_audio_appmode
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_AUDIO_APPMODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No special audio mode. The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator Filter</a> will send the audio to the decoder with no special processing.
     * @type {Integer (Int32)}
     */
    static DVD_AudioMode_None => 0

    /**
     * The current audio mode is karaoke content.
     * @type {Integer (Int32)}
     */
    static DVD_AudioMode_Karaoke => 1

    /**
     * The current audio mode is surround sound.
     * @type {Integer (Int32)}
     */
    static DVD_AudioMode_Surround => 2

    /**
     * Unrecognized audio mode.
     * @type {Integer (Int32)}
     */
    static DVD_AudioMode_Other => 3
}
