#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_KEY_SPEC.ahk" { CERT_KEY_SPEC }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to contain information about a CNG key.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncryptkeyname
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCryptKeyName {
    #StructPack 8

    /**
     * A pointer to a null-terminated Unicode string that contains the name of the key.
     */
    pszName : PWSTR

    /**
     * A pointer to a null-terminated Unicode string that contains the identifier of the cryptographic algorithm that the key was created with. This can be one of the standard <a href="https://docs.microsoft.com/windows/desktop/SecCNG/cng-algorithm-identifiers">CNG Algorithm Identifiers</a> or the identifier for another registered algorithm.
     */
    pszAlgid : PWSTR

    dwLegacyKeySpec : CERT_KEY_SPEC

    /**
     * A set of flags that provide more information about the key. This can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NCRYPT_MACHINE_KEY_FLAG"></a><a id="ncrypt_machine_key_flag"></a><dl>
     * <dt><b>NCRYPT_MACHINE_KEY_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key applies to the local computer. If this flag is not present, the key applies to the current user.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}
