#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that specify common video formats.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ne-mfobjects-mfstandardvideoformat
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFStandardVideoFormat{

    /**
     * Reserved; do not use.
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_reserved => 0

    /**
     * NTSC television (720 x 480i).
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_NTSC => 1

    /**
     * PAL television (720 x 576i).
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_PAL => 2

    /**
     * DVD, NTSC standard (720 x 480).
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_DVD_NTSC => 3

    /**
     * DVD, PAL standard (720 x 576).
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_DVD_PAL => 4

    /**
     * DV video, PAL standard.
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_DV_PAL => 5

    /**
     * DV video, NTSC standard.
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_DV_NTSC => 6

    /**
     * ATSC digital television, SD (480i).
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_ATSC_SD480i => 7

    /**
     * ATSC digital television, HD interlaced (1080i)
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_ATSC_HD1080i => 8

    /**
     * ATSC digital television, HD progressive (720p)
     * @type {Integer (Int32)}
     */
    static MFStdVideoFormat_ATSC_HD720p => 9
}
