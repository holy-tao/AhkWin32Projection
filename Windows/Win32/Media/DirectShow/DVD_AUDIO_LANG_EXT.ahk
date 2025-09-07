#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags that indicate whether an audio stream contains audio language extensions.
 * @remarks
 * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getaudioattributes">IDvdInfo2::GetAudioAttributes</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdefaultaudiolanguage">IDvdInfo2::GetDefaultAudioLanguage</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_audio_lang_ext
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_AUDIO_LANG_EXT{

    /**
     * The DVD doesn't specify an audio language extension for this audio stream.
     * @type {Integer (Int32)}
     */
    static DVD_AUD_EXT_NotSpecified => 0

    /**
     * The audio stream contains captions.
     * @type {Integer (Int32)}
     */
    static DVD_AUD_EXT_Captions => 1

    /**
     * The audio stream contains content for people with low vision.
     * @type {Integer (Int32)}
     */
    static DVD_AUD_EXT_VisuallyImpaired => 2

    /**
     * The audio stream contains "director comments 1."
     * @type {Integer (Int32)}
     */
    static DVD_AUD_EXT_DirectorComments1 => 3

    /**
     * The audio stream contains "director comments 2."
     * @type {Integer (Int32)}
     */
    static DVD_AUD_EXT_DirectorComments2 => 4
}
