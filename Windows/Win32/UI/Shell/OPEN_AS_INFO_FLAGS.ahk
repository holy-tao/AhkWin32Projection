#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct OPEN_AS_INFO_FLAGS {
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
    static OAIF_ALLOW_REGISTRATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_REGISTER_EXT => 2

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_EXEC => 4

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_FORCE_REGISTRATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_HIDE_REGISTRATION => 32

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_URL_PROTOCOL => 64

    /**
     * @type {Integer (Int32)}
     */
    static OAIF_FILE_IS_URI => 128
}
