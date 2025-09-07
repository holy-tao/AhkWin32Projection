#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Contains information about the PVK file that contains the certificates used by the CryptUIWizDigitalSign function.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_cert_pvk_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO extends Win32Struct
{
    static sizeof => 32

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
     * A pointer to a null-terminated Unicode string that contains the path and file named of the file that contains the signing certificates.
     * @type {PWSTR}
     */
    pwszSigningCertFileName{
        get {
            if(!this.HasProp("__pwszSigningCertFileName"))
                this.__pwszSigningCertFileName := PWSTR(this.ptr + 8)
            return this.__pwszSigningCertFileName
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwPvkChoice {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO>}
     */
    pPvkFileInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<CRYPT_KEY_PROV_INFO>}
     */
    pPvkProvInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
