#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies information used to uniquely identify the encryption algorithm used in an IPsec SA.
 * @remarks
 * 
 * <b>IPSEC_CIPHER_TRANSFORM_ID0</b> is a specific implementation of IPSEC_CIPHER_TRANSFORM_ID. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ns-ipsectypes-ipsec_cipher_transform_id0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_CIPHER_TRANSFORM_ID0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The type of the encryption algorithm as specified by [IPSEC_CIPHER_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_cipher_type).
     * @type {Integer}
     */
    cipherType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Additional configuration information for the encryption algorithm as specified by <b>IPSEC_CIPHER_CONFIG</b> which maps to a <b>UINT8</b>.
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>IPsec encryption configuration</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_CONFIG_CBC_DES"></a><a id="ipsec_cipher_config_cbc_des"></a><dl>
     * <dt><b>IPSEC_CIPHER_CONFIG_CBC_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DES (Data Encryption Standard) algorithm. 
     * 
     * CBC (Cipher Block Chaining) mode of operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_CONFIG_CBC_3DES"></a><a id="ipsec_cipher_config_cbc_3des"></a><dl>
     * <dt><b>IPSEC_CIPHER_CONFIG_CBC_3DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 3DES algorithm. 
     * 
     * CBC mode of operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_CONFIG_CBC_AES_128"></a><a id="ipsec_cipher_config_cbc_aes_128"></a><dl>
     * <dt><b>IPSEC_CIPHER_CONFIG_CBC_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-128 (Advanced Encryption Standard) algorithm. 
     * 
     * CBC mode of operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_CONFIG_CBC_AES_192"></a><a id="ipsec_cipher_config_cbc_aes_192"></a><dl>
     * <dt><b>IPSEC_CIPHER_CONFIG_CBC_AES_192</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-192 algorithm. 
     * 
     * CBC mode of operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_CONFIG_CBC_AES_256"></a><a id="ipsec_cipher_config_cbc_aes_256"></a><dl>
     * <dt><b>IPSEC_CIPHER_CONFIG_CBC_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-256 algorithm. 
     * 
     * CBC mode of operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_CONFIG_GCM_AES_128"></a><a id="ipsec_cipher_config_gcm_aes_128"></a><dl>
     * <dt><b>IPSEC_CIPHER_CONFIG_GCM_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-128 algorithm. 
     * 
     * GCM (Galois Counter Mode) mode of operation.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_CONFIG_GCM_AES_192"></a><a id="ipsec_cipher_config_gcm_aes_192"></a><dl>
     * <dt><b>IPSEC_CIPHER_CONFIG_GCM_AES_192</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-192 algorithm. 
     * 
     * GCM (Galois Counter Mode) mode of operation.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_CONFIG_GCM_AES_256"></a><a id="ipsec_cipher_config_gcm_aes_256"></a><dl>
     * <dt><b>IPSEC_CIPHER_CONFIG_GCM_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-256 algorithm.
     * 
     * GCM (Galois Counter Mode) mode of operation.
     * 
     * <div class="alert"><b>Note</b>  Available only on Windows Server 2008, Windows Vista with SP1, and later.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    cipherConfig {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
