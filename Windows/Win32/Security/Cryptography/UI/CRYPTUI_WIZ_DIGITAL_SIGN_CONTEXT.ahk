#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used with the CryptUIWizDigitalSign function to contain information about a BLOB.
 * @see https://docs.microsoft.com/windows/win32/api//cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_context
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of the BLOB pointed to by the <b>pbBlob</b> member.
     * @type {Integer}
     */
    cbBlob {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the signed BLOB.
     * @type {Pointer<Integer>}
     */
    pbBlob {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
