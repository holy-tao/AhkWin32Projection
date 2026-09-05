#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
class CRYPTUI_WIZ_DIGITAL_SIGN extends Win32Enum {

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_CERT
     * @type {Integer (UInt32)}
     */
    static CERT => 1

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_STORE
     * @type {Integer (UInt32)}
     */
    static STORE => 2

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_PVK
     * @type {Integer (UInt32)}
     */
    static PVK => 3

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0
}
