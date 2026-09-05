#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class SIGNER_SUBJECT_CHOICE extends Win32Enum {

    /**
     * Native name: SIGNER_SUBJECT_FILE
     * @type {Integer (UInt32)}
     */
    static FILE => 1

    /**
     * Native name: SIGNER_SUBJECT_BLOB
     * @type {Integer (UInt32)}
     */
    static BLOB => 2
}
