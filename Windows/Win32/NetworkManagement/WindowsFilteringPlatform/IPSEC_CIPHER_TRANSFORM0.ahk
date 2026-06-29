#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_CIPHER_TYPE.ahk" { IPSEC_CIPHER_TYPE }
#Import ".\IPSEC_CIPHER_TRANSFORM_ID0.ahk" { IPSEC_CIPHER_TRANSFORM_ID0 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Is used to store encryption specific information for an SA transform in an IPsec quick mode policy.
 * @remarks
 * <b>IPSEC_CIPHER_TRANSFORM0</b> is a specific implementation of IPSEC_CIPHER_TRANSFORM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_cipher_transform0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_CIPHER_TRANSFORM0 {
    #StructPack 8

    /**
     * The identifier of the encryption algorithm as specified by [IPSEC_CIPHER_TRANSFORM_ID0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_cipher_transform_id0).
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TRANSFORM_ID_CBC_DES"></a><a id="ipsec_cipher_transform_id_cbc_des"></a><dl>
     * <dt><b>IPSEC_CIPHER_TRANSFORM_ID_CBC_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_CIPHER_TYPE_DES,
     *    IPSEC_CIPHER_CONFIG_CBC_DES
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TRANSFORM_ID_CBC_3DES"></a><a id="ipsec_cipher_transform_id_cbc_3des"></a><dl>
     * <dt><b>IPSEC_CIPHER_TRANSFORM_ID_CBC_3DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_CIPHER_TYPE_3DES,
     *    IPSEC_CIPHER_CONFIG_CBC_3DES
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TRANSFORM_ID_AES_128"></a><a id="ipsec_cipher_transform_id_aes_128"></a><dl>
     * <dt><b>IPSEC_CIPHER_TRANSFORM_ID_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_CIPHER_TYPE_AES_128,
     *    IPSEC_CIPHER_CONFIG_CBC_AES_128
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TRANSFORM_ID_AES_192"></a><a id="ipsec_cipher_transform_id_aes_192"></a><dl>
     * <dt><b>IPSEC_CIPHER_TRANSFORM_ID_AES_192</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_CIPHER_TYPE_AES_192,
     *    IPSEC_CIPHER_CONFIG_CBC_AES_192
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TRANSFORM_ID_AES_256_"></a><a id="ipsec_cipher_transform_id_aes_256_"></a><dl>
     * <dt><b>IPSEC_CIPHER_TRANSFORM_ID_AES_256 </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_CIPHER_TYPE_AES_256,
     *    IPSEC_CIPHER_CONFIG_CBC_AES_256
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TRANSFORM_ID_GCM_AES_128_"></a><a id="ipsec_cipher_transform_id_gcm_aes_128_"></a><dl>
     * <dt><b>IPSEC_CIPHER_TRANSFORM_ID_GCM_AES_128 </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_CIPHER_TYPE_AES_128,
     *    IPSEC_CIPHER_CONFIG_GCM_AES_128
     * 
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TRANSFORM_ID_GCM_AES_192"></a><a id="ipsec_cipher_transform_id_gcm_aes_192"></a><dl>
     * <dt><b>IPSEC_CIPHER_TRANSFORM_ID_GCM_AES_192</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_CIPHER_TYPE_AES_192,
     *    IPSEC_CIPHER_CONFIG_GCM_AES_192
     * 
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TRANSFORM_ID_GCM_AES_256"></a><a id="ipsec_cipher_transform_id_gcm_aes_256"></a><dl>
     * <dt><b>IPSEC_CIPHER_TRANSFORM_ID_GCM_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_CIPHER_TYPE_AES_256,
     *    IPSEC_CIPHER_CONFIG_GCM_AES_256
     * 
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     */
    cipherTransformId : IPSEC_CIPHER_TRANSFORM_ID0

    /**
     * Unused parameter, always set this to <b>NULL</b>.
     */
    cryptoModuleId : Guid.Ptr

}
