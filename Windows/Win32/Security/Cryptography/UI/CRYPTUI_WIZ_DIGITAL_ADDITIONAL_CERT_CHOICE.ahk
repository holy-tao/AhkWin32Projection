#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE {
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
    static CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN_NO_ROOT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_DIGITAL_SIGN_ADD_NONE => 0
}
