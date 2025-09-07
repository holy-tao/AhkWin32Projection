#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used with the CRYPTUI_WIZ_DIGITAL_SIGN_INFO structure to contain extended information about a signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_extended_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO extends Win32Struct
{
    static sizeof => 64

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
     * 
     * @type {Integer}
     */
    dwAttrFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the description of the subject of the signature.
     * @type {Pointer<Ptr>}
     */
    pwszDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the location from which to get more information about the file. This information will be displayed when the file is downloaded.
     * @type {Pointer<Ptr>}
     */
    pwszMoreInfoLocation {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated ANSI string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of the hash algorithm used for the signature. The default value is <b>NULL</b>, which indicates that the SHA-1 hash algorithm is used.
     * @type {Pointer<Ptr>}
     */
    pszHashAlg {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the string displayed on the digital signature wizard page. The string should prompt the user to select a certificate for a specific purpose.
     * @type {Pointer<Ptr>}
     */
    pwszSigningCertDisplayString {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A handle to an additional certificate store that will be added to the signature.
     * @type {Pointer<Ptr>}
     */
    hAdditionalCertStore {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure that contains authenticated attributes supplied by the user.
     * @type {Pointer<CRYPT_ATTRIBUTES>}
     */
    psAuthenticated {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure that contains unauthenticated attributes supplied by the user.
     * @type {Pointer<CRYPT_ATTRIBUTES>}
     */
    psUnauthenticated {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
