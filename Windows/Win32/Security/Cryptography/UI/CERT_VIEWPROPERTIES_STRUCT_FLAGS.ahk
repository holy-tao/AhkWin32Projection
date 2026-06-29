#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CERT_VIEWPROPERTIES_STRUCT_FLAGS {
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
    static CM_ENABLEHOOK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SHOW_HELP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SHOW_HELPICON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_ENABLETEMPLATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_HIDE_ADVANCEPAGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CM_HIDE_TRUSTPAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_NO_NAMECHANGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CM_NO_EDITTRUST => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CM_HIDE_DETAILPAGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CM_ADD_CERT_STORES => 512
}
