#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
class CRYPTUI_WIZ_DIGITAL_SIGN_PVK_OPTION extends Win32Enum {

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE
     * @type {Integer (UInt32)}
     */
    static FILE => 1

    /**
     * Native name: CRYPTUI_WIZ_DIGITAL_SIGN_PVK_PROV
     * @type {Integer (UInt32)}
     */
    static PROV => 2
}
