#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about the address URL of a website viewed.
 * @see https://docs.microsoft.com/windows/win32/api//wpcevent/ne-wpcevent-wpc_args_urlvisitevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_URLVISITEVENT{

    /**
     * The address URL of a website viewed.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_URLVISITEVENT_URL => 0

    /**
     * The name of the application used to view the website.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_URLVISITEVENT_APPNAME => 1

    /**
     * The version of the application used to view the website.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_URLVISITEVENT_VERSION => 2

    /**
     * The reason for viewing the website.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_URLVISITEVENT_REASON => 3

    /**
     * The identifier of the rating system used to view the website.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_URLVISITEVENT_RATINGSYSTEMID => 4

    /**
     * The number of categories viewed on the website.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_URLVISITEVENT_CATCOUNT => 5

    /**
     * The category of the website.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_URLVISITEVENT_CATEGORY => 6

    /**
     * The arguments used to view the website.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_URLVISITEVENT_CARGS => 7
}
