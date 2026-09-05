#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the download of a media file.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_mediadownloadevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_MEDIADOWNLOADEVENT extends Win32Enum {

    /**
     * The name of the application used to download the media file.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 0

    /**
     * The version of the application used to download the media file.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_APPVERSION
     * @type {Integer (Int32)}
     */
    static APPVERSION => 1

    /**
     * The type of media file downloaded.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_MEDIATYPE
     * @type {Integer (Int32)}
     */
    static MEDIATYPE => 2

    /**
     * The path used to download the media file.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_PATH
     * @type {Integer (Int32)}
     */
    static PATH => 3

    /**
     * The title of the downloaded  media file.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_TITLE
     * @type {Integer (Int32)}
     */
    static TITLE => 4

    /**
     * The parental management level (PML) of the downloaded media file.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_PML
     * @type {Integer (Int32)}
     */
    static PML => 5

    /**
     * The album information of the downloaded media file.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_ALBUM
     * @type {Integer (Int32)}
     */
    static ALBUM => 6

    /**
     * The explicit rating of the downloaded media file.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_EXPLICIT
     * @type {Integer (Int32)}
     */
    static EXPLICIT => 7

    /**
     * The reason used to download the media file.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 8

    /**
     * The arguments used to download the media file.
     * Native name: WPC_ARGS_MEDIADOWNLOADEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 9
}
