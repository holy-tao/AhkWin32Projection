#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_AUTH_TRANSFORM_ID0.ahk

/**
 * Specifies hash specific information for an SA transform.
 * @remarks
 * <b>IPSEC_AUTH_TRANSFORM0</b> is a specific implementation of IPSEC_AUTH_TRANSFORM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_auth_transform0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_AUTH_TRANSFORM0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The identifier of the hash algorithm as specified by [IPSEC_AUTH_TRANSFORM_ID0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_auth_transform_id0).
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_TRANSFORM_ID_HMAC_MD5_96"></a><a id="ipsec_auth_transform_id_hmac_md5_96"></a><dl>
     * <dt><b>IPSEC_AUTH_TRANSFORM_ID_HMAC_MD5_96</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_AUTH_MD5,
     *    IPSEC_AUTH_CONFIG_HMAC_MD5_96
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_TRANSFORM_ID_HMAC_SHA_1_96"></a><a id="ipsec_auth_transform_id_hmac_sha_1_96"></a><dl>
     * <dt><b>IPSEC_AUTH_TRANSFORM_ID_HMAC_SHA_1_96</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_AUTH_SHA_1,
     *    IPSEC_AUTH_CONFIG_HMAC_SHA_1_96
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_TRANSFORM_ID_HMAC_SHA_256_128"></a><a id="ipsec_auth_transform_id_hmac_sha_256_128"></a><dl>
     * <dt><b>IPSEC_AUTH_TRANSFORM_ID_HMAC_SHA_256_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_AUTH_SHA_256,
     *    IPSEC_AUTH_CONFIG_HMAC_SHA_256_128
     * 
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_TRANSFORM_ID_GCM_AES_128"></a><a id="ipsec_auth_transform_id_gcm_aes_128"></a><dl>
     * <dt><b>IPSEC_AUTH_TRANSFORM_ID_GCM_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_AUTH_AES_128,
     *    IPSEC_AUTH_CONFIG_GCM_AES_128
     * 
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_TRANSFORM_ID_GCM_AES_192"></a><a id="ipsec_auth_transform_id_gcm_aes_192"></a><dl>
     * <dt><b>IPSEC_AUTH_TRANSFORM_ID_GCM_AES_192</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_AUTH_AES_192,
     *    IPSEC_AUTH_CONFIG_GCM_AES_192
     * 
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_AUTH_TRANSFORM_ID_GCM_AES_256"></a><a id="ipsec_auth_transform_id_gcm_aes_256"></a><dl>
     * <dt><b>IPSEC_AUTH_TRANSFORM_ID_GCM_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *    IPSEC_AUTH_AES_256,
     *    IPSEC_AUTH_CONFIG_GCM_AES_256
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {IPSEC_AUTH_TRANSFORM_ID0}
     */
    authTransformId{
        get {
            if(!this.HasProp("__authTransformId"))
                this.__authTransformId := IPSEC_AUTH_TRANSFORM_ID0(this.ptr + 0)
            return this.__authTransformId
        }
    }

    /**
     * Unused parameter, always set this to <b>NULL</b>.
     * @type {Pointer<Guid>}
     */
    cryptoModuleId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
