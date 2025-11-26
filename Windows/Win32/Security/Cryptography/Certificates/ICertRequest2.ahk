#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\ICertRequest.ahk

/**
 * Provide communications between a client or intermediary application and Certificate Services.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertrequest2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertRequest2 extends ICertRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertRequest2
     * @type {Guid}
     */
    static IID => Guid("{a4772988-4a85-4fa9-824e-b5cf5c16405a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIssuedCertificate", "GetErrorMessageText", "GetCAProperty", "GetCAPropertyFlags", "GetCAPropertyDisplayName", "GetFullResponseProperty"]

    /**
     * Retrieves a certificate's disposition by specifying either the request ID or the certificate serial number.
     * @param {BSTR} strConfig Represents a valid configuration string for the Certificate Services server. The string can be either an HTTPS URL for an enrollment server or in the form <i>ComputerName</i><b>\\</b><i>CAName</i>, where <i>ComputerName</i> is the network name of the server, and <i>CAName</i> is the common name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>An HTTPS URL is not supported as an input.
     * @param {Integer} RequestId A <b>LONG</b> value that represents the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a> ID in the Certificates Services database. Use –1 for this value if the serial number (passed in as <i>strSerialNumber</i>) is to be used instead of the request ID.
     * @param {BSTR} strSerialNumber A <b>BSTR</b> value that represents the certificate serial number, as issued by the CA. For <i>strSerialNumber</i> to be used, you must specify a value of –1 for <i>RequestId</i>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest2-getissuedcertificate
     */
    GetIssuedCertificate(strConfig, RequestId, strSerialNumber) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(14, this, "ptr", strConfig, "int", RequestId, "ptr", strSerialNumber, "uint*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * Retrieves the error message text for an HRESULT error code.
     * @param {Integer} hrMessage A value that represents an <b>HRESULT</b> error.
     * @param {Integer} Flags A <b>LONG</b> value that corresponds to one of the values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Zero__0_"></a><a id="zero__0_"></a><a id="ZERO__0_"></a><dl>
     * <dt><b>Zero (0)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The error message text will not have the <b>HRESULT</b> hexadecimal and decimal values appended.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_GEMT_HRESULT_STRING"></a><a id="cr_gemt_hresult_string"></a><dl>
     * <dt><b>CR_GEMT_HRESULT_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The error message text will have the <b>HRESULT</b> hexadecimal and decimal values appended.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} A pointer to the <b>BSTR</b> that represents the error message text for <i>hrMessage</i>. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest2-geterrormessagetext
     */
    GetErrorMessageText(hrMessage, Flags) {
        pstrErrorMessageText := BSTR()
        result := ComCall(15, this, "int", hrMessage, "int", Flags, "ptr", pstrErrorMessageText, "HRESULT")
        return pstrErrorMessageText
    }

    /**
     * Retrieves a property value for the certification authority (CA).
     * @param {BSTR} strConfig Represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * @param {Integer} PropId Specifies the property identifier. For information about this parameter, see the table in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin2-getcaproperty">ICertAdmin2::GetCAProperty</a>.
     * @param {Integer} PropIndex If <i>PropId</i> is indexed, the zero-based index to use when retrieving the property value. If <i>PropId</i> is not indexed, this value is ignored.
     * @param {Integer} PropType Specifies the type of the property, which corresponds to the Type column in the <i>PropId</i> table. The type can be one of the following types.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_LONG"></a><a id="proptype_long"></a><dl>
     * <dt><b>PROPTYPE_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Signed long data
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_DATE"></a><a id="proptype_date"></a><dl>
     * <dt><b>PROPTYPE_DATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Date/time (reserved for future use)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_BINARY"></a><a id="proptype_binary"></a><dl>
     * <dt><b>PROPTYPE_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary data
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_STRING"></a><a id="proptype_string"></a><dl>
     * <dt><b>PROPTYPE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> string data
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Flags The following flags can be used to specify the format of the returned property value; these flags have meaning only for binary data (such as certificates, certificate chains, or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation lists</a>) and is ignored otherwise.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_OUT_BASE64"></a><a id="cv_out_base64"></a><dl>
     * <dt><b>CV_OUT_BASE64</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BASE64 without BEGIN/END
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_OUT_BASE64HEADER"></a><a id="cv_out_base64header"></a><dl>
     * <dt><b>CV_OUT_BASE64HEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BASE64 with BEGIN CERTIFICATE and END CERTIFICATE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_OUT_BASE64REQUESTHEADER"></a><a id="cv_out_base64requestheader"></a><dl>
     * <dt><b>CV_OUT_BASE64REQUESTHEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BASE64 with BEGIN NEW CERTIFICATE REQUEST and END NEW CERTIFICATE REQUEST
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_OUT_BASE64X509CRLHEADER"></a><a id="cv_out_base64x509crlheader"></a><dl>
     * <dt><b>CV_OUT_BASE64X509CRLHEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BASE64 with BEGIN X509 CRL and END X509 CRL
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_OUT_BINARY"></a><a id="cv_out_binary"></a><dl>
     * <dt><b>CV_OUT_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_OUT_HEX"></a><a id="cv_out_hex"></a><dl>
     * <dt><b>CV_OUT_HEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hexadecimal string
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_OUT_HEXADDR"></a><a id="cv_out_hexaddr"></a><dl>
     * <dt><b>CV_OUT_HEXADDR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hexadecimal string with address/offset
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_OUT_HEXASCII"></a><a id="cv_out_hexascii"></a><dl>
     * <dt><b>CV_OUT_HEXASCII</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hexadecimal string with ASCII
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CV_OUT_HEXASCIIADDR"></a><a id="cv_out_hexasciiaddr"></a><dl>
     * <dt><b>CV_OUT_HEXASCIIADDR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hexadecimal string with ASCII and address/offset
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> that receives the requested property value.
     * 
     * When you have finished using the <b>VARIANT</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest2-getcaproperty
     */
    GetCAProperty(strConfig, PropId, PropIndex, PropType, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pvarPropertyValue := VARIANT()
        result := ComCall(16, this, "ptr", strConfig, "int", PropId, "int", PropIndex, "int", PropType, "int", Flags, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
    }

    /**
     * Retrieves the property flags for a certification authority (CA) property.
     * @param {BSTR} strConfig Represents a valid configuration string for the CA in the form <i>ComputerName</i><b>\\</b><i>CAName</i>, where <i>ComputerName</i> is the network name of the Certificate Services server, and <i>CAName</i> is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * @param {Integer} PropId Specifies the property identifier. For information about this parameter, see the table in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin2-getcaproperty">ICertAdmin2::GetCAProperty</a>.
     * @returns {Integer} A pointer to a <b>LONG</b> value that represents the property flags.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest2-getcapropertyflags
     */
    GetCAPropertyFlags(strConfig, PropId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(17, this, "ptr", strConfig, "int", PropId, "int*", &pPropFlags := 0, "HRESULT")
        return pPropFlags
    }

    /**
     * Retrieves the property display name for a certification authority (CA) property.
     * @param {BSTR} strConfig Represents a valid configuration string for the CA in the form <i>ComputerName</i><b>\\</b><i>CAName</i>, where <i>ComputerName</i> is the network name of the Certificate Services server, and <i>CAName</i> is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * @param {Integer} PropId Specifies the property identifier. For information about this parameter, see the table in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin2-getcaproperty">ICertAdmin2::GetCAProperty</a>.
     * @returns {BSTR} A pointer to the <b>BSTR</b> that represents the property's display name. When you have finished using the <b>BSTR</b>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest2-getcapropertydisplayname
     */
    GetCAPropertyDisplayName(strConfig, PropId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pstrDisplayName := BSTR()
        result := ComCall(18, this, "ptr", strConfig, "int", PropId, "ptr", pstrDisplayName, "HRESULT")
        return pstrDisplayName
    }

    /**
     * Retrieves the cached response data returned by the server.
     * @param {Integer} PropId The data to be retrieved. If the property is indexed, use <i>PropIndex</i> to specify the index.
     * @param {Integer} PropIndex The zero-based index when <i>PropId</i> is an indexed property. If <i>PropId</i> is not an indexed property, then <i>PropIndex</i> must be zero.
     * @param {Integer} PropType The type of data returned in <i>pvarPropertyValue</i>. The property type here must match the type of data specified by the <i>PropId</i> parameter.
     * @param {Integer} Flags The format of the data returned in <i>pvarPropertyValue</i>. The flag set here must match the type of data specified by the <i>PropId</i> parameter. 
     * 
     * 
     * 
     * For more information, see Remarks.
     * @returns {VARIANT} The data returned.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest2-getfullresponseproperty
     */
    GetFullResponseProperty(PropId, PropIndex, PropType, Flags) {
        pvarPropertyValue := VARIANT()
        result := ComCall(19, this, "int", PropId, "int", PropIndex, "int", PropType, "int", Flags, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
    }
}
