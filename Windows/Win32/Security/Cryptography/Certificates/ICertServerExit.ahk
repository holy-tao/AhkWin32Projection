#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Exported by the server engine and is called by exit modules.
 * @see https://docs.microsoft.com/windows/win32/api//certif/nn-certif-icertserverexit
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertServerExit extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertServerExit
     * @type {Guid}
     */
    static IID => Guid("{4ba9eb90-732c-11d0-8816-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContext", "GetRequestProperty", "GetRequestAttribute", "GetCertificateProperty", "GetCertificateExtension", "GetCertificateExtensionFlags", "EnumerateExtensionsSetup", "EnumerateExtensions", "EnumerateExtensionsClose", "EnumerateAttributesSetup", "EnumerateAttributes", "EnumerateAttributesClose"]

    /**
     * Causes the current instantiation of the interface to operate on the request referenced by Context.
     * @param {Integer} Context Specifies the request and associated certificate under construction.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-setcontext
     */
    SetContext(Context) {
        result := ComCall(7, this, "int", Context, "HRESULT")
        return result
    }

    /**
     * Returns a named property from a request.
     * @param {BSTR} strPropertyName Specifies the property to retrieve. There is a stock set of certificate properties, referred to as the name properties, that are always valid and can be retrieved by calling this method. For information about these properties, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/name-properties">Name Properties</a>.
     * 
     * Other properties valid for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate requests</a> include the request properties.
     * 
     * <div class="alert"><b>Note</b>  The request's <b>DistinguishedName</b> and <b>RawName</b> properties are accessible by <b>GetRequestProperty</b> only if the certificate is requested by using a PKCS #10 certificate request or another supported request format that contains encoded subject name information. Note that KeyGen requests do not contain encoded subject name information.</div>
     * <div> </div>
     * 
     * The following properties are unique to requests and can be accessed by using the <b>GetRequestProperty</b> method.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Request property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Disposition"></a><a id="disposition"></a><a id="DISPOSITION"></a><dl>
     * <dt><b>Disposition</b></dt>
     * <dt>Signed long</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Current request disposition
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DispositionMessage"></a><a id="dispositionmessage"></a><a id="DISPOSITIONMESSAGE"></a><dl>
     * <dt><b>DispositionMessage</b></dt>
     * <dt>String</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Informational disposition message
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RawCACertificate"></a><a id="rawcacertificate"></a><a id="RAWCACERTIFICATE"></a><dl>
     * <dt><b>RawCACertificate</b></dt>
     * <dt>Binary</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate for the issuing <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>
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
     * Raw request bytes
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
     * Attribute string (can be truncated)
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
     * The name of the requester in the form "<i>DomainName</i>&#92;<i>UserID</i>"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RequestID"></a><a id="requestid"></a><a id="REQUESTID"></a><dl>
     * <dt><b>RequestID</b></dt>
     * <dt>Signed long</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal requestID
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
     * Indicates PKCS #10 or KeyGen request
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ResolvedWhen"></a><a id="resolvedwhen"></a><a id="RESOLVEDWHEN"></a><dl>
     * <dt><b>ResolvedWhen</b></dt>
     * <dt>Date/time</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When resolved
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="StatusCode"></a><a id="statuscode"></a><a id="STATUSCODE"></a><dl>
     * <dt><b>StatusCode</b></dt>
     * <dt>Signed long</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows error for last operation
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
     * When arrived
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} PropertyType Specifies the property type. The type can be one of the following types.
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
     * Date/time
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
     * Unicode string data
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {VARIANT} A pointer to the <b>VARIANT</b> that will contain the request property type.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-getrequestproperty
     */
    GetRequestProperty(strPropertyName, PropertyType) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        pvarPropertyValue := VARIANT()
        result := ComCall(8, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
    }

    /**
     * Returns a named attribute value from a request.
     * @param {BSTR} strAttributeName The name of the attribute to retrieve.
     * @returns {BSTR} A pointer to a <b>BSTR</b> value that will contain the attribute value.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-getrequestattribute
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
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/name-properties">Name Properties</a>. Other properties that can be retrieved include the certificate properties.
     * 						
     * 
     * The following properties are unique to certificates and can be read by <b>GetCertificateProperty</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NotBefore"></a><a id="notbefore"></a><a id="NOTBEFORE"></a><dl>
     * <dt><b>NotBefore</b></dt>
     * <dt>Date/Time</dt>
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
     * <dt>Date/Time</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate expiration date
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
     * Subject key algorithm <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RawCertificate"></a><a id="rawcertificate"></a><a id="RAWCERTIFICATE"></a><dl>
     * <dt><b>RawCertificate</b></dt>
     * <dt>Binary</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Raw certificate bytes
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
     * <td width="40%"><a id="RequestID"></a><a id="requestid"></a><a id="REQUESTID"></a><dl>
     * <dt><b>RequestID</b></dt>
     * <dt>Signed Long</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal request ID
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SerialNumber"></a><a id="serialnumber"></a><a id="SERIALNUMBER"></a><dl>
     * <dt><b>SerialNumber</b></dt>
     * <dt>String</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate serial number
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The certificate's DistinguishedName, RawName, and SerialNumber properties are accessible by <b>GetCertificateProperty</b> only after the policy module has finished processing the request and the certificate is issued.
     * 
     * The following properties apply to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>. The context must be  zero to read any of these properties. The context is set to zero when the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nn-certif-icertserverexit">ICertServerExit</a> object is initially created.  It can also be set to zero by invoking the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverexit-setcontext">SetContext</a> method.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CAType"></a><a id="catype"></a><a id="CATYPE"></a><dl>
     * <dt><b>CAType</b></dt>
     * <dt>Long</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * @param {Integer} PropertyType Specifies the property type. The type can be one of the following.
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
     * Date/time
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
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> that will contain the property value. The returned value is encoded as a <b>BSTR</b>. Use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysstringbytelen">SysStringByteLen</a> function to retrieve the length of the <b>BSTR</b>.  The binary <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> is stored as a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a>  encoded X.509 certificate.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-getcertificateproperty
     */
    GetCertificateProperty(strPropertyName, PropertyType) {
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        pvarPropertyValue := VARIANT()
        result := ComCall(10, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "HRESULT")
        return pvarPropertyValue
    }

    /**
     * Gets a specified certificate extension.
     * @param {BSTR} strExtensionName A string that contains the name of the extension.
     * @param {Integer} Type Specifies the type of the extension. The type can be one of the following types.
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
     * Date/time
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_BINARY"></a><a id="proptype_binary"></a><dl>
     * <dt><b>PROPTYPE_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extension value is retrieved as is and is ASN.1 encoded if necessary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROPTYPE_STRING"></a><a id="proptype_string"></a><dl>
     * <dt><b>PROPTYPE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The extension value is ASN.1 encoded as an IA5 string.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {VARIANT} A  pointer to a <b>VARIANT</b> that receives the requested extension value.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-getcertificateextension
     */
    GetCertificateExtension(strExtensionName, Type) {
        strExtensionName := strExtensionName is String ? BSTR.Alloc(strExtensionName).Value : strExtensionName

        pvarValue := VARIANT()
        result := ComCall(11, this, "ptr", strExtensionName, "int", Type, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * Gets the flags from the extension acquired by the most recent call to ICertServerExit::GetCertificateExtension.
     * @returns {Integer} A pointer to a <b>LONG</b> variable that will contain the extension flags.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-getcertificateextensionflags
     */
    GetCertificateExtensionFlags() {
        result := ComCall(12, this, "int*", &pExtFlags := 0, "HRESULT")
        return pExtFlags
    }

    /**
     * Initializes the internal enumeration pointer to the first certificate extension associated with the current context.
     * @param {Integer} Flags This parameter is reserved and must be set to zero.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-enumerateextensionssetup
     */
    EnumerateExtensionsSetup(Flags) {
        result := ComCall(13, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Returns the object identifier (OID) string (also known as the extension name) of the next certificate extension to be enumerated, then increments the internal pointer to the following extension.
     * @returns {BSTR} A pointer to the enumerated extension name.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-enumerateextensions
     */
    EnumerateExtensions() {
        pstrExtensionName := BSTR()
        result := ComCall(14, this, "ptr", pstrExtensionName, "HRESULT")
        return pstrExtensionName
    }

    /**
     * Frees any resources connected with extension enumeration.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-enumerateextensionsclose
     */
    EnumerateExtensionsClose() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Initializes the internal enumeration pointer to the first request attribute associated with the current context.
     * @param {Integer} Flags This parameter is reserved and must be set to zero.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-enumerateattributessetup
     */
    EnumerateAttributesSetup(Flags) {
        result := ComCall(16, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Returns the name of the next request attribute within the current context, then increments the internal pointer to the following attribute.
     * @returns {BSTR} A pointer to the enumerated attribute name.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-enumerateattributes
     */
    EnumerateAttributes() {
        pstrAttributeName := BSTR()
        result := ComCall(17, this, "ptr", pstrAttributeName, "HRESULT")
        return pstrAttributeName
    }

    /**
     * Frees any resources connected with attribute enumeration.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certif/nf-certif-icertserverexit-enumerateattributesclose
     */
    EnumerateAttributesClose() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
