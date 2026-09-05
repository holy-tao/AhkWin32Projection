#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class SIGNER_TIMESTAMP_FLAGS extends Win32Enum {

    /**
     * Native name: SIGNER_TIMESTAMP_AUTHENTICODE
     * @type {Integer (UInt32)}
     */
    static AUTHENTICODE => 1

    /**
     * Native name: SIGNER_TIMESTAMP_RFC3161
     * @type {Integer (UInt32)}
     */
    static RFC3161 => 2
}
