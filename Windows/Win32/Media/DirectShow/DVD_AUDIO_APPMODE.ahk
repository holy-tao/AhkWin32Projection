#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the current audio mode as retrieved in a call to IDvdInfo2::GetAudioAttributes.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_audio_appmode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_AUDIO_APPMODE extends Win32Enum{

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
