#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DVD_ERROR enumeration value defines DVD error conditions.
 * @remarks
 * 
 * For the flags where <i>lParam2</i> contains two region codes, the regions are encoded as a set of bits, one bit per region, in reverse order. If a disc is allowed in a region, that bit is turned off. For example, for a Region 2 disc, the value is 11111101, with the second least significant bit turned off. A multi-region disc will have more than one bit turned off.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdevcod/ne-dvdevcod-dvd_error
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_ERROR{

    /**
     * Something unexpected happened; perhaps content is authored incorrectly. Playback is stopped.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_Unexpected => 1

    /**
     * Key exchange for DVD copy protection failed. Playback is stopped.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_CopyProtectFail => 2

    /**
     * DVD-Video disc is authored incorrectly for specification version 1.<i>x</i>. Playback is stopped.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_InvalidDVD1_0Disc => 3

    /**
     * The disc cannot be played because it is not authored to play in the system region. You can try fixing the region mismatch by changing the system region with Dvdrgn.exe.
     * 
     * <i>lParam2</i>: The low <b>WORD</b> contains the disc region and the high <b>WORD</b> contains the system region.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_InvalidDiscRegion => 4

    /**
     * Player parental level is lower than the lowest parental level available in the DVD content. Playback is stopped.
     * 
     * <i>lParam2</i>: The lowest parental level in the DVD content, or -1 if no parental level is specified in the content.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_LowParentalLevel => 5

    /**
     * Analog copy protection distribution failed. Playback stopped.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_MacrovisionFail => 6

    /**
     * No discs can be played because the system region does not match the decoder region.
     * 
     * <i>lParam2</i>: The low <b>WORD</b> contains the system region and the high <b>WORD</b> contains the decoder region.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_IncompatibleSystemAndDecoderRegions => 7

    /**
     * The disc cannot be played because the disc is not authored to be played in the decoder's region.
     * 
     * <i>lParam2</i>: The low <b>WORD</b> contains the disc region and the high <b>WORD</b> contains the decoder region.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_IncompatibleDiscAndDecoderRegions => 8

    /**
     * The disc cannot be played because the video display does not meet the copy protection requirements.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_CopyProtectOutputFail => 9

    /**
     * The disc cannot be played because the driver does not support checking the video display.
     * @type {Integer (Int32)}
     */
    static DVD_ERROR_CopyProtectOutputNotSupported => 10
}
