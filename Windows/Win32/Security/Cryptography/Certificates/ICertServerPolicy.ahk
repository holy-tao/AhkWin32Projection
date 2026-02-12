#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Allows the policy module to communicate with Certificate Services.
 * @see https://learn.microsoft.com/windows/win32/api//content/certif/nn-certif-icertserverpolicy
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
     * @remarks
     * The policy module must call the <b>SetContext</b> method first, before calls to any other <a href="https://docs.microsoft.com/windows/desktop/api/certif/nn-certif-icertserverpolicy">ICertServerPolicy</a> method,  so that the interface  references a valid request.
     * @param {Integer} Context_ Specifies the request. This  parameter must be set to the identical value returned in the  <i>Context</i> parameter of the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/certpol/nf-certpol-icertpolicy-verifyrequest">ICertPolicy::VerifyRequest</a> method.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-setcontext
     */
    SetContext(Context_) {
        result := ComCall(7, this, "int", Context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a specific property from a request.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-setcontext">SetContext</a> method must be called prior to calling this method. The call to <b>SetContext</b> specifies which request is used as the current context.
     * 
     * Requests  hold all the associated states for the request and the eventual granted certificate that is not a part of the certificate. Thus, data such as revocation times and disposition data are kept in the request data object.
     * 
     * The <b>RequestType</b> property can be set to one of the following values.<table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>CR_IN_PKCS</td>
     * <td>The request is a PKCS #7 renewal or registration request.</td>
     * </tr>
     * <tr>
     * <td>CR_IN-PKCS10</td>
     * <td>The request is a PKCS #10 request.</td>
     * </tr>
     * <tr>
     * <td>CR_IN_KEYGEN</td>
     * <td>The request is a Keygen request (Netscape format).</td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-getrequestproperty
     */
    GetRequestProperty(strPropertyName, PropertyType) {
        if(strPropertyName is String) {
            pin := BSTR.Alloc(strPropertyName)
            strPropertyName := pin.Value
        }

        pvarPropertyValue := VARIANT()
        result := ComCall(8, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarPropertyValue
    }

    /**
     * Returns a named attribute from a request.
     * @remarks
     * You must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-setcontext">ICertServerPolicy::SetContext</a> prior to using this method.
     * 
     * The following request attributes are unique to KEYGEN style requests.
     * 
     * <table>
     * <tr>
     * <th>Property name</th>
     * <th>Type</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>Challenge</td>
     * <td><b>String</b></td>
     * <td>Challenge string that accompanies the request.</td>
     * </tr>
     * <tr>
     * <td>ExpectedChallenge</td>
     * <td><b>String</b></td>
     * <td>If the challenge string is incorrect, then the server will set the value of this request attribute to the expected challenge so that failure can be diagnosed.</td>
     * </tr>
     * </table>
     * @param {BSTR} strAttributeName The name of the attribute to retrieve.
     * @returns {BSTR} A pointer to a <b>BSTR</b> value that will contain the attribute value.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-getrequestattribute
     */
    GetRequestAttribute(strAttributeName) {
        if(strAttributeName is String) {
            pin := BSTR.Alloc(strAttributeName)
            strAttributeName := pin.Value
        }

        pstrAttributeValue := BSTR()
        result := ComCall(9, this, "ptr", strAttributeName, "ptr", pstrAttributeValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrAttributeValue
    }

    /**
     * Returns a named property from a certificate. (ICertServerPolicy.GetCertificateProperty)
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
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-getcertificateproperty
     */
    GetCertificateProperty(strPropertyName, PropertyType) {
        if(strPropertyName is String) {
            pin := BSTR.Alloc(strPropertyName)
            strPropertyName := pin.Value
        }

        pvarPropertyValue := VARIANT()
        result := ComCall(10, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarPropertyValue
    }

    /**
     * To set a property associated with a certificate.
     * @remarks
     * You must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-setcontext">ICertServerPolicy::SetContext</a> prior to using this method.
     * 
     * The NotBefore and NotAfter certificate properties constrain the lifetime during which a certificate is valid. The data type for these properties is a floating-point <b>VARIANT</b> date derived from COleDateTime in Automation.
     * 
     * The following restrictions apply when setting the NotBefore and NotAfter certificate properties with <b>SetCertificateProperty</b>:
     * 
     * <ul>
     * <li>The NotBefore date cannot be set to a date earlier than the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) certificate's NotBefore date.</li>
     * <li>The NotAfter date cannot be set to a date later than the CA certificate's NotAfter date.</li>
     * <li>The NotBefore date cannot be set to a date earlier than it already is set, even if the new date is later than the CA certificate's NotBefore date.</li>
     * <li>The NotAfter date cannot be set to a date later than it already is set, even if the new date is before the CA certificate's NotAfter date.</li>
     * </ul>
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
     * <div class="alert"><b>Caution</b>  Do not overwrite any mask values returned by <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-getcertificateproperty">GetCertificateProperty</a> when setting this property. Set the value by performing a bitwise <b>OR</b> with the existing values.</div>
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
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-setcertificateproperty
     */
    SetCertificateProperty(strPropertyName, PropertyType, pvarPropertyValue) {
        if(strPropertyName is String) {
            pin := BSTR.Alloc(strPropertyName)
            strPropertyName := pin.Value
        }

        result := ComCall(11, this, "ptr", strPropertyName, "int", PropertyType, "ptr", pvarPropertyValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a specific certificate extension.
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-setcontext">SetContext</a> method must be called prior to calling this method. The call to <b>SetContext</b> specifies which request is used as the current context.
     * 
     * Certificate extensions are distinct from certificate properties. Properties are generic data that is attached to the request. Some of these properties are encoded into the certificate (for example: <i>BeginDate</i>), while others are just used to mark requests in the queue and log. Extensions that are not disabled are encoded into the certificate. Extensions are always marked with an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a>, and always have a critical/noncritical flag.
     * @param {BSTR} strExtensionName A string that contains the name of the extension.
     * @param {Integer} Type 
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> that receives the requested extension value.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-getcertificateextension
     */
    GetCertificateExtension(strExtensionName, Type) {
        if(strExtensionName is String) {
            pin := BSTR.Alloc(strExtensionName)
            strExtensionName := pin.Value
        }

        pvarValue := VARIANT()
        result := ComCall(12, this, "ptr", strExtensionName, "int", Type, "ptr", pvarValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarValue
    }

    /**
     * Retrieves the flags associated with the extension acquired by the most recent call to GetCertificateExtension.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-setcontext">SetContext</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-getcertificateextension">GetCertificateExtension</a> methods must be called before <b>GetCertificateExtensionFlags</b>. The <b>SetContext</b> method specifies which request is used as the current context, and the <b>GetCertificateExtension</b> method retrieves the extensions for the request.
     * 
     * Extensions can contain policy and origin flags. Policy flags provide information about the certificate extension. Policy flags can be set by the policy module. Origin flags indicate the module that set the certificate extension. Origin flags are only set by the server engine.
     * 
     * One or more policy flags can be returned from an extension. The following are predefined policy flags.<table>
     * <tr>
     * <th>Policy flag value</th>
     * <th>Explanation</th>
     * </tr>
     * <tr>
     * <td>EXTENSION_CRITICAL_FLAG</td>
     * <td>This is a critical extension.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_DISABLE_FLAG</td>
     * <td>Extension will not be used.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * One of the following origin flags can also be returned.<table>
     * <tr>
     * <th>Origin flag value</th>
     * <th>Explanation</th>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_REQUEST</td>
     * <td>The extension was extracted from an array of extensions stored in the szOID_CERT_EXTENSIONS (1.3.6.1.4.1.311.2.1.14) or szOID_RSA_certExtensions (1.2.840.113549.1.9.14) attribute of a PKCS #10 request.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_POLICY</td>
     * <td>The policy module set the extension.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_ADMIN</td>
     * <td>The administrator set the extension. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin-setcertificateextension">ICertAdmin::SetCertificateExtension</a>.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_SERVER</td>
     * <td>The server engine set the extension.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_RENEWALCERT</td>
     * <td>The extension was extracted from the certificate stored in the szOID_RENEWAL_CERTIFICATE (1.3.6.1.4.1.311.13.1) attribute of a PKCS #10 renewal request.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_IMPORTEDCERT</td>
     * <td>The extension was extracted from an imported certificate (the certificate was passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin-importcertificate">ICertAdmin::ImportCertificate</a>).</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_PKCS7</td>
     * <td>The extension was extracted from an array of extensions stored in the szOID_CERT_EXTENSIONS (1.3.6.1.4.1.311.2.1.14) or szOID_RSA_certExtensions (1.2.840.113549.1.9.14) attribute of a PKCS #7 request.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * Predefined masks are provided for ease of use in determining which flags are set in the return value. The following masks are provided.<table>
     * <tr>
     * <th>Mask value</th>
     * <th>Explanation</th>
     * </tr>
     * <tr>
     * <td>EXTENSION_POLICY_MASK</td>
     * <td>This value (0x0000FFFF) is used to examine policy flags.</td>
     * </tr>
     * <tr>
     * <td>EXTENSION_ORIGIN_MASK</td>
     * <td>This value (0x000F0000) is used to examine origin flags.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * It is safe to use the high 8 bits of EXTENSION_POLICY_MASK for custom data. These bits will be saved persistently in the database, but will not be written to the certificate extensions.
     * @returns {Integer} A pointer to a <b>LONG</b> variable that contains the extension flags.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-getcertificateextensionflags
     */
    GetCertificateExtensionFlags() {
        result := ComCall(13, this, "int*", &pExtFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pExtFlags
    }

    /**
     * Adds a new extension to the certificate.
     * @remarks
     * Use extensions to include additional information with the certificate, such as supplemental subject or usage information. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/extension-handlers">Extension Handlers</a>.
     * 
     * Call the <b>SetCertificateExtension</b> method from your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/certpol/nf-certpol-icertpolicy-verifyrequest">ICertPolicy2::VerifyRequest</a> method. You must call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-setcontext">ICertServerPolicy::SetContext</a> method before calling the <b>SetCertificateExtension</b> method.
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
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-setcertificateextension
     */
    SetCertificateExtension(strExtensionName, Type, ExtFlags, pvarValue) {
        if(strExtensionName is String) {
            pin := BSTR.Alloc(strExtensionName)
            strExtensionName := pin.Value
        }

        result := ComCall(14, this, "ptr", strExtensionName, "int", Type, "int", ExtFlags, "ptr", pvarValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the internal enumeration pointer to the first certificate extension associated with the current context. (ICertServerPolicy.EnumerateExtensionsSetup)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-setcontext">SetContext</a> method must be called prior to calling this method. The call to <b>SetContext</b> specifies which request is the current context.
     * 
     * To retrieve the extension, call the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateextensions">EnumerateExtensions</a> method. The call to <b>EnumerateExtensions</b> retrieves the first extension and moves the index to the next extension if one exists.
     * @param {Integer} Flags This parameter is reserved and must be set to zero.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-enumerateextensionssetup
     */
    EnumerateExtensionsSetup(Flags) {
        result := ComCall(15, this, "int", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the object identifier (OID) of the current extension and moves the internal enumeration pointer to the next extension.
     * @remarks
     * This method enumerates certificate extensions recorded in the database, even those that are disabled and do not appear in the certificate. To determine whether an extension is disabled, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-getcertificateextensionflags">GetCertificateExtensionFlags</a> to test the extension's EXTENSION_DISABLE_FLAG bit.
     * 
     * When done enumerating, call the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateextensionsclose">EnumerateExtensionsClose</a> method to free resources used by the enumeration calls.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that contains the OID of the current extension.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-enumerateextensions
     */
    EnumerateExtensions() {
        pstrExtensionName := BSTR()
        result := ComCall(16, this, "ptr", pstrExtensionName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrExtensionName
    }

    /**
     * Frees the resources connected with extension enumeration.
     * @remarks
     * All policy modules should call the <b>EnumerateExtensionsClose</b> method after calling the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateextensionssetup">EnumerateExtensionsSetup</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateextensions">ICertServerPolicy::EnumerateExtensions</a> methods.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-enumerateextensionsclose
     */
    EnumerateExtensionsClose() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the internal enumeration pointer to the first request attribute associated with the current context. (ICertServerPolicy.EnumerateAttributesSetup)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-setcontext">SetContext</a> method must be called prior to calling this method. The call to <b>SetContext</b> specifies which request to use as the current context.
     * 
     * To retrieve the attribute, call the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateattributes">EnumerateAttributes</a> method. The call to <b>EnumerateAttributes</b> retrieves the first attribute and moves the index to the next attribute if one exists.
     * @param {Integer} Flags This parameter is reserved and must be set to zero.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-enumerateattributessetup
     */
    EnumerateAttributesSetup(Flags) {
        result := ComCall(18, this, "int", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the name of the current attribute and moves the internal enumeration pointer to the next attribute.
     * @remarks
     * Before calling the <b>EnumerateAttributes</b>  method for the first time, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateattributessetup">EnumerateAttributesSetup</a> method to initialize the enumeration pointer to the first attribute.
     * 
     *  When done enumerating, call  
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateattributesclose">EnumerateAttributesClose</a> method to free resources used by the enumeration calls.
     * @returns {BSTR} A pointer to the attribute name.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-enumerateattributes
     */
    EnumerateAttributes() {
        pstrAttributeName := BSTR()
        result := ComCall(19, this, "ptr", pstrAttributeName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrAttributeName
    }

    /**
     * Frees the resources connected with attribute enumeration.
     * @remarks
     * All policy modules should call the <b>EnumerateAttributesClose</b> method after calling the <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateattributessetup">EnumerateAttributesSetup</a> and  
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nf-certif-icertserverpolicy-enumerateattributes">EnumerateAttributes</a> methods.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certif/nf-certif-icertserverpolicy-enumerateattributesclose
     */
    EnumerateAttributesClose() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
