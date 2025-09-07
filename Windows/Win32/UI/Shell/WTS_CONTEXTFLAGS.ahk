#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the context of a thumbnail extraction. Used by IThumbnailSettings::SetContext.
 * @see https://learn.microsoft.com/windows/win32/api/thumbcache/ne-thumbcache-wts_contextflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class WTS_CONTEXTFLAGS{

    /**
     * None of the following options are set. Set in response to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_flags">WTS_NONE</a>.
     * @type {Integer (Int32)}
     */
    static WTSCF_DEFAULT => 0

    /**
     * Provide a thumbnail suitable to the Windows Store app UX guidelines. Set in response to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_flags">WTS_APPSTYLE</a>.
     * @type {Integer (Int32)}
     */
    static WTSCF_APPSTYLE => 1

    /**
     * If necessary, crop the bitmap's dimensions so that is square. The length of the shortest side becomes the length of all sides. Set in response to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_flags">WTS_CROPTOSQUARE</a>.
     * @type {Integer (Int32)}
     */
    static WTSCF_SQUARE => 2

    /**
     * Stretch and crop the bitmap so that its height is 0.7 times its width. Set in response to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_flags">WTS_WIDETHUMBNAILS</a>.
     * @type {Integer (Int32)}
     */
    static WTSCF_WIDE => 4

    /**
     * If not cached, only extract the thumbnail if it is embedded in EXIF format, typically 96x96. Set in response to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_flags">WTS_FASTEXTRACT</a>.
     * @type {Integer (Int32)}
     */
    static WTSCF_FAST => 8
}
