#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\CRYPT_ATTRIBUTES.ahk" { CRYPT_ATTRIBUTES }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE.ahk" { CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE }
#Import "..\HCERTSTORE.ahk" { HCERTSTORE }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used with the CRYPTUI_WIZ_DIGITAL_SIGN_INFO structure to contain extended information about a signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_digital_sign_extended_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    dwSize : UInt32

    dwAttrFlags : CRYPTUI_WIZ_DIGITAL_SIGN_SIG_TYPE

    /**
     * A pointer to a null-terminated Unicode string that contains the description of the subject of the signature.
     */
    pwszDescription : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the location from which to get more information about the file. This information will be displayed when the file is downloaded.
     */
    pwszMoreInfoLocation : PWSTR

    /**
     * A pointer to a null-terminated ANSI string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of the hash algorithm used for the signature. The default value is <b>NULL</b>, which indicates that the SHA-1 hash algorithm is used.
     */
    pszHashAlg : PSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the string displayed on the digital signature wizard page. The string should prompt the user to select a certificate for a specific purpose.
     */
    pwszSigningCertDisplayString : PWSTR

    /**
     * A handle to an additional certificate store that will be added to the signature.
     */
    hAdditionalCertStore : HCERTSTORE

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure that contains authenticated attributes supplied by the user.
     */
    psAuthenticated : CRYPT_ATTRIBUTES.Ptr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attributes">CRYPT_ATTRIBUTES</a> structure that contains unauthenticated attributes supplied by the user.
     */
    psUnauthenticated : CRYPT_ATTRIBUTES.Ptr

}
