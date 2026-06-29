#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Passed to the PFXExportCertStoreEx function as pvPara when the PKCS12_EXPORT_PBES2_PARAMS flag is set for dwFlags to provide information about the encryption algorithm to use.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-pkcs12_pbes2_export_params
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PKCS12_PBES2_EXPORT_PARAMS {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * If the **PKCS12_PROTECT_TO_DOMAIN_SIDS** flag is set for _dwFlags_ when calling the [PFXExportCertStoreEx](/windows/win32/api/wincrypt/nf-wincrypt-pfxexportcertstoreex) function, you can set this field to an **NCRYPT_DESCRIPTOR_HANDLE** value. See the _pvPara_ description in the [PFXExportCertStoreEx](/windows/win32/api/wincrypt/nf-wincrypt-pfxexportcertstoreex) for more information.
     */
    hNcryptDescriptor : IntPtr

    /**
     * The designation of the password-based encryption algorithm to use. 
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | **PKCS12_PBES2_ALG_AES256_SHA256**</br>AES256-SHA256 | AES256 will be used for key/certificate encryption, and SHA256 will be used for KDF2, and MacData hashing. |
     */
    pwszPbes2Alg : PWSTR

}
