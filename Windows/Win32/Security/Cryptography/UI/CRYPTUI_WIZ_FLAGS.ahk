#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
class CRYPTUI_WIZ_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPTUI_WIZ_NO_UI
     * @type {Integer (UInt32)}
     */
    static NO_UI => 1

    /**
     * Native name: CRYPTUI_WIZ_IGNORE_NO_UI_FLAG_FOR_CSPS
     * @type {Integer (UInt32)}
     */
    static IGNORE_NO_UI_FLAG_FOR_CSPS => 2

    /**
     * Native name: CRYPTUI_WIZ_NO_UI_EXCEPT_CSP
     * @type {Integer (UInt32)}
     */
    static NO_UI_EXCEPT_CSP => 3

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_ALLOW_CERT
     * @type {Integer (UInt32)}
     */
    static IMPORT_ALLOW_CERT => 131072

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_ALLOW_CRL
     * @type {Integer (UInt32)}
     */
    static IMPORT_ALLOW_CRL => 262144

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_ALLOW_CTL
     * @type {Integer (UInt32)}
     */
    static IMPORT_ALLOW_CTL => 524288

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_NO_CHANGE_DEST_STORE
     * @type {Integer (UInt32)}
     */
    static IMPORT_NO_CHANGE_DEST_STORE => 65536

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_TO_LOCALMACHINE
     * @type {Integer (UInt32)}
     */
    static IMPORT_TO_LOCALMACHINE => 1048576

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_TO_CURRENTUSER
     * @type {Integer (UInt32)}
     */
    static IMPORT_TO_CURRENTUSER => 2097152

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_REMOTE_DEST_STORE
     * @type {Integer (UInt32)}
     */
    static IMPORT_REMOTE_DEST_STORE => 4194304

    /**
     * Native name: CRYPTUI_WIZ_EXPORT_PRIVATE_KEY
     * @type {Integer (UInt32)}
     */
    static EXPORT_PRIVATE_KEY => 256

    /**
     * Native name: CRYPTUI_WIZ_EXPORT_NO_DELETE_PRIVATE_KEY
     * @type {Integer (UInt32)}
     */
    static EXPORT_NO_DELETE_PRIVATE_KEY => 512
}
