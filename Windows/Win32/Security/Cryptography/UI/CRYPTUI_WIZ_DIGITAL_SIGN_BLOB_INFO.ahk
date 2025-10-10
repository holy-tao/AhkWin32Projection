#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the public key BLOB used by the CryptUIWizDigitalSign function.
 * @see https://docs.microsoft.com/windows/win32/api//cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_blob_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO extends Win32Struct
{
    static sizeof => 40

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
     * A pointer to a <b>GUID</b> that contains the GUID that identifies the Session Initiation Protocol (SIP) functions to load.
     * @type {Pointer<Guid>}
     */
    pGuidSubject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> pointed to by the <b>pbBlob</b> member.
     * @type {Integer}
     */
    cbBlob {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to the BLOB to sign.
     * @type {Pointer<Byte>}
     */
    pbBlob {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the display name of the BLOB to sign.
     * @type {Pointer<Char>}
     */
    pwszDisplayName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
