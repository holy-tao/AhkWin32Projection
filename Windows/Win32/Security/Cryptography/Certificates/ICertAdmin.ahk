#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides administration functionality for properly authorized clients.
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-icertadmin
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertAdmin extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertAdmin
     * @type {Guid}
     */
    static IID => Guid("{34df6950-7fb6-11d0-8817-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsValidCertificate", "GetRevocationReason", "RevokeCertificate", "SetRequestAttributes", "SetCertificateExtension", "DenyRequest", "ResubmitRequest", "PublishCRL", "GetCRL", "ImportCertificate"]

    /**
     * Verifies the certificate against the certification authority (CA) key and checks that the certificate has not been revoked. This method was first defined in the ICertAdmin interface.
     * @param {BSTR} strConfig Represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the network name of the Certificate Services server and CANAME is the common name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>IsValidCertificate</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {BSTR} strSerialNumber Specifies a serial number that identifies the certificate to be reviewed. The string must specify the serial number as an even number of hexadecimal digits. If necessary, a zero can be prefixed to the number to produce an even number of digits. No more than one leading zero may be used.
     * @returns {Integer} A pointer to a <b>LONG</b> that receives the disposition value.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-isvalidcertificate
     */
    IsValidCertificate(strConfig, strSerialNumber) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(7, this, "ptr", strConfig, "ptr", strSerialNumber, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * Returns the reason a certificate was revoked. This method was first defined in the ICertAdmin interface.
     * @returns {Integer} A pointer to a variable that will receive the revocation reason.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-getrevocationreason
     */
    GetRevocationReason() {
        result := ComCall(8, this, "int*", &pReason := 0, "HRESULT")
        return pReason
    }

    /**
     * Revokes a certificate either on a specified date or immediately. This method was first defined in the ICertAdmin interface.
     * @param {BSTR} strConfig Represents a valid configuration string for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) server in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the network name of the Certificate Services server and CANAME is the common name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>RevokeCertificate</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {BSTR} strSerialNumber Specifies a serial number that identifies the certificate to be revoked. The string must specify the serial number as an even number of hexadecimal digits. If necessary, a zero can be prefixed to the number to produce an even number of digits. However, no more than one leading zero may be used.
     * @param {Integer} Reason Specifies the reason for the revocation. 
     * 			The following values (defined in Wincrypt.h) are 
     * 			supported reason codes.
     * @param {Float} Date Specifies the date, in Coordinated Universal Time (Greenwich Mean Time), on which the revocation will become effective. The value zero indicates the current Coordinated Universal Time, causing a certificate to be revoked immediately. The value of <i>Date</i> appears in the <b>Effective Revocation Date</b> column of the revoked certificate (in the Certification Authority MMC snap-in).
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-revokecertificate
     */
    RevokeCertificate(strConfig, strSerialNumber, Reason, Date) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(9, this, "ptr", strConfig, "ptr", strSerialNumber, "int", Reason, "double", Date, "HRESULT")
        return result
    }

    /**
     * Sets attributes in the specified pending certificate request. This method was first defined in the ICertAdmin interface.
     * @param {BSTR} strConfig Represents a valid configuration string for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) server in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the network name of the Certificate Services server and CANAME is the common name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>SetRequestAttributes</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} RequestId Specifies the ID of the request receiving the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a>.
     * @param {BSTR} strAttributes Specifies the attribute data. Each attribute is a name-value string pair. The colon character separates the name and value, and a newline character separates multiple name-value pairs, for example:
     * 
     * <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * <i>AttributeName1</i><b>:</b><i>AttributeValue1</i><b>\</b><i>nAttributeName2</i><b>:</b><i>AttributeValue2</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     * <i>AttributeName1</i><b>:</b><i>AttributeValue1</i><b> &amp; </b><i>vbNewLine</i><b> &amp; </b><i>AttributeName2</i><b>:</b><i>AttributeValue2</i>
     * 
     * </td>
     * </tr>
     * </table>
     * There is no set limit to the number of request attributes that may be added to a request.
     * 
     * When Certificate Services parses attribute names, it ignores spaces, hyphens (minus signs), and case. For example, <i>AttributeName1</i>, <i>Attribute Name1</i>, and <i>Attribute-name1</i> are all equivalent. For attribute values, Certificate Services ignores leading and trailing white space.
     * 
     * <div class="alert"><b>Note</b>  The maximum length for an attribute name is 127 non-<b>NULL</b> characters. The maximum length for an attribute value is 4,096 non-<b>NULL</b> characters.</div>
     * <div> </div>
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-setrequestattributes
     */
    SetRequestAttributes(strConfig, RequestId, strAttributes) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strAttributes := strAttributes is String ? BSTR.Alloc(strAttributes).Value : strAttributes

        result := ComCall(10, this, "ptr", strConfig, "int", RequestId, "ptr", strAttributes, "HRESULT")
        return result
    }

    /**
     * Adds a new extension to the certificate issued in response to a certificate request. This method was first defined by the ICertAdmin interface.
     * @param {BSTR} strConfig Represents a valid configuration string for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) server in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the network name of the Certificate Services server and CANAME is the common name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>SetCertificateExtension</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} RequestId Specifies the ID of the certificate request.
     * @param {BSTR} strExtensionName Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for the extension to set. The string must be 31 or fewer non-NULL characters in length.
     * @param {Integer} Type Specifies the type of extension being set. The <i>Type</i> parameter must agree with the data type of the <i>pvarValue</i> parameter. This data type is set in the <b>vt</b> field of the <b>VARIANT</b> structure.
     * @param {Integer} Flags Specifies the flags for the extension being set. If no flag is to be set, use a value of zero. You can combine these flags with a bitwise-<b>OR</b> operation and also with policy private extension flags (the high 8 bits of the EXTENSION_POLICY_MASK field). 
     * 
     * 
     * 
     * 
     * 						
     * 
     * <div class="alert"><b>Note</b>  When the <i>Flags</i> parameter is set to EXTENSION_DISABLE_FLAG, the extension will be disabled in the server log and will not be added to the certificate.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXTENSION_CRITICAL_FLAG"></a><a id="extension_critical_flag"></a><dl>
     * <dt><b>EXTENSION_CRITICAL_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is a critical extension.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXTENSION_DISABLE_FLAG"></a><a id="extension_disable_flag"></a><dl>
     * <dt><b>EXTENSION_DISABLE_FLAG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extension will not be used.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<VARIANT>} pvarValue Specifies the value associated with the extension.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-setcertificateextension
     */
    SetCertificateExtension(strConfig, RequestId, strExtensionName, Type, Flags, pvarValue) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        result := ComCall(11, this, "ptr", strConfig, "int", RequestId, "ptr", strExtensionName, "int", Type, "int", Flags, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * Denies a specified certificate request that is pending.
     * @remarks
     * 
     * Administration tasks use DCOM. Code that calls this interface method as defined in an earlier version of Certadm.h will run on Windows-based servers as long as the client and the server are both running the same Windows operating system.
     * 
     * 
     * 
     * @param {BSTR} strConfig Represents a valid configuration string for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) in the form COMPUTERNAME\CANAME where COMPUTERNAME is the network name of the Certificate Services server and CANAME is the common name of the certification authority as entered during Certificate Services setup. For information about the configuration string, see <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>DenyRequest</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} RequestId Specifies the ID of the pending request to be denied.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-denyrequest
     */
    DenyRequest(strConfig, RequestId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(12, this, "ptr", strConfig, "int", RequestId, "HRESULT")
        return result
    }

    /**
     * Submits the specified certificate request to the policy module for the specified certification authority. This method was first introduced in the ICertAdmin interface.
     * @param {BSTR} strConfig Represents a valid configuration string for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the network name of the Certificate Services server and CANAME is the common name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>ResubmitRequest</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} RequestId Specifies the ID of the request to resubmit.
     * @returns {Integer} A pointer to the disposition of the request.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-resubmitrequest
     */
    ResubmitRequest(strConfig, RequestId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(13, this, "ptr", strConfig, "int", RequestId, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * Sends a request to the Certificate Services certification authority (CA) to publish a new certificate revocation list (CRL). This method was first introduced in the ICertAdmin interface.
     * @param {BSTR} strConfig Represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.<div class="alert"><b>Important</b>  <b>PublishCRL</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Float} Date Specifies the next update value of the CRL in Coordinated Universal Time (Greenwich Mean Time). 
     * If  <i>Date</i> is nonzero, the next update value for the CRL is <i>Date</i>, subject to  rounding or ceiling limits enforced by Certificate Services. If <i>Date</i> is zero, the  next update value of the CRL is calculated from  the default CRL publication period.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-publishcrl
     */
    PublishCRL(strConfig, Date) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(14, this, "ptr", strConfig, "double", Date, "HRESULT")
        return result
    }

    /**
     * Retrieves the current certificate revocation list (CRL) for the Certificate Services certification authority (CA).
     * @param {BSTR} strConfig Represents a valid configuration string for the CA whose CRL you want to retrieve. This string is in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the network name of the Certificate Services server and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>GetCRL</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} Flags Specifies the format of the returned CRL. This parameter can be one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_OUT_BASE64HEADER"></a><a id="cr_out_base64header"></a><dl>
     * <dt><b>CR_OUT_BASE64HEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BASE64 format with begin/end.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_OUT_BASE64"></a><a id="cr_out_base64"></a><dl>
     * <dt><b>CR_OUT_BASE64</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BASE64 format without begin/end.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_OUT_BINARY"></a><a id="cr_out_binary"></a><dl>
     * <dt><b>CR_OUT_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary format.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the CRL.
     * 
     * When using this method, create a variable of <b>BSTR</b> type, set the variable to <b>NULL</b>, and pass the address of this variable in the <i>pbstrCRL</i> parameter. When you have finished using the <b>BSTR</b> variable, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-getcrl
     */
    GetCRL(strConfig, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pstrCRL := BSTR()
        result := ComCall(15, this, "ptr", strConfig, "int", Flags, "ptr", pstrCRL, "HRESULT")
        return pstrCRL
    }

    /**
     * Takes a previously issued certificate and imports it to the certification authority's (CA) database. This method was first defined in the ICertAdmin interface.
     * @param {BSTR} strConfig Represents a valid configuration string for the certification authority in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>ImportCertificate</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {BSTR} strCertificate The binary representation of the certificate being imported.
     * @param {Integer} Flags 
     * @returns {Integer} A pointer to a <b>LONG</b> value that receives the database-assigned request ID for the imported certificate.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin-importcertificate
     */
    ImportCertificate(strConfig, strCertificate, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(16, this, "ptr", strConfig, "ptr", strCertificate, "int", Flags, "int*", &pRequestId := 0, "HRESULT")
        return pRequestId
    }
}
