#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that describe a media item.
 * @remarks
 * The following <b>typedef</b> is defined for combining flags from this enumeration.
 * 
 * 
 * ``` syntax
 * typedef UINT32 MFP_MEDIAITEM_CHARACTERISTICS;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/ne-mfplay-_mfp_mediaitem_characteristics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class _MFP_MEDIAITEM_CHARACTERISTICS extends Win32Enum {

    /**
     * The media item represents a live data source, such as video camera. If playback is stopped and then restarted, there will be a gap in the content.
     * Native name: MFP_MEDIAITEM_IS_LIVE
     * @type {Integer (Int32)}
     */
    static IS_LIVE => 1

    /**
     * The media item supports seeking. If this flag is absent, the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setposition">IMFPMediaPlayer::SetPosition</a> method will fail.
     * Native name: MFP_MEDIAITEM_CAN_SEEK
     * @type {Integer (Int32)}
     */
    static CAN_SEEK => 2

    /**
     * The media item can pause. If this flag is absent, the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-pause">IMFPMediaPlayer::Pause</a> method will likely fail.
     * Native name: MFP_MEDIAITEM_CAN_PAUSE
     * @type {Integer (Int32)}
     */
    static CAN_PAUSE => 4

    /**
     * Seeking can take a long time. For example, the source might download content through HTTP.
     * Native name: MFP_MEDIAITEM_HAS_SLOW_SEEK
     * @type {Integer (Int32)}
     */
    static HAS_SLOW_SEEK => 8
}
