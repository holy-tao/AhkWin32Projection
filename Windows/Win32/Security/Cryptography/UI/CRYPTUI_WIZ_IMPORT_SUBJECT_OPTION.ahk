#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION {
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
    static CRYPTUI_WIZ_IMPORT_SUBJECT_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_CONTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_SUBJECT_CTL_CONTEXT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_SUBJECT_CRL_CONTEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_STORE => 5
}
