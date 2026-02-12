#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The memory <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> specified by the <b>pSignBlobInfo</b> member is to be signed.
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_BLOB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTUI_WIZ_DIGITAL_SIGN_SUBJECT_NONE => 0
}
