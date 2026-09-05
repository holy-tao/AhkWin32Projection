#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the playback of a media file.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_mediaplaybackevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_MEDIAPLAYBACKEVENT extends Win32Enum {

    /**
     * The name of the application used to play back a media file.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 0

    /**
     * The version of the application used to play back a media file.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 1

    /**
     * The type of media file that was played.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_MEDIATYPE
     * @type {Integer (Int32)}
     */
    static MEDIATYPE => 2

    /**
     * The path used to play back a media file.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_PATH
     * @type {Integer (Int32)}
     */
    static PATH => 3

    /**
     * The title of the media file that was played.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_TITLE
     * @type {Integer (Int32)}
     */
    static TITLE => 4

    /**
     * The parental managements level of the media file that was played.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_PML
     * @type {Integer (Int32)}
     */
    static PML => 5

    /**
     * The album of the media file that was played.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_ALBUM
     * @type {Integer (Int32)}
     */
    static ALBUM => 6

    /**
     * The explicit rating of the media file that was played.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_EXPLICIT
     * @type {Integer (Int32)}
     */
    static EXPLICIT => 7

    /**
     * The reason for  playing a media file.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 8

    /**
     * The arguments used to play back a media file.
     * Native name: WPC_ARGS_MEDIAPLAYBACKEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 9
}
