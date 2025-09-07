#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Indicates the success or failure of the corresponding online certificate status protocol (OCSP) request. For successful requests, it contains the type and value of response information.
 * @remarks
 * OCSP applications can encode or decode this structure by using <b>X509_ASN_ENCODING</b> or <b>PKCS_7_ASN_ENCODING</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_response_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class OCSP_RESPONSE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A value that indicates the processing status of the corresponding request. If the status is anything other than <b>OCSP_SUCCESSFUL_RESPONSE</b>, <b>pszObjId</b> and <b>Value</b> are not set.
     * 
     * 
     * This member can be one of the following possible values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_SUCCESSFUL_RESPONSE"></a><a id="ocsp_successful_response"></a><dl>
     * <dt><b>OCSP_SUCCESSFUL_RESPONSE</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The response has valid confirmations.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_MALFORMED_REQUEST_RESPONSE"></a><a id="ocsp_malformed_request_response"></a><dl>
     * <dt><b>OCSP_MALFORMED_REQUEST_RESPONSE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request received does not conform to OCSP syntax.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_INTERNAL_ERROR_RESPONSE"></a><a id="ocsp_internal_error_response"></a><dl>
     * <dt><b>OCSP_INTERNAL_ERROR_RESPONSE</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The responder encountered an internal error. The request should be resent to a different responder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_TRY_LATER_RESPONSE"></a><a id="ocsp_try_later_response"></a><dl>
     * <dt><b>OCSP_TRY_LATER_RESPONSE</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The responder service is operational but temporarily unable to respond.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is not used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_SIG_REQUIRED_RESPONSE"></a><a id="ocsp_sig_required_response"></a><dl>
     * <dt><b>OCSP_SIG_REQUIRED_RESPONSE</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Before the responder service can respond, it requires that the client sign the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_UNAUTHORIZED_RESPONSE"></a><a id="ocsp_unauthorized_response"></a><dl>
     * <dt><b>OCSP_UNAUTHORIZED_RESPONSE</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client is not authorized to request a response from this responder service.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a string that identifies the type of data in <b>Value</b>.
     * 
     * 
     * The following table lists possible values for <b>pszObjId</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="szOID_PKIX_OCSP_BASIC_SIGNED_RESPONSE"></a><a id="szoid_pkix_ocsp_basic_signed_response"></a><a id="SZOID_PKIX_OCSP_BASIC_SIGNED_RESPONSE"></a><dl>
     * <dt><b>szOID_PKIX_OCSP_BASIC_SIGNED_RESPONSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 1.3.6.1.5.5.7.48.1.1
     * 
     * </td>
     * </tr>
     * </table>
     * @type {PSTR}
     */
    pszObjId{
        get {
            if(!this.HasProp("__pszObjId"))
                this.__pszObjId := PSTR(this.ptr + 8)
            return this.__pszObjId
        }
    }

    /**
     * An array of bytes that contain data encoded by using <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER), as specified by <b>pszObjId</b>.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Value{
        get {
            if(!this.HasProp("__Value"))
                this.__Value := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__Value
        }
    }
}
