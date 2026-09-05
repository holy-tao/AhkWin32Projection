#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
class CRYPTUI_WIZ_DIGITAL_ADDITIONAL_CERT_CHOICE extends Win32Enum {

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN
     * @type {Integer (UInt32)}
     */
    static SIGN_ADD_CHAIN => 1

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_ADD_CHAIN_NO_ROOT
     * @type {Integer (UInt32)}
     */
    static SIGN_ADD_CHAIN_NO_ROOT => 2

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_ADD_NONE
     * @type {Integer (UInt32)}
     */
    static SIGN_ADD_NONE => 0
}
