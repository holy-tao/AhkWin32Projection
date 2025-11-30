#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_STORE_SAVE_TO extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILENAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILENAME_A => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_FILENAME_W => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_SAVE_TO_MEMORY => 2
}
