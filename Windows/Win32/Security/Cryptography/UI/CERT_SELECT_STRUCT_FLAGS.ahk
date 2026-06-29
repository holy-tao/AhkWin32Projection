#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CERT_SELECT_STRUCT_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_HIDE_PROPERTIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_ENABLEHOOK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_ALLOWMULTISELECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_SHOW_HELP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_ENABLETEMPLATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_ENABLETEMPLATEHANDLE => 64
}
