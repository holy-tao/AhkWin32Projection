#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Passed to the PFXExportCertStoreEx function as pvPara when the PKCS12_EXPORT_PBES2_PARAMS flag is set for dwFlags to provide information about the encryption algorithm to use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-pkcs12_pbes2_export_params
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PKCS12_PBES2_EXPORT_PARAMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If the **PKCS12_PROTECT_TO_DOMAIN_SIDS** flag is set for _dwFlags_ when calling the [PFXExportCertStoreEx](/windows/win32/api/wincrypt/nf-wincrypt-pfxexportcertstoreex) function, you can set this field to an **NCRYPT_DESCRIPTOR_HANDLE** value. See the _pvPara_ description in the [PFXExportCertStoreEx](/windows/win32/api/wincrypt/nf-wincrypt-pfxexportcertstoreex) for more information.
     * @type {Pointer<Void>}
     */
    hNcryptDescriptor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The designation of the password-based encryption algorithm to use. 
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | **PKCS12_PBES2_ALG_AES256_SHA256**</br>AES256-SHA256 | AES256 will be used for key/certificate encryption, and SHA256 will be used for KDF2, and MacData hashing. |
     * @type {Pointer<Ptr>}
     */
    pwszPbes2Alg {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
