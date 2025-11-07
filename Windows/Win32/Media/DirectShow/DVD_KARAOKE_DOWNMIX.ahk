#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags used by the IDvdControl2::SelectKaraokeAudioPresentationMode method to control which speakers, if any, each auxiliary channel is downmixed to.
 * @remarks
 * 
 * Audio channels are zero-based, so channels 2 through 4 are the three auxiliary karaoke channels. Use bitwise <b>OR</b> operations to set the appropriate bit to send a channel to the left speaker (0), right speaker (1), both speakers, or to no speakers by turning both bits off. These bits are all off by default whenever the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator Filter</a> filter enters karaoke mode.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_karaoke_downmix
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_KARAOKE_DOWNMIX{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_0to0 => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_1to0 => 2

    /**
     * Downmix channel 2 to the left speaker.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_2to0 => 4

    /**
     * Downmix channel 3 to the left speaker.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_3to0 => 8

    /**
     * Downmix channel 4 to the left speaker.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_4to0 => 16

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_Lto0 => 32

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_Rto0 => 64

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_0to1 => 256

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_1to1 => 512

    /**
     * Downmix channel 2 to the right speaker.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_2to1 => 1024

    /**
     * Downmix channel 3 to the right speaker.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_3to1 => 2048

    /**
     * Downmix channel 4 to the right speaker.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_4to1 => 4096

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_Lto1 => 8192

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DVD_Mix_Rto1 => 16384
}
