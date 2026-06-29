#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ROOT_INFO_LUID.ahk" { ROOT_INFO_LUID }

/**
 * Contains the smart card and session IDs associated with a certificate context.
 * @remarks
 * The <b>luid</b> member value comes from the <b>AuthenticationId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_statistics">TOKEN_STATISTICS</a> structure retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a> function.
 * 
 * A certificate context can include an array of multiple <b>CRYPT_SMART_CARD_ROOT_INFO</b> structures, one for each <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">locally unique identifier</a> (<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a>) that the certificate propagation service has added to a root certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_smart_card_root_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_SMART_CARD_ROOT_INFO {
    #StructPack 4

    /**
     * An array of bytes that specify the smart card IDs retrieved by using the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptgetprovparam">CryptGetProvParam</a> function with the <i>dwParam</i> parameter set to <b>PP_SMARTCARD_GUID</b>.
     */
    rgbCardID : Int8[16]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-root_info_luid">ROOT_INFO_LUID</a> structure that specifies a session authentication ID from an access token.
     */
    luid : ROOT_INFO_LUID

}
