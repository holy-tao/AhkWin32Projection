#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_FLAGS {
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
    static CRYPTUI_WIZ_NO_UI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IGNORE_NO_UI_FLAG_FOR_CSPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_NO_UI_EXCEPT_CSP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_ALLOW_CERT => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_ALLOW_CRL => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_ALLOW_CTL => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_NO_CHANGE_DEST_STORE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_TO_LOCALMACHINE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_TO_CURRENTUSER => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_IMPORT_REMOTE_DEST_STORE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_EXPORT_PRIVATE_KEY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_EXPORT_NO_DELETE_PRIVATE_KEY => 512
}
