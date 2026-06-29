#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_AUTH_TYPE.ahk" { IPSEC_AUTH_TYPE }

/**
 * Is used to uniquely identify the hash algorithm used in an IPsec security association (SA).
 * @remarks
 * <b>IPSEC_AUTH_TRANSFORM_ID0</b> is a specific implementation of IPSEC_AUTH_TRANSFORM_ID. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_auth_transform_id0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_AUTH_TRANSFORM_ID0 {
    #StructPack 4

    /**
     * The type of the hash algorithm as specified by [IPSEC_AUTH_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_auth_type).
     */
    authType : IPSEC_AUTH_TYPE

    /**
     * Additional configuration information for the IPsec SA hash algorithm as specified by a <b>IPSEC_AUTH_CONFIG</b> which maps to a <b>UINT8</b>.
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>IPsec authentication configuration</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_CONFIG_HMAC_MD5_96"></a><a id="ipsec_auth_config_hmac_md5_96"></a><dl>
     * <dt><b>IPSEC_AUTH_CONFIG_HMAC_MD5_96</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * HMAC (Hash Message Authentication Code) secret key authentication algorithm.
     * 
     * MD5 (Message Digest) data integrity and data origin authentication  algorithm.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_CONFIG_HMAC_SHA_1_96"></a><a id="ipsec_auth_config_hmac_sha_1_96"></a><dl>
     * <dt><b>IPSEC_AUTH_CONFIG_HMAC_SHA_1_96</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * HMAC secret key authentication algorithm. 
     * 
     * SHA-1 (Secure Hash Algorithm) data integrity and data origin authentication  algorithm.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_CONFIG_HMAC_SHA_256_128"></a><a id="ipsec_auth_config_hmac_sha_256_128"></a><dl>
     * <dt><b>IPSEC_AUTH_CONFIG_HMAC_SHA_256_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  HMAC secret key authentication algorithm. 
     * 
     * SHA-256 data integrity and data origin authentication  algorithm.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_CONFIG_GCM_AES_128"></a><a id="ipsec_auth_config_gcm_aes_128"></a><dl>
     * <dt><b>IPSEC_AUTH_CONFIG_GCM_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  GCM (Galois Counter Mode) secret key authentication algorithm. 
     * 
     * AES(Advanced Encryption Standard) data integrity and data origin authentication  algorithm, with 128-bit key.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_CONFIG_GCM_AES_192"></a><a id="ipsec_auth_config_gcm_aes_192"></a><dl>
     * <dt><b>IPSEC_AUTH_CONFIG_GCM_AES_192</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  GCM secret key authentication algorithm. 
     * 
     * AES data integrity and data origin authentication  algorithm, with 192-bit key.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_CONFIG_GCM_AES_256"></a><a id="ipsec_auth_config_gcm_aes_256"></a><dl>
     * <dt><b>IPSEC_AUTH_CONFIG_GCM_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  GCM secret key authentication algorithm. 
     * 
     * AES data integrity and data origin authentication  algorithm, with 256-bit key.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     */
    authConfig : Int8

}
