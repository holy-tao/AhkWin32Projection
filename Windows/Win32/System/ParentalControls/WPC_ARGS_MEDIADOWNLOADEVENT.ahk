#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the download of a media file.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_mediadownloadevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_MEDIADOWNLOADEVENT extends Win32Enum{

    /**
     * The name of the application used to download the media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_APPNAME => 0

    /**
     * The version of the application used to download the media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_APPVERSION => 1

    /**
     * The type of media file downloaded.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_MEDIATYPE => 2

    /**
     * The path used to download the media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_PATH => 3

    /**
     * The title of the downloaded  media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_TITLE => 4

    /**
     * The parental management level (PML) of the downloaded media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_PML => 5

    /**
     * The album information of the downloaded media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_ALBUM => 6

    /**
     * The explicit rating of the downloaded media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_EXPLICIT => 7

    /**
     * The reason used to download the media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_REASON => 8

    /**
     * The arguments used to download the media file.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_MEDIADOWNLOADEVENT_CARGS => 9
}
