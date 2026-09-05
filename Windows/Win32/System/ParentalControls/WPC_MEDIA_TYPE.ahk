#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the type of media file accessed.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_media_type
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_MEDIA_TYPE extends Win32Enum {

    /**
     * The type of media file accessed is not one of the types available.
     * Native name: WPC_MEDIA_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 0

    /**
     * The type of media file accessed is a DVD.
     * Native name: WPC_MEDIA_TYPE_DVD
     * @type {Integer (Int32)}
     */
    static DVD => 1

    /**
     * The type of media file accessed is recorded television.
     * Native name: WPC_MEDIA_TYPE_RECORDED_TV
     * @type {Integer (Int32)}
     */
    static RECORDED_TV => 2

    /**
     * The type of media file accessed is an audio file other than a CD audio file.
     * Native name: WPC_MEDIA_TYPE_AUDIO_FILE
     * @type {Integer (Int32)}
     */
    static AUDIO_FILE => 3

    /**
     * The type of media file accessed is a CD audio file.
     * Native name: WPC_MEDIA_TYPE_CD_AUDIO
     * @type {Integer (Int32)}
     */
    static CD_AUDIO => 4

    /**
     * The type of media file accessed is a video file.
     * Native name: WPC_MEDIA_TYPE_VIDEO_FILE
     * @type {Integer (Int32)}
     */
    static VIDEO_FILE => 5

    /**
     * The type of media file accessed is a picture file.
     * Native name: WPC_MEDIA_TYPE_PICTURE_FILE
     * @type {Integer (Int32)}
     */
    static PICTURE_FILE => 6

    /**
     * The type of media file accessed is a .max file.
     * Native name: WPC_MEDIA_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 7
}
