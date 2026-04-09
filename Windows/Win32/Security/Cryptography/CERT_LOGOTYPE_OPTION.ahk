#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_LOGOTYPE_OPTION extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_LOGOTYPE_DIRECT_INFO_CHOICE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_LOGOTYPE_INDIRECT_INFO_CHOICE => 2
}
