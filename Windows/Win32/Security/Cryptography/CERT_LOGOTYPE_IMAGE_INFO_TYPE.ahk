#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CERT_LOGOTYPE_IMAGE_INFO_TYPE extends Win32Enum {

    /**
     * Native name: CERT_LOGOTYPE_GRAY_SCALE_IMAGE_INFO_CHOICE
     * @type {Integer (UInt32)}
     */
    static GRAY_SCALE_IMAGE_INFO_CHOICE => 1

    /**
     * Native name: CERT_LOGOTYPE_COLOR_IMAGE_INFO_CHOICE
     * @type {Integer (UInt32)}
     */
    static COLOR_IMAGE_INFO_CHOICE => 2
}
