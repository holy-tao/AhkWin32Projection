#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct CREDUIWIN_FLAGS {
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
    static CREDUIWIN_GENERIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_CHECKBOX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_AUTHPACKAGE_ONLY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_IN_CRED_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_ENUMERATE_ADMINS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_ENUMERATE_CURRENT_USER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_SECURE_PROMPT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_PREPROMPTING => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CREDUIWIN_PACK_32_WOW => 268435456
}
