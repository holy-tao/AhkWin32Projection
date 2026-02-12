#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The entire certificate  chain will be included in the signature.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_DIGITAL_SIGN extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_DIGITAL_SIGN_CERT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_DIGITAL_SIGN_STORE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_DIGITAL_SIGN_PVK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_DIGITAL_SIGN_NONE => 0
}
