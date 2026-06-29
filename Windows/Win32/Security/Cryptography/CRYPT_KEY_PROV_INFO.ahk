#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_KEY_PROV_PARAM.ahk" { CRYPT_KEY_PROV_PARAM }
#Import ".\CRYPT_KEY_FLAGS.ahk" { CRYPT_KEY_FLAGS }

/**
 * The CRYPT_KEY_PROV_INFO structure contains information about a key container within a cryptographic service provider (CSP).
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_key_prov_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_KEY_PROV_INFO {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the key container.
     * 
     * When the <b>dwProvType</b> member is zero, this string contains the name of a key within a CNG key storage provider. This string is passed as the <i>pwszKeyName</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptopenkey">NCryptOpenKey</a> function.
     */
    pwszContainerName : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the CSP.
     * 
     * When the <b>dwProvType</b> member is zero, this string contains the name of a CNG key storage provider. This string is passed as the <i>pwszProviderName</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptopenstorageprovider">NCryptOpenStorageProvider</a> function.
     */
    pwszProvName : PWSTR

    /**
     * Specifies the CSP type. This can be zero or one of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/cryptographic-provider-types">Cryptographic Provider Types</a>. 
     * 
     * 
     * If this member is zero, the key container is one of the CNG key storage providers.
     */
    dwProvType : UInt32

    dwFlags : CRYPT_KEY_FLAGS

    /**
     * The number of elements in the <b>rgProvParam</b> array.
     * 
     * When the <b>dwProvType</b> member is zero, this member is not used and must be zero.
     */
    cProvParam : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_key_prov_param">CRYPT_KEY_PROV_PARAM</a> structures that contain the parameters for the key container. The <b>cProvParam</b> member contains the number of elements in this array.
     * 
     * When the <b>dwProvType</b> member is zero, this member is not used and must be <b>NULL</b>.
     */
    rgProvParam : CRYPT_KEY_PROV_PARAM.Ptr

    /**
     * The specification of the private key to retrieve. 
     * 
     * 
     * The following values are defined for the default provider.
     * 						
     * 
     * When the <b>dwProvType</b> member is zero, this value is passed as the <i>dwLegacyKeySpec</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptopenkey">NCryptOpenKey</a> function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AT_KEYEXCHANGE"></a><a id="at_keyexchange"></a><dl>
     * <dt><b>AT_KEYEXCHANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keys used to encrypt/decrypt session keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AT_SIGNATURE"></a><a id="at_signature"></a><dl>
     * <dt><b>AT_SIGNATURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keys used to create and verify digital signatures.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwKeySpec : UInt32

}
