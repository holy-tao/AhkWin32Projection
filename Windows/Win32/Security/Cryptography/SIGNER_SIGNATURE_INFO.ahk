#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_ATTRIBUTES.ahk" { CRYPT_ATTRIBUTES }
#Import ".\SIGNER_SIGNATURE_ATTRIBUTE_CHOICE.ahk" { SIGNER_SIGNATURE_ATTRIBUTE_CHOICE }
#Import ".\SIGNER_ATTR_AUTHCODE.ahk" { SIGNER_ATTR_AUTHCODE }
#Import ".\ALG_ID.ahk" { ALG_ID }

/**
 * Contains information about a digital signature.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-signature-info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_SIGNATURE_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The hash algorithm used for the digital signature.
     */
    algidHash : ALG_ID

    /**
     * Specifies whether the signature has [*Authenticode*](../secgloss/a-gly.md) attributes. This member can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                      | Meaning                                                                                                                                   |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="SIGNER_AUTHCODE_ATTR"></span><span id="signer_authcode_attr"></span><dl> <dt>**SIGNER\_AUTHCODE\_ATTR**</dt> <dt>1</dt> </dl> | The signature has [*Authenticode*](../secgloss/a-gly.md) attributes.<br/>           |
     * | <span id="SIGNER_NO_ATTR"></span><span id="signer_no_attr"></span><dl> <dt>**SIGNER\_NO\_ATTR**</dt> <dt>0</dt> </dl>                   | The signature does not have [*Authenticode*](../secgloss/a-gly.md) attributes.<br/> |
     */
    dwAttrChoice : SIGNER_SIGNATURE_ATTRIBUTE_CHOICE

    pAttrAuthcode : SIGNER_ATTR_AUTHCODE.Ptr

    /**
     * Authenticated user-supplied attributes added to the digital signature.
     */
    psAuthenticated : CRYPT_ATTRIBUTES.Ptr

    /**
     * Unauthenticated user-supplied attributes added to the digital signature.
     */
    psUnauthenticated : CRYPT_ATTRIBUTES.Ptr

}
