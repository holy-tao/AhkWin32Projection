#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify common video formats.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfstandardvideoformat
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFStandardVideoFormat extends Win32Enum {

    /**
     * Reserved; do not use.
     * Native name: MFStdVideoFormat_reserved
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_reserved => 0

    /**
     * NTSC television (720 x 480i).
     * Native name: MFStdVideoFormat_NTSC
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_NTSC => 1

    /**
     * PAL television (720 x 576i).
     * Native name: MFStdVideoFormat_PAL
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_PAL => 2

    /**
     * DVD, NTSC standard (720 x 480).
     * Native name: MFStdVideoFormat_DVD_NTSC
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_DVD_NTSC => 3

    /**
     * DVD, PAL standard (720 x 576).
     * Native name: MFStdVideoFormat_DVD_PAL
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_DVD_PAL => 4

    /**
     * DV video, PAL standard.
     * Native name: MFStdVideoFormat_DV_PAL
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_DV_PAL => 5

    /**
     * DV video, NTSC standard.
     * Native name: MFStdVideoFormat_DV_NTSC
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_DV_NTSC => 6

    /**
     * ATSC digital television, SD (480i).
     * Native name: MFStdVideoFormat_ATSC_SD480i
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_ATSC_SD480i => 7

    /**
     * ATSC digital television, HD interlaced (1080i)
     * Native name: MFStdVideoFormat_ATSC_HD1080i
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_ATSC_HD1080i => 8

    /**
     * ATSC digital television, HD progressive (720p)
     * Native name: MFStdVideoFormat_ATSC_HD720p
     * @type {Integer (Int32)}
     */
    static StdVideoFormat_ATSC_HD720p => 9
}
