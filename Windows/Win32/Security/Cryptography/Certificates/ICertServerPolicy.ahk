#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Allows the policy module to communicate with Certificate Services.
 * @see https://docs.microsoft.com/windows/win32/api//certif/nn-certif-icertserverpolicy
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertServerPolicy extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertServerPolicy
     * @type {Guid}
     */
    static IID => Guid("{aa000922-ffbe-11cf-8800-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContext", "GetRequestProperty", "GetRequestAttribute", "GetCertificateProperty", "SetCertificateProperty", "GetCertificateExtension", "GetCertificateExtensionFlags", "SetCertificateExtension", "EnumerateExtensionsSetup", "EnumerateExtensions", "EnumerateExtensionsClose", "EnumerateAttributesSetup", "EnumerateAttributes", "EnumerateAttributesClose"]

    /**
     * Specifies the request to be used as the context for subsequent calls to Certificate Services.
     * @param {Integer} Context Specifies the request. This  parameter must be set to the identical value returned in the  <i>Context</i> parameter of the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/certpol/nf-certpol-icertpolicy-verifyrequest">ICertPolicy::VerifyRequest</a> method.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-setcontext
     */
    SetContext(Context) {
        result := ComCall(7, this, "int", Context, "HRESULT")
        return result
    }

    /**
     * Retrieves a specific property from a request.
     * @param {BSTR} strPropertyName Specifies the name of the property to retrieve. This parameter can be set to a name property or  a request property.
     * 
     * Name properties include  a stock set of certificate properties that are always valid and can be retrieved by calling this method. For information about these properties, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/name-properties">Name Properties</a>.
     * 
     * Request properties are unique to requests and include the following possible values.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequestID"></a><a id="requestid"></a><a id="REQUESTID"></a><dl>
     * <dt><b>RequestID</b></dt>
     * <dt>Signed long</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal requestID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RawRequest"></a><a id="rawrequest"></a><a id="RAWREQUEST"></a><dl>
     * <dt><b>RawRequest</b></dt>
     * <dt>Binary</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Raw request bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequestAttributes"></a><a id="requestattributes"></a><a id="REQUESTATTRIBUTES"></a><dl>
     * <dt><b>RequestAttributes</b></dt>
     * <dt>String</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attribute string (may be truncated).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequestType"></a><a id="requesttype"></a><a id="REQUESTTYPE"></a><dl>
     * <dt><b>RequestType</b></dt>
     * <dt>Signed long</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates PKCS #10 or KeyGen request. For more information about this property, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SubmittedWhen"></a><a id="submittedwhen"></a><a id="SUBMITTEDWHEN"></a><dl>
     * <dt><b>SubmittedWhen</b></dt>
     * <dt>Date/time</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When arrived.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequesterName"></a><a id="requestername"></a><a id="REQUESTERNAME"></a><dl>
     * <dt><b>RequesterName</b></dt>
     * <dt>String</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name of the requester in the form "<i>DomainName</i>&#92;<i>UserID</i>".
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Note</b>  There are additional request properties that cannot be accessed by <b>GetRequestProperty</b> because they  are not set until after the policy module finishes processing the request.In addition, other properties may be set by a specific request type, request extensions, or by named attributes set in the header of a request.
     * @param {Integer} PropertyType Specifies the property type. The <i>PropertyType</i> parameter  can be one of the following types.
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
     * Signed long data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_DATE"></a><a id="proptype_date"></a><dl>
     * <dt><b>PROPTYPE_DATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Date/time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_BINARY"></a><a id="proptype_binary"></a><dl>
     * <dt><b>PROPTYPE_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_STRING"></a><a id="proptype_string"></a><dl>
     * <dt><b>PROPTYPE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> string data.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {VARIANT} A pointer to the <b>VARIANT</b> that contains the request property type.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-getrequestproperty
     */
    GetRequestProperty(strPropertyName, PropertyType) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        pvarPropertyValue := VARIANT()
        result := ComCall(8, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
    }

    /**
     * Returns a named attribute from a request.
     * @param {BSTR} strAttributeName The name of the attribute to retrieve.
     * @returns {BSTR} A pointer to a <b>BSTR</b> value that will contain the attribute value.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-getrequestattribute
     */
    GetRequestAttribute(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        pstrAttributeValue := BSTR()
        result := ComCall(9, this, "ptr", strAttributeName, "ptr", pstrAttributeValue, "HRESULT")
        return pstrAttributeValue
    }

    /**
     * Returns a named property from a certificate.
     * @param {BSTR} strPropertyName Specifies the named property to retrieve. There is a stock set of certificate properties, referred to as the <i>name properties</i>, that are always valid and can be retrieved by calling this method. For information about these properties, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/name-properties">Name Properties</a>. Other properties beside name properties can also be retrieved.
     * 
     * The certificate's DistinguishedName and RawName properties are accessible by <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverexit-getcertificateproperty">ICertServerExit::GetCertificateProperty</a> only after the policy module has finished processing the request and the certificate is issued. The issued certificate's DistinguishedName and RawName properties can also be read by an exit module by using <b>ICertServerExit::GetCertificateProperty</b>.
     * 
     * There are additional certificate properties that cannot be accessed by <b>GetCertificateProperty</b>. These properties are not set until after the policy module returns VR_INSTANT_OK and the certificate is issued. For a complete list of all the properties in an issued certificate, see 
     * <b>GetCertificateProperty</b>.
     * 
     * 
     * The following properties are unique to certificates and can be read by <b>GetCertificateProperty</b>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Certificate property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequestID"></a><a id="requestid"></a><a id="REQUESTID"></a><dl>
     * <dt><b>RequestID</b></dt>
     * <dt>Signed long</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal request ID
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NotBefore"></a><a id="notbefore"></a><a id="NOTBEFORE"></a><dl>
     * <dt><b>NotBefore</b></dt>
     * <dt>Date/time</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate start validity date
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NotAfter"></a><a id="notafter"></a><a id="NOTAFTER"></a><dl>
     * <dt><b>NotAfter</b></dt>
     * <dt>Date/time</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate expiration date
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RawPublicKey"></a><a id="rawpublickey"></a><a id="RAWPUBLICKEY"></a><dl>
     * <dt><b>RawPublicKey</b></dt>
     * <dt>Binary</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Subject key
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PublicKeyAlgorithm"></a><a id="publickeyalgorithm"></a><a id="PUBLICKEYALGORITHM"></a><dl>
     * <dt><b>PublicKeyAlgorithm</b></dt>
     * <dt>String</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Subject key algorithm <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object ID</a> (OID)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RawPublicKeyAlgorithmParameters"></a><a id="rawpublickeyalgorithmparameters"></a><a id="RAWPUBLICKEYALGORITHMPARAMETERS"></a><dl>
     * <dt><b>RawPublicKeyAlgorithmParameters</b></dt>
     * <dt>Binary</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Subject key algorithm parameters
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GeneralFlags"></a><a id="generalflags"></a><a id="GENERALFLAGS"></a><dl>
     * <dt><b>GeneralFlags</b></dt>
     * <dt>PROPTYPE_LONG</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * GeneralFlags in the enrollment request. This is a bitwise <b>OR</b> of values. The only value of interest 								should be the flag value of 0x00000400, which tells the CA not to persist the request in the 									database. If  the CA is in databaseless mode (that is, for Windows Server 2008 R2 and later CAs, the CA's database 								has the 	<b>DBFLAGS_ENABLEVOLATILEREQUESTS</b> flag set), use <c>certutil -getreg DbFlags</code> and 									<code>certutil -setreg DBFlags</c> for configuring the CA in databaseless mode.
     * 
     * 
     * <b>Windows Vista and Windows Storage Server 2003:  </b>This field is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequesterNameFromOldCertificate"></a><a id="requesternamefromoldcertificate"></a><a id="REQUESTERNAMEFROMOLDCERTIFICATE"></a><dl>
     * <dt><b>RequesterNameFromOldCertificate</b></dt>
     * <dt>PROPTYPE_STRING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For renewal requests, returns the requester account name (for example,  contoso\requester).
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following properties apply to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>CA property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CAType"></a><a id="catype"></a><a id="CATYPE"></a><dl>
     * <dt><b>CAType</b></dt>
     * <dt>Long</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * @param {Integer} PropertyType 
     * @returns {VARIANT} A pointer to <b>VARIANT</b> that will contain the property value.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-getcertificateproperty
     */
    GetCertificateProperty(strPropertyName, PropertyType) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        pvarPropertyValue := VARIANT()
        result := ComCall(10, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
    }

    /**
     * To set a property associated with a certificate.
     * @param {BSTR} strPropertyName Specifies the property to set. You can set any of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/name-properties">Name Properties</a> associated with the certificate. 
     * 
     * 
     *  In addition, you can set the following certificate properties.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NotBefore"></a><a id="notbefore"></a><a id="NOTBEFORE"></a><dl>
     * <dt><b>NotBefore</b></dt>
     * <dt>Date/time</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid before the given date.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NotAfter"></a><a id="notafter"></a><a id="NOTAFTER"></a><dl>
     * <dt><b>NotAfter</b></dt>
     * <dt>Date/time</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not valid after the given date.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GeneralFlags"></a><a id="generalflags"></a><a id="GENERALFLAGS"></a><dl>
     * <dt><b>GeneralFlags</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Set this property to 0x00000400 to prevent the request from being persisted in the CA database.
     * 
     * <div class="alert"><b>Caution</b>  Do not overwrite any mask values returned by <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-getcertificateproperty">GetCertificateProperty</a>when setting this property. Set the value by performing a bitwise <b>OR</b> with the existing values.</div>
     * <div> </div>
     * <b>Windows Storage Server 2003:  </b>This field is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CrossForest"></a><a id="crossforest"></a><a id="CROSSFOREST"></a><dl>
     * <dt><b>CrossForest</b></dt>
     * <dt>PROPTYPE_LONG</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A Boolean value that specifies whether the CA should operate cross forest enrollment 								mode.
     * 
     * <b>Windows Server 2008 and Windows Server 2003:  </b>Cross forest enrollment is not supported. Cross forest enrollment is supported beginning with Windows Server 2008 R2.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequesterSAMName"></a><a id="requestersamname"></a><a id="REQUESTERSAMNAME"></a><dl>
     * <dt><b>RequesterSAMName</b></dt>
     * <dt>PROPTYPE_STRING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tells the CA to set the requester account name ("RequesterName") and distinguished 								name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequesterUPN"></a><a id="requesterupn"></a><a id="REQUESTERUPN"></a><dl>
     * <dt><b>RequesterUPN</b></dt>
     * <dt>PROPTYPE_STRING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tells the CA to convert the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN) of the requester to the requester 								name ("RequesterName")  and to set the requester name and the requester distinguished 								name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequesterDN"></a><a id="requesterdn"></a><a id="REQUESTERDN"></a><dl>
     * <dt><b>RequesterDN</b></dt>
     * <dt>PROPTYPE_STRING</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tells the CA to convert the FQDN 1779 name of the requester to the requester 										name and to set the requester name ("RequesterName")  and the requester  distinguished 								name.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} PropertyType Specifies the type of the property being set. The <i>Type</i> parameter must agree with the data type of <i>pvarValue</i> that is set in the <b>vt</b> field of the <b>VARIANT</b> structure. The <i>Type</i> parameter can be set to one of the following types.
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
     * Signed long data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_DATE"></a><a id="proptype_date"></a><dl>
     * <dt><b>PROPTYPE_DATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Date/time data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_BINARY"></a><a id="proptype_binary"></a><dl>
     * <dt><b>PROPTYPE_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary data.
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
     * @param {Pointer<VARIANT>} pvarPropertyValue Specifies the value to set the property to.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-setcertificateproperty
     */
    SetCertificateProperty(strPropertyName, PropertyType, pvarPropertyValue) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(11, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }

    /**
     * Retrieves a specific certificate extension.
     * @param {BSTR} strExtensionName A string that contains the name of the extension.
     * @param {Integer} Type 
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> that receives the requested extension value.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-getcertificateextension
     */
    GetCertificateExtension(strExtensionName, Type) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        pvarValue := VARIANT()
        result := ComCall(12, this, "ptr", strExtensionName, "int", Type, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * Retrieves the flags associated with the extension acquired by the most recent call to GetCertificateExtension.
     * @returns {Integer} A pointer to a <b>LONG</b> variable that contains the extension flags.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-getcertificateextensionflags
     */
    GetCertificateExtensionFlags() {
        result := ComCall(13, this, "int*", &pExtFlags := 0, "HRESULT")
        return pExtFlags
    }

    /**
     * Adds a new extension to the certificate.
     * @param {BSTR} strExtensionName Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for the extension to set. The string must be 31 or less nonnull characters in length.
     * @param {Integer} Type Specifies the type of extension being set. The <i>Type</i> parameter must agree with the data type of <b>pvarValue</b> that is set in the <b>vt</b> field of the <b>VARIANT</b> structure. The <i>Type</i> parameter can be set to one of the following types. 
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
     * <td width="40%"><a id="PROPTYPE_LONG"></a><a id="proptype_long"></a><dl>
     * <dt><b>PROPTYPE_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Signed long data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_DATE"></a><a id="proptype_date"></a><dl>
     * <dt><b>PROPTYPE_DATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Date/time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_BINARY"></a><a id="proptype_binary"></a><dl>
     * <dt><b>PROPTYPE_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extension value is set as is and is assumed to be ASN.1 encoded if necessary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_STRING"></a><a id="proptype_string"></a><dl>
     * <dt><b>PROPTYPE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extension value will be ASN.1 encoded as an IA5 string before it is placed in the new certificate.
     * 
     * <div class="alert"><b>Note</b>  You should use <b>PROPTYPE_STRING</b> for an extension value that consists of a single URL only if you want the URL to be automatically encoded as an IA5 string. Otherwise, encode the URL as an IA5 string yourself and pass the encoded value as <b>PROPTYPE_BINARY</b>.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ExtFlags Specifies the flags for the extension being set. Use a value of zero if no flag is to be set, or use one of the following flag values. You can join these flags together by using the <b>OR</b> operator, and you can also join them by using the <b>OR</b> operator with policy private extension flags (the high 8 bits of the EXTENSION_POLICY_MASK field). 
     * 
     * 
     * 
     * 
     * 						
     * 
     * <div class="alert"><b>Note</b>  When <i>ExtFlags</i> is set to EXTENSION_DISABLE_FLAG, the extension will be disabled in the server log and will not be added to the certificate.</div>
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
     * Extension will not be used.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<VARIANT>} pvarValue Specifies the value associated with the extension. Note the value's <b>VARIANT</b> type must agree with the <i>Type</i> parameter, as shown in the following table. 
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
     * <td width="40%"><a id="PROPTYPE_LONG"></a><a id="proptype_long"></a><dl>
     * <dt><b>PROPTYPE_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VT_I4
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_DATE"></a><a id="proptype_date"></a><dl>
     * <dt><b>PROPTYPE_DATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VT_DATE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_BINARY"></a><a id="proptype_binary"></a><dl>
     * <dt><b>PROPTYPE_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VT_BSTR
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_STRING"></a><a id="proptype_string"></a><dl>
     * <dt><b>PROPTYPE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VT_BSTR
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-setcertificateextension
     */
    SetCertificateExtension(strExtensionName, Type, ExtFlags, pvarValue) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        result := ComCall(14, this, "ptr", strExtensionName, "int", Type, "int", ExtFlags, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * Initializes the internal enumeration pointer to the first certificate extension associated with the current context.
     * @param {Integer} Flags This parameter is reserved and must be set to zero.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-enumerateextensionssetup
     */
    EnumerateExtensionsSetup(Flags) {
        result := ComCall(15, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Retrieves the object identifier (OID) of the current extension and moves the internal enumeration pointer to the next extension.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that contains the OID of the current extension.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-enumerateextensions
     */
    EnumerateExtensions() {
        pstrExtensionName := BSTR()
        result := ComCall(16, this, "ptr", pstrExtensionName, "HRESULT")
        return pstrExtensionName
    }

    /**
     * Frees the resources connected with extension enumeration.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-enumerateextensionsclose
     */
    EnumerateExtensionsClose() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Initializes the internal enumeration pointer to the first request attribute associated with the current context.
     * @param {Integer} Flags This parameter is reserved and must be set to zero.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-enumerateattributessetup
     */
    EnumerateAttributesSetup(Flags) {
        result := ComCall(18, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the current attribute and moves the internal enumeration pointer to the next attribute.
     * @returns {BSTR} A pointer to the attribute name.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-enumerateattributes
     */
    EnumerateAttributes() {
        pstrAttributeName := BSTR()
        result := ComCall(19, this, "ptr", pstrAttributeName, "HRESULT")
        return pstrAttributeName
    }

    /**
     * Frees the resources connected with attribute enumeration.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverpolicy-enumerateattributesclose
     */
    EnumerateAttributesClose() {
        result := ComCall(20, this, "HRESULT")
        return result
    }
}
