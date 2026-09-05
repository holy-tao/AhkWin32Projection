#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_STORE_SAVE_TO extends Win32Enum {

    /**
     * Native name: CERT_STORE_SAVE_TO_FILE
     * @type {Integer (UInt32)}
     */
    static FILE => 1

    /**
     * Native name: CERT_STORE_SAVE_TO_FILENAME
     * @type {Integer (UInt32)}
     */
    static FILENAME => 4

    /**
     * Native name: CERT_STORE_SAVE_TO_FILENAME_A
     * @type {Integer (UInt32)}
     */
    static FILENAME_A => 3

    /**
     * Native name: CERT_STORE_SAVE_TO_FILENAME_W
     * @type {Integer (UInt32)}
     */
    static FILENAME_W => 4

    /**
     * Native name: CERT_STORE_SAVE_TO_MEMORY
     * @type {Integer (UInt32)}
     */
    static MEMORY => 2
}
