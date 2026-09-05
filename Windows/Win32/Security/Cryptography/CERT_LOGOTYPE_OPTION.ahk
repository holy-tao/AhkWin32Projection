#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_LOGOTYPE_OPTION extends Win32Enum {

    /**
     * Native name: CERT_LOGOTYPE_DIRECT_INFO_CHOICE
     * @type {Integer (UInt32)}
     */
    static DIRECT_INFO_CHOICE => 1

    /**
     * Native name: CERT_LOGOTYPE_INDIRECT_INFO_CHOICE
     * @type {Integer (UInt32)}
     */
    static INDIRECT_INFO_CHOICE => 2
}
