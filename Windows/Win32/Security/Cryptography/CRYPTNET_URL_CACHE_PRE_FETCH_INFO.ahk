#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains update information used by the Cryptnet URL Cache (CUC) service to maintain a URL cache entry.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cryptnet_url_cache_pre_fetch_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPTNET_URL_CACHE_PRE_FETCH_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies the type of object represented by the URL.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTNET_URL_CACHE_PRE_FETCH_NONE"></a><a id="cryptnet_url_cache_pre_fetch_none"></a><dl>
     * <dt><b>CRYPTNET_URL_CACHE_PRE_FETCH_NONE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prefetch information does not yet exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTNET_URL_CACHE_PRE_FETCH_BLOB"></a><a id="cryptnet_url_cache_pre_fetch_blob"></a><dl>
     * <dt><b>CRYPTNET_URL_CACHE_PRE_FETCH_BLOB</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is a memory <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTNET_URL_CACHE_PRE_FETCH_CRL"></a><a id="cryptnet_url_cache_pre_fetch_crl"></a><dl>
     * <dt><b>CRYPTNET_URL_CACHE_PRE_FETCH_CRL</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTNET_URL_CACHE_PRE_FETCH_OCSP"></a><a id="cryptnet_url_cache_pre_fetch_ocsp"></a><dl>
     * <dt><b>CRYPTNET_URL_CACHE_PRE_FETCH_OCSP</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">online certificate status protocol</a> (OCSP) response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRYPTNET_URL_CACHE_PRE_FETCH_AUTOROOT_CAB"></a><a id="cryptnet_url_cache_pre_fetch_autoroot_cab"></a><dl>
     * <dt><b>CRYPTNET_URL_CACHE_PRE_FETCH_AUTOROOT_CAB</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is a CAB file.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwObjectType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value that specifies the status of a prefetch attempt.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="S_OK"></a><a id="s_ok"></a><dl>
     * <dt><b>S_OK</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The prefetch is pending.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_MEDIA_OFFLINE"></a><a id="error_media_offline"></a><dl>
     * <dt><b>ERROR_MEDIA_OFFLINE</b></dt>
     * <dt>4304L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CRL prefetch is disabled because the OCSP service is offline or unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_FILE_OFFLINE"></a><a id="error_file_offline"></a><dl>
     * <dt><b>ERROR_FILE_OFFLINE</b></dt>
     * <dt>4350L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The prefetch content is unchanged.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_INVALID_DATA"></a><a id="error_invalid_data"></a><dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * <dt>13L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The prefetch content is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Other_values"></a><a id="other_values"></a><a id="OTHER_VALUES"></a><dl>
     * <dt><b>Other values</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service is unable to retrieve prefetch content.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This parameter is not used. It must be zero.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains a date and time whose meaning depends on <b>dwObjectType</b>. For a CRL, this indicates when the CRL was published. For an OCSP response, this indicates when the indicated status is known to be correct.
     * @type {FILETIME}
     */
    ThisUpdateTime{
        get {
            if(!this.HasProp("__ThisUpdateTime"))
                this.__ThisUpdateTime := FILETIME(16, this)
            return this.__ThisUpdateTime
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains a date and time whose meaning depends on <b>dwObjectType</b>. For a CRL, this indicates the next scheduled update for the CRL. For an OCSP response, this indicates when newer information will be available for the certificate status.
     * 
     * This is effectively an expiry date for the object. A value of zero indicates that the information has no expiration date.
     * @type {FILETIME}
     */
    NextUpdateTime{
        get {
            if(!this.HasProp("__NextUpdateTime"))
                this.__NextUpdateTime := FILETIME(24, this)
            return this.__NextUpdateTime
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies the time interval before expiry that a new CRL will be published. This value can be zero.
     * 
     * This value is based on a nonstandard CRL extension with the following <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID).
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_CRL_NEXT_PUBLISH"></a><a id="szoid_crl_next_publish"></a><a id="SZOID_CRL_NEXT_PUBLISH"></a><dl>
     * <dt><b>szOID_CRL_NEXT_PUBLISH</b></dt>
     * <dt>1.3.6.1.4.1.311.21.4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NextPublishTime
     * 
     * </td>
     * </tr>
     * </table>
     * @type {FILETIME}
     */
    PublishTime{
        get {
            if(!this.HasProp("__PublishTime"))
                this.__PublishTime := FILETIME(32, this)
            return this.__PublishTime
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
