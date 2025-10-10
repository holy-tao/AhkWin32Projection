#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AMExtendedSeekingCapabilities enumeration contains flags that describe the extended seeking capabilities of a filter.
 * @remarks
 * 
  * See <a href="https://docs.microsoft.com/windows/desktop/api/qnetwork/nf-qnetwork-iamextendedseeking-get_exseekcapabilities">IAMExtendedSeeking::get_ExSeekCapabilities</a> for descriptions of how the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/windows-media-source-filter">Windows Media Source</a> filter sets these flags.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/ne-qnetwork-amextendedseekingcapabilities
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMExtendedSeekingCapabilities{

    /**
     * Indicates that the stream is seekable.
     * @type {Integer (Int32)}
     */
    static AM_EXSEEK_CANSEEK => 1

    /**
     * Indicates that the filter supports rates other than 1.0.
     * @type {Integer (Int32)}
     */
    static AM_EXSEEK_CANSCAN => 2

    /**
     * Indicates that the stream contains markers.
     * @type {Integer (Int32)}
     */
    static AM_EXSEEK_MARKERSEEK => 4

    /**
     * Indicates that the filter can play back at rates other than 1.0.
     * @type {Integer (Int32)}
     */
    static AM_EXSEEK_SCANWITHOUTCLOCK => 8

    /**
     * Indicates that the filter can seek to a new frame without displaying the new frame when it finds it.
     * @type {Integer (Int32)}
     */
    static AM_EXSEEK_NOSTANDARDREPAINT => 16

    /**
     * Indicates that the filter can seek while the stream is buffering.
     * @type {Integer (Int32)}
     */
    static AM_EXSEEK_BUFFERING => 32

    /**
     * Indicates that the filter's video pin has been created.
     * @type {Integer (Int32)}
     */
    static AM_EXSEEK_SENDS_VIDEOFRAMEREADY => 64
}
