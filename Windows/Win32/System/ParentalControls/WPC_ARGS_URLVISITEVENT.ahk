#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the address URL of a website viewed.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_urlvisitevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_URLVISITEVENT extends Win32Enum {

    /**
     * The address URL of a website viewed.
     * Native name: WPC_ARGS_URLVISITEVENT_URL
     * @type {Integer (Int32)}
     */
    static URL => 0

    /**
     * The name of the application used to view the website.
     * Native name: WPC_ARGS_URLVISITEVENT_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 1

    /**
     * The version of the application used to view the website.
     * Native name: WPC_ARGS_URLVISITEVENT_VERSION
     * @type {Integer (Int32)}
     */
    static VERSION => 2

    /**
     * The reason for viewing the website.
     * Native name: WPC_ARGS_URLVISITEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 3

    /**
     * The identifier of the rating system used to view the website.
     * Native name: WPC_ARGS_URLVISITEVENT_RATINGSYSTEMID
     * @type {Integer (Int32)}
     */
    static RATINGSYSTEMID => 4

    /**
     * The number of categories viewed on the website.
     * Native name: WPC_ARGS_URLVISITEVENT_CATCOUNT
     * @type {Integer (Int32)}
     */
    static CATCOUNT => 5

    /**
     * The category of the website.
     * Native name: WPC_ARGS_URLVISITEVENT_CATEGORY
     * @type {Integer (Int32)}
     */
    static CATEGORY => 6

    /**
     * The arguments used to view the website.
     * Native name: WPC_ARGS_URLVISITEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 7
}
