#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct NAVIGATEFRAME_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_RECORD => 1

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_POST => 2

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_NO_DOC_CACHE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_NO_IMAGE_CACHE => 8

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_AUTH_FAIL_CACHE_OK => 16

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_SENDING_FROM_FORM => 32

    /**
     * @type {Integer (Int32)}
     */
    static NAVIGATEFRAME_FL_REALLY_SENDING_FROM_FORM => 64
}
