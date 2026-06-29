#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_AUDIO_LANG_EXT.ahk" { DVD_AUDIO_LANG_EXT }
#Import ".\DVD_AUDIO_FORMAT.ahk" { DVD_AUDIO_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DVD_AUDIO_APPMODE.ahk" { DVD_AUDIO_APPMODE }

/**
 * The DVD_AudioAttributes structure is used in IDvdInfo2::GetAudioAttributes to receive the various audio attributes of the disc.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_audioattributes
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_AudioAttributes {
    #StructPack 4

    /**
     * Indicates the current audio mode. If the mode returned is DVD_AudioMode_Karaoke, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getkaraokeattributes">IDvdInfo2::GetKaraokeAttributes</a> to get more info.
     */
    AppMode : DVD_AUDIO_APPMODE

    AppModeData : Int8

    /**
     * Describes the format (encoding mode) of the audio stream.
     */
    AudioFormat : DVD_AUDIO_FORMAT

    /**
     * An <b>LCID</b> value indicating the language of the audio stream. Is zero if no language is present.
     */
    Language : UInt32

    /**
     * A [DVD_AUDIO_LANG_EXT](/windows/desktop/api/strmif/ne-strmif-dvd_audio_lang_ext) enumeration that will be filled in if any information is available on the disc.
     */
    LanguageExtension : DVD_AUDIO_LANG_EXT

    /**
     * Indicates whether multichannel attributes are present. If <b>TRUE</b>, it means there is additional mixing information available, such as for SurroundSound. Call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-gettitleattributes">IDvdInfo2::GetTitleAttributes</a> to retrieve the multichannel information.
     */
    fHasMultichannelInfo : BOOL

    /**
     * The frequency in hertz (48k, 96k) of the audio stream.
     */
    dwFrequency : UInt32

    /**
     * The resolution of the audio stream (16, 20, 24 bits, or other) Zero indicates the resolution is unknown.
     */
    bQuantization : Int8

    /**
     * The number of channels. For example, 5.1 Dolby AC-3 has six channels.
     */
    bNumberOfChannels : Int8

    /**
     * Reserved.
     */
    dwReserved : UInt32[2]

}
