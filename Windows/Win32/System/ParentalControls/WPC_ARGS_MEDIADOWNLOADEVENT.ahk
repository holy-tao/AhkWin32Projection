#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates information about the download of a media file.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_mediadownloadevent
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_ARGS_MEDIADOWNLOADEVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
