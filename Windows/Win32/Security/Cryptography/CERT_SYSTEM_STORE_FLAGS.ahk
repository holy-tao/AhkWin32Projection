#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_SYSTEM_STORE_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SYSTEM_STORE_LOCATION_MASK => 16711680

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_SYSTEM_STORE_RELOCATE_FLAG => 2147483648
}
