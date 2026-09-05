#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
class CRYPTUI_WIZ_EXPORT_FORMAT extends Win32Enum {

    /**
     * Native name: CRYPTUI_WIZ_EXPORT_FORMAT_DER
     * @type {Integer (UInt32)}
     */
    static DER => 1

    /**
     * Native name: CRYPTUI_WIZ_EXPORT_FORMAT_PFX
     * @type {Integer (UInt32)}
     */
    static PFX => 2

    /**
     * Native name: CRYPTUI_WIZ_EXPORT_FORMAT_PKCS7
     * @type {Integer (UInt32)}
     */
    static PKCS7 => 3

    /**
     * Native name: CRYPTUI_WIZ_EXPORT_FORMAT_BASE64
     * @type {Integer (UInt32)}
     */
    static BASE64 => 4

    /**
     * Native name: CRYPTUI_WIZ_EXPORT_FORMAT_CRL
     * @type {Integer (UInt32)}
     */
    static CRL => 6

    /**
     * Native name: CRYPTUI_WIZ_EXPORT_FORMAT_CTL
     * @type {Integer (UInt32)}
     */
    static CTL => 7
}
