#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the dynamic range control profile in a Dolby Digital audio stream. This enumeration is used with the AVEncDDDynamicRangeCompressionControl property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencdddynamicrangecompressioncontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncDDDynamicRangeCompressionControl{

    /**
     * No dynamic range compression.
     * @type {Integer (Int32)}
     */
    static eAVEncDDDynamicRangeCompressionControl_None => 0

    /**
     * Film standard profile.
     * @type {Integer (Int32)}
     */
    static eAVEncDDDynamicRangeCompressionControl_FilmStandard => 1

    /**
     * Film light profile.
     * @type {Integer (Int32)}
     */
    static eAVEncDDDynamicRangeCompressionControl_FilmLight => 2

    /**
     * Music standard profile.
     * @type {Integer (Int32)}
     */
    static eAVEncDDDynamicRangeCompressionControl_MusicStandard => 3

    /**
     * Music light profile.
     * @type {Integer (Int32)}
     */
    static eAVEncDDDynamicRangeCompressionControl_MusicLight => 4

    /**
     * Speech profile.
     * @type {Integer (Int32)}
     */
    static eAVEncDDDynamicRangeCompressionControl_Speech => 5
}
