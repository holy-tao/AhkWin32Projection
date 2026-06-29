#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates information about the address URL of a website viewed.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_urlvisitevent
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_ARGS_URLVISITEVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
