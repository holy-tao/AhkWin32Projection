#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
class CRYPTUI_WIZ_IMPORT_SUBJECT_OPTION extends Win32Enum {

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_SUBJECT_FILE
     * @type {Integer (UInt32)}
     */
    static FILE => 1

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_CONTEXT
     * @type {Integer (UInt32)}
     */
    static CERT_CONTEXT => 2

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_SUBJECT_CTL_CONTEXT
     * @type {Integer (UInt32)}
     */
    static CTL_CONTEXT => 3

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_SUBJECT_CRL_CONTEXT
     * @type {Integer (UInt32)}
     */
    static CRL_CONTEXT => 4

    /**
     * Native name: CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_STORE
     * @type {Integer (UInt32)}
     */
    static CERT_STORE => 5
}
