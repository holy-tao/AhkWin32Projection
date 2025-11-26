#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\ICertAdmin.ahk

/**
 * Provide administration functionality for properly authorized clients.
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-icertadmin2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertAdmin2 extends ICertAdmin{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertAdmin2
     * @type {Guid}
     */
    static IID => Guid("{f7c3ac41-b8ce-4fb4-aa58-3d1dc0e36b39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PublishCRLs", "GetCAProperty", "SetCAProperty", "GetCAPropertyFlags", "GetCAPropertyDisplayName", "GetArchivedKey", "GetConfigEntry", "SetConfigEntry", "ImportKey", "GetMyRoles", "DeleteRow"]

    /**
     * Publishes certificate revocation lists (CRLs) for a certification authority (CA).
     * @remarks
     * 
     * To determine whether a CA has successfully published base and delta CRLs, call <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin2-getcaproperty">ICertAdmin2::GetCAProperty</a> with the CR_PROP_BASECRLPUBLISHSTATUS and CR_PROP_DELTACRLPUBLISHSTATUS property identifiers, respectively.
     * 
     * 
     * 
     * @param {BSTR} strConfig Represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>PublishCRLs</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Float} Date Specifies the next update value of the CRL in GMT time. 
     * If  <i>Date</i> is nonzero, the next update value for the CRL is <i>Date</i>, subject to  rounding or ceiling limits enforced by <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Services</a>. If <i>Date</i> is zero, the  next update value of the CRL is calculated from  the default CRL publication period.
     * @param {Integer} CRLFlags Value that specifies the CRL publishing options. This value can be a bitwise combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CA_CRL_BASE"></a><a id="ca_crl_base"></a><dl>
     * <dt><b>CA_CRL_BASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A base CRL is published, or the most recent base CRL is republished if CA_CRL_REPUBLISH is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CA_CRL_DELTA"></a><a id="ca_crl_delta"></a><dl>
     * <dt><b>CA_CRL_DELTA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A delta CRL is published, or the most recent delta CRL is republished if CA_CRL_REPUBLISH is set. Note that if the CA has not enabled delta CRL publishing, use of this flag will result in an error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CA_CRL_REPUBLISH"></a><a id="ca_crl_republish"></a><dl>
     * <dt><b>CA_CRL_REPUBLISH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The most recent  base or delta CRL, as specified by CA_CRL_BASE or CA_CRL_DELTA, is republished. The CA will not republish a CRL to a CRL distribution point if the CRL at the distribution point is already the most recent CRL.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-publishcrls
     */
    PublishCRLs(strConfig, Date, CRLFlags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(17, this, "ptr", strConfig, "double", Date, "int", CRLFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves a property value for the certification authority (CA).
     * @param {BSTR} strConfig Represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>GetCAProperty</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} PropId Specifies one of the following property identifiers.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_ADVANCEDSERVER"></a><a id="cr_prop_advancedserver"></a><dl>
     * <dt><b>CR_PROP_ADVANCEDSERVER</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Long
     * 
     * Specifies whether the CA is running Advanced Server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_BASECRL"></a><a id="cr_prop_basecrl"></a><dl>
     * <dt><b>CR_PROP_BASECRL</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Binary, indexed
     * 
     * The CA's full, or base, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_BASECRLPUBLISHSTATUS"></a><a id="cr_prop_basecrlpublishstatus"></a><dl>
     * <dt><b>CR_PROP_BASECRLPUBLISHSTATUS</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Long, indexed
     * 
     * The base CRL publish status. For more details, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CABACKWARDCROSSCERT"></a><a id="cr_prop_cabackwardcrosscert"></a><dl>
     * <dt><b>CR_PROP_CABACKWARDCROSSCERT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Binary, indexed
     * 
     * The backward cross certificate. A backward cross certificate is the certificate issued upon renewal from the CA to itself signed with CA's new  key. The backward cross certificate has the authority key identifier of the new CA certificate and the subject key identifier of the old CA certificate.
     * 
     *  Applies to root CAs only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CABACKWARDCROSSCERTSTATE"></a><a id="cr_prop_cabackwardcrosscertstate"></a><dl>
     * <dt><b>CR_PROP_CABACKWARDCROSSCERTSTATE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Long, indexed
     * 
     * Whether the backward cross certificate is valid.  Valid for root CAs only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CACERTSTATE"></a><a id="cr_prop_cacertstate"></a><dl>
     * <dt><b>CR_PROP_CACERTSTATE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Long
     * 
     * State of the CA certificate. The values can be:<ul>
     * <li>CA_DISP_REVOKED</li>
     * <li>CA_DISP_VALID</li>
     * <li>CA_DISP_INVALID</li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CACERTSTATUSCODE"></a><a id="cr_prop_cacertstatuscode"></a><dl>
     * <dt><b>CR_PROP_CACERTSTATUSCODE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Long, indexed
     * 
     * Status of the CA certificate, as an <b>HRESULT</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CACERTVERSION"></a><a id="cr_prop_cacertversion"></a><dl>
     * <dt><b>CR_PROP_CACERTVERSION</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Long, indexed
     * 
     * Version of the CA certificate, as a DWORD. The high-order word is the key index, and the low-order word is the CA certificate index.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CAFORWARDCROSSCERT"></a><a id="cr_prop_caforwardcrosscert"></a><dl>
     * <dt><b>CR_PROP_CAFORWARDCROSSCERT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Binary, indexed
     * 
     * The forward cross certificate. A forward cross certificate is a certificate issued upon renewal from the CA to itself signed with CA's previous key. The forward cross certificate has the authority key identifier of the previous CA certificate and the subject key identifier of the new CA certificate.
     * 
     *  Applies to root CAs only. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CAFORWARDCROSSCERTSTATE"></a><a id="cr_prop_caforwardcrosscertstate"></a><dl>
     * <dt><b>CR_PROP_CAFORWARDCROSSCERTSTATE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Long, indexed
     * 
     * Whether the forward cross certificate is valid.  Valid for root CAs only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CANAME"></a><a id="cr_prop_caname"></a><dl>
     * <dt><b>CR_PROP_CANAME</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: String
     * 
     * Name of the CA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CASIGCERT"></a><a id="cr_prop_casigcert"></a><dl>
     * <dt><b>CR_PROP_CASIGCERT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Binary, indexed
     * 
     * CA signing certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CASIGCERTCHAIN"></a><a id="cr_prop_casigcertchain"></a><dl>
     * <dt><b>CR_PROP_CASIGCERTCHAIN</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Binary, indexed
     * 
     * CA signing certificate chain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CASIGCERTCOUNT"></a><a id="cr_prop_casigcertcount"></a><dl>
     * <dt><b>CR_PROP_CASIGCERTCOUNT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Long
     * 
     * Number of signing certificates for the CA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CASIGCERTCRLCHAIN"></a><a id="cr_prop_casigcertcrlchain"></a><dl>
     * <dt><b>CR_PROP_CASIGCERTCRLCHAIN</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Binary, indexed
     * 
     * The CA's signing certificate CRL chain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_CATYPE"></a><a id="cr_prop_catype"></a><dl>
     * <dt><b>CR_PROP_CATYPE</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data type of the property: Long
     * @param {Integer} PropIndex If the <i>PropId</i> parameter is indexed, the zero-based index to use when retrieving the property value. If <i>PropId</i> is not indexed, this value is ignored.
     * @param {Integer} PropType Specifies the type of the property, indicated in the Meaning column of the <i>PropId</i> table. The type can be one of the following types.
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
     * @param {Integer} Flags The following flags can be used to specify the format of the returned property value; these flags have meaning only for binary data (such as certificates, certificate chains or <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation lists</a>) and is ignored otherwise.
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
     * @returns {VARIANT} A pointer to a buffer that receives the requested property value. It is a caller's responsibility to free this resource when done by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-getcaproperty
     */
    GetCAProperty(strConfig, PropId, PropIndex, PropType, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pvarPropertyValue := VARIANT()
        result := ComCall(18, this, "ptr", strConfig, "int", PropId, "int", PropIndex, "int", PropType, "int", Flags, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
    }

    /**
     * Sets a property value for the certification authority (CA).
     * @param {BSTR} strConfig String value that represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.<div class="alert"><b>Important</b>  <b>SetCAProperty</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} PropId Specifies one of the following property identifiers.
     * 
     * For information about all CA properties, including those that are read-only, see <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin2-getcaproperty">ICertAdmin2::GetCAProperty</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_KRACERT"></a><a id="cr_prop_kracert"></a><dl>
     * <dt><b>CR_PROP_KRACERT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CA's key recovery agent (KRA) certificate.
     * 
     * Data format: binary, indexed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_KRACERTCOUNT"></a><a id="cr_prop_kracertcount"></a><dl>
     * <dt><b>CR_PROP_KRACERTCOUNT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of KRA certificates for the CA.
     * 
     * Data format: <b>Long</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_KRACERTUSEDCOUNT"></a><a id="cr_prop_kracertusedcount"></a><dl>
     * <dt><b>CR_PROP_KRACERTUSEDCOUNT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Number of KRA certificates used by the CA.
     * 
     * Data format: <b>Long</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_ROLESEPARATIONENABLED"></a><a id="cr_prop_roleseparationenabled"></a><dl>
     * <dt><b>CR_PROP_ROLESEPARATIONENABLED</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Value that specifies whether role separation is enabled.
     * 
     * Data format: <b>Long</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_PROP_TEMPLATES"></a><a id="cr_prop_templates"></a><dl>
     * <dt><b>CR_PROP_TEMPLATES</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * List of templates supported by the CA.
     * 
     * Data format: <b>String</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} PropIndex If the <i>PropId</i> parameter is indexed, the zero-based index to use when retrieving the property value. If <i>PropId</i> is not indexed, this value is ignored.
     * @param {Integer} PropType 
     * @param {Pointer<VARIANT>} pvarPropertyValue <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     * A pointer to a <b>VARIANT</b> that specifies the property value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     * A <b>Variant</b> that specifies the property value.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <h3>VB</h3>
     * If the function is successful, the return value is S_OK.
     * 
     *  
     * If the function fails, the return value is an <b>HRESULT</b> that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-setcaproperty
     */
    SetCAProperty(strConfig, PropId, PropIndex, PropType, pvarPropertyValue) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(19, this, "ptr", strConfig, "int", PropId, "int", PropIndex, "int", PropType, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }

    /**
     * The ICertAdmin2::GetCAPropertyFlags method retrieves the property flags for a certification authority (CA) property.
     * @param {BSTR} strConfig Represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see <b>ICertConfig</b>.
     * 
     * <div class="alert"><b>Important</b>  <b>GetCAPropertyFlags</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} PropId Specifies the property identifier. For information about this parameter, see the table in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin2-getcaproperty">ICertAdmin2::GetCAProperty</a>.
     * @returns {Integer} A pointer to a value that represents the property flags.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-getcapropertyflags
     */
    GetCAPropertyFlags(strConfig, PropId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(20, this, "ptr", strConfig, "int", PropId, "int*", &pPropFlags := 0, "HRESULT")
        return pPropFlags
    }

    /**
     * The ICertAdmin2::GetCAPropertyDisplayName method retrieves the property display name for a certification authority (CA) property.
     * @param {BSTR} strConfig Represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>GetCAPropertyDisplayName</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} PropId Specifies the property identifier. For information about this parameter, see the table in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin2-getcaproperty">ICertAdmin2::GetCAProperty</a>.
     * @returns {BSTR} A pointer to the string representing the property's display name.
     * 
     * It is the responsibility of the caller to free the <b>BSTR</b> when done by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-getcapropertydisplayname
     */
    GetCAPropertyDisplayName(strConfig, PropId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pstrDisplayName := BSTR()
        result := ComCall(21, this, "ptr", strConfig, "int", PropId, "ptr", pstrDisplayName, "HRESULT")
        return pstrDisplayName
    }

    /**
     * Retrieves an archived key recovery BLOB.
     * @param {BSTR} strConfig Represents a valid configuration string for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) in the form <i>ComputerName</i>&#92;<i>CAName</i>, where <i>ComputerName</i> is the Certificate Services server's network name, and <i>CAName</i> is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>GetArchivedKey</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} RequestId Represents the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a> ID in the Certificates Services database.
     * @param {Integer} Flags The following flags can be used to specify the format of the returned BLOB. 
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
     * <td width="40%"><a id="CR_OUT_BASE64"></a><a id="cr_out_base64"></a><dl>
     * <dt><b>CR_OUT_BASE64</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BASE64 without BEGIN/END
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_OUT_BASE64HEADER"></a><a id="cr_out_base64header"></a><dl>
     * <dt><b>CR_OUT_BASE64HEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BASE64 with BEGIN CERTIFICATE and END CERTIFICATE
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
     * </table>
     * @returns {BSTR} A pointer to the string that represents the retrieved archived <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key BLOB</a>. When you have finished using this string, it is the responsibility of the caller to free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-getarchivedkey
     */
    GetArchivedKey(strConfig, RequestId, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pstrArchivedKey := BSTR()
        result := ComCall(22, this, "ptr", strConfig, "int", RequestId, "int", Flags, "ptr", pstrArchivedKey, "HRESULT")
        return pstrArchivedKey
    }

    /**
     * Retrieves configuration information for a certification authority (CA).
     * @param {BSTR} strConfig String value that represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>. This parameter can be an empty string, in which case the function retrieves configuration information that is not specific to a CA. This parameter cannot be <b>NULL</b>.
     * 
     * <div class="alert"><b>Important</b>  <b>GetConfigEntry</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {BSTR} strNodePath String value that represents the node path for the configuration information. This parameter can be an empty string, in which case the function retrieves configuration information from the path identified by <i>strConfig</i>. This parameter cannot be <b>NULL</b>.
     * @param {BSTR} strEntryName String value that represents the name of the entry whose information is being retrieved. This value can be an empty string, in which case all of the entry names are retrieved. This parameter cannot be <b>NULL</b>.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> that receives the requested information.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-getconfigentry
     */
    GetConfigEntry(strConfig, strNodePath, strEntryName) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strNodePath := strNodePath is String ? BSTR.Alloc(strNodePath).Value : strNodePath
        strEntryName := strEntryName is String ? BSTR.Alloc(strEntryName).Value : strEntryName

        pvarEntry := VARIANT()
        result := ComCall(23, this, "ptr", strConfig, "ptr", strNodePath, "ptr", strEntryName, "ptr", pvarEntry, "HRESULT")
        return pvarEntry
    }

    /**
     * Sets configuration information for a certification authority (CA).
     * @param {BSTR} strConfig String value that represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>. This parameter can be an empty string, in which case the function sets configuration information that is not specific to a CA. This parameter cannot be <b>NULL</b>.
     * 
     * <div class="alert"><b>Important</b>  <b>SetConfigEntry</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {BSTR} strNodePath String value that represents the node path for the configuration information. This parameter can be an empty string, in which case the function retrieves configuration information from the path identified by <i>strConfig</i>. This parameter cannot be <b>NULL</b>.
     * @param {BSTR} strEntryName String value that represents the name of the entry whose information is being set. This value can be an empty string, in which case the default entry  is the entry being set. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<VARIANT>} pvarEntry <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>Pointer to <b>VARIANT</b> that specifies the information to set. If this value is empty, then the indicated key will be deleted.</td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td><b>Variant</b> that specifies the information to set. If this value is empty, then the indicated key will be deleted.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} <h3>VB</h3>
     * If the function is successful, the return value is S_OK.
     * 
     *  
     * If the function fails, the return value is an <b>HRESULT</b> that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-setconfigentry
     */
    SetConfigEntry(strConfig, strNodePath, strEntryName, pvarEntry) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strNodePath := strNodePath is String ? BSTR.Alloc(strNodePath).Value : strNodePath
        strEntryName := strEntryName is String ? BSTR.Alloc(strEntryName).Value : strEntryName

        result := ComCall(24, this, "ptr", strConfig, "ptr", strNodePath, "ptr", strEntryName, "ptr", pvarEntry, "HRESULT")
        return result
    }

    /**
     * Adds an encrypted key set to an item in the Certificate Services database. The key set is encrypted to one or several key recovery agent (KRA) certificates.
     * @param {BSTR} strConfig String value that represents a valid configuration string for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA)  in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>ImportKey</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} RequestId <b>LONG</b> value that represents the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a> ID in the Certificates Services database. If the serial number (passed in as <i>strCertHash</i>) is to be used instead of the request ID, use zero for this value.
     * @param {BSTR} strCertHash String value that represents the certificate hash. For <i>strCertHash</i> to be used, you must specify a value of zero for <i>RequestId</i>.
     * @param {Integer} Flags 
     * @param {BSTR} strKey String value that represents the KRA key information.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-importkey
     */
    ImportKey(strConfig, RequestId, strCertHash, Flags, strKey) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strCertHash := strCertHash is String ? BSTR.Alloc(strCertHash).Value : strCertHash
        strKey := strKey is String ? BSTR.Alloc(strKey).Value : strKey

        result := ComCall(25, this, "ptr", strConfig, "int", RequestId, "ptr", strCertHash, "int", Flags, "ptr", strKey, "HRESULT")
        return result
    }

    /**
     * Retrieves the certification authority (CA) roles of the caller.
     * @param {BSTR} strConfig String value that represents a valid configuration string for the CA in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the CA, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>GetMyRoles</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-getmyroles
     */
    GetMyRoles(strConfig) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(26, this, "ptr", strConfig, "uint*", &pRoles := 0, "HRESULT")
        return pRoles
    }

    /**
     * The DeleteRow method deletes a row or set of rows from a database table. The caller specifies a database table and either a row ID or an ending date.
     * @param {BSTR} strConfig Represents a valid configuration string for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <div class="alert"><b>Important</b>  <b>DeleteRow</b> does not clear the internal cache when the configuration string is changed. When you change the configuration string for the CA, you must instantiate a new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-icertadmin2">ICertAdmin</a> object and call this method again with the new configuration string.</div>
     * <div> </div>
     * @param {Integer} Flags If not zero, specifies whether <i>Date</i> applies to an expiration date or a last modified date.
     * @param {Float} Date Specifies an expiration date when deleting certificates or CRLs, and a last modified date when deleting certificate requests.
     * 
     * If this value is not zero, then <i>RowID</i> must be zero.
     * @param {Integer} Table A <b>LONG</b> value that specifies the Certificate Services database table from which the rows are to be deleted.
     * @param {Integer} RowId Specifies the ID of the row to delete.
     * 
     * If this value is not zero, then <i>Date</i> must be zero.
     * @returns {Integer} The number of rows successfully deleted.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-icertadmin2-deleterow
     */
    DeleteRow(strConfig, Flags, Date, Table, RowId) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(27, this, "ptr", strConfig, "int", Flags, "double", Date, "int", Table, "int", RowId, "int*", &pcDeleted := 0, "HRESULT")
        return pcDeleted
    }
}
