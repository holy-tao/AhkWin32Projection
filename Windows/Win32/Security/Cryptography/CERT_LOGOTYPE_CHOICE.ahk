#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_LOGOTYPE_CHOICE extends Win32Enum {

    /**
     * Native name: CERT_LOGOTYPE_NO_IMAGE_RESOLUTION_CHOICE
     * @type {Integer (UInt32)}
     */
    static NO_IMAGE_RESOLUTION_CHOICE => 0

    /**
     * Native name: CERT_LOGOTYPE_BITS_IMAGE_RESOLUTION_CHOICE
     * @type {Integer (UInt32)}
     */
    static BITS_IMAGE_RESOLUTION_CHOICE => 1

    /**
     * Native name: CERT_LOGOTYPE_TABLE_SIZE_IMAGE_RESOLUTION_CHOICE
     * @type {Integer (UInt32)}
     */
    static TABLE_SIZE_IMAGE_RESOLUTION_CHOICE => 2
}
