#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ALG_ID.ahk" { ALG_ID }

/**
 * The SCHANNEL_ALG structure contains algorithm and key size information. It is used as the structure passed as pbData in CryptSetKeyParam when dwParam is set to KP_SCHANNEL_ALG.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-schannel_alg
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SCHANNEL_ALG {
    #StructPack 4

    /**
     * Indicates the use of derived keys. The following values can be used. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCHANNEL_MAC_KEY"></a><a id="schannel_mac_key"></a><dl>
     * <dt><b>SCHANNEL_MAC_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Derive keys to create or verify SSL MAC signatures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCHANNEL_ENC_KEY"></a><a id="schannel_enc_key"></a><dl>
     * <dt><b>SCHANNEL_ENC_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Derive keys to encrypt or decrypt data.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwUse : UInt32

    /**
     * Algorithms used with the derived keys. Note that no algorithm will be specified unless earlier obtained from the CSP by enumeration. 
     * 
     * 
     * 
     * 
     * SCHANNEL_MAC_KEYs can be either MD5 or SHA.
     * 
     * SCHANNEL_ENC_KEYs can be RC4, DES, 3DES, or RC2.
     */
    Algid : ALG_ID

    /**
     * Size in bits of the derived keys.
     */
    cBits : UInt32

    /**
     * This flag can be set to INTERNATIONAL_USAGE (0x00000001), indicating that derived keys must follow SSL export rules.
     */
    dwFlags : UInt32

    /**
     * Reserved for future use. Should be set to zero.
     */
    dwReserved : UInt32

}
