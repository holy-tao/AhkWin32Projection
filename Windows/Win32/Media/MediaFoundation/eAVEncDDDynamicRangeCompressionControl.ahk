#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the dynamic range control profile in a Dolby Digital audio stream. This enumeration is used with the AVEncDDDynamicRangeCompressionControl property.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencdddynamicrangecompressioncontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncDDDynamicRangeCompressionControl extends Win32Enum {

    /**
     * No dynamic range compression.
     * Native name: eAVEncDDDynamicRangeCompressionControl_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Film standard profile.
     * Native name: eAVEncDDDynamicRangeCompressionControl_FilmStandard
     * @type {Integer (Int32)}
     */
    static FilmStandard => 1

    /**
     * Film light profile.
     * Native name: eAVEncDDDynamicRangeCompressionControl_FilmLight
     * @type {Integer (Int32)}
     */
    static FilmLight => 2

    /**
     * Music standard profile.
     * Native name: eAVEncDDDynamicRangeCompressionControl_MusicStandard
     * @type {Integer (Int32)}
     */
    static MusicStandard => 3

    /**
     * Music light profile.
     * Native name: eAVEncDDDynamicRangeCompressionControl_MusicLight
     * @type {Integer (Int32)}
     */
    static MusicLight => 4

    /**
     * Speech profile.
     * Native name: eAVEncDDDynamicRangeCompressionControl_Speech
     * @type {Integer (Int32)}
     */
    static Speech => 5
}
