#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class SIGNER_TIMESTAMP_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_TIMESTAMP_AUTHENTICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_TIMESTAMP_RFC3161 => 2
}
