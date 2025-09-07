#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the characteristics of a media source.
 * @remarks
 * To skip forward or backward in a playlist, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-start">IMFMediaSource::Start</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-start">IMFMediaSession::Start</a> with the <b>MF_TIME_FORMAT_ENTRY_RELATIVE</b> time-format GUID. This capability applies only when the <b>MFMEDIASOURCE_HAS_MULTIPLE_PRESENTATIONS</b> flag is present.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfmediasource_characteristics
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFMEDIASOURCE_CHARACTERISTICS{

    /**
     * This flag indicates a data source that runs constantly, such as a live presentation. If the source is stopped and then restarted, there will be a gap in the content.
     * @type {Integer (Int32)}
     */
    static MFMEDIASOURCE_IS_LIVE => 1

    /**
     * The media source supports seeking.
     * @type {Integer (Int32)}
     */
    static MFMEDIASOURCE_CAN_SEEK => 2

    /**
     * The source can pause.
     * @type {Integer (Int32)}
     */
    static MFMEDIASOURCE_CAN_PAUSE => 4

    /**
     * The media source downloads content. It might take a long time to seek to parts of the content that have not been downloaded.
     * @type {Integer (Int32)}
     */
    static MFMEDIASOURCE_HAS_SLOW_SEEK => 8

    /**
     * The media source delivers a playlist, which might contain more than one entry. After the first playlist entry has completed, the media source signals the start of each new playlist entry by sending an <a href="https://docs.microsoft.com/windows/desktop/medfound/menewpresentation">MENewPresentation</a> event. The event contains a presentation descriptor for the entry.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFMEDIASOURCE_HAS_MULTIPLE_PRESENTATIONS => 16

    /**
     * The media source can skip forward in the playlist. Applies only if the MFMEDIASOURCE_HAS_MULTIPLE_PRESENTATIONS flag is present. 
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFMEDIASOURCE_CAN_SKIPFORWARD => 32

    /**
     * The media source can skip backward in the playlist.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFMEDIASOURCE_CAN_SKIPBACKWARD => 64

    /**
     * The media source is not currently
 *     using the network to receive the content.  Networking hardware
 *     may enter a power saving state when this bit is set.
 * 
 * <div class="alert"><b>Note</b>  Requires Windows 8 or later.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static MFMEDIASOURCE_DOES_NOT_USE_NETWORK => 128
}
