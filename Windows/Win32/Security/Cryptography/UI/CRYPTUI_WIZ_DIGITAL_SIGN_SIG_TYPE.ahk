#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
class CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE extends Win32Enum {

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_COMMERCIAL
     * @type {Integer (UInt32)}
     */
    static COMMERCIAL => 1

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_INDIVIDUAL
     * @type {Integer (UInt32)}
     */
    static INDIVIDUAL => 2
}
