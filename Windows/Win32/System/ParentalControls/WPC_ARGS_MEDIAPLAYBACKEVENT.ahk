#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the playback of a media file.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_mediaplaybackevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_MEDIAPLAYBACKEVENT extends Win32Enum{

    /**
     * The name of the application used to play back a media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_APPNAME => 0

    /**
     * The version of the application used to play back a media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_APPVERSION => 1

    /**
     * The type of media file that was played.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_MEDIATYPE => 2

    /**
     * The path used to play back a media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_PATH => 3

    /**
     * The title of the media file that was played.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_TITLE => 4

    /**
     * The parental managements level of the media file that was played.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_PML => 5

    /**
     * The album of the media file that was played.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_ALBUM => 6

    /**
     * The explicit rating of the media file that was played.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_EXPLICIT => 7

    /**
     * The reason for  playing a media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_REASON => 8

    /**
     * The arguments used to play back a media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIAPLAYBACKEVENT_CARGS => 9
}
