#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION extends Win32Enum{

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
