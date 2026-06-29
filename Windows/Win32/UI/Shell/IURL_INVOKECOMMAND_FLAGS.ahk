#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IURL_INVOKECOMMAND_FLAGS {
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
    static IURL_INVOKECOMMAND_FL_ALLOW_UI => 1

    /**
     * @type {Integer (Int32)}
     */
    static IURL_INVOKECOMMAND_FL_USE_DEFAULT_VERB => 2

    /**
     * @type {Integer (Int32)}
     */
    static IURL_INVOKECOMMAND_FL_DDEWAIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static IURL_INVOKECOMMAND_FL_ASYNCOK => 8

    /**
     * @type {Integer (Int32)}
     */
    static IURL_INVOKECOMMAND_FL_LOG_USAGE => 16
}
