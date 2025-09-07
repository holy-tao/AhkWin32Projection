#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_FLAGS{

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
