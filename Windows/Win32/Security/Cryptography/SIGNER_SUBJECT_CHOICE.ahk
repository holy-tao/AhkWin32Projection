#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class SIGNER_SUBJECT_CHOICE extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_SUBJECT_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_SUBJECT_BLOB => 2
}
