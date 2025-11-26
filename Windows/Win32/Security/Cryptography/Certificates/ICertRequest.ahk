#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides communications between a client or intermediary application and Certificate services.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertrequest
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertRequest extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertRequest
     * @type {Guid}
     */
    static IID => Guid("{014e4840-5523-11d0-8812-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Submit", "RetrievePending", "GetLastStatus", "GetRequestId", "GetDispositionMessage", "GetCACertificate", "GetCertificate"]

    /**
     * Submits a request to the Certificate Services server.
     * @param {Integer} Flags Specifies the request format, type of request, and whether the request is encrypted. One of the following format attribute flags can be used to specify how the request is encoded. 
     * 
     * 
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
     * <td width="40%"><a id="CR_IN_BASE64"></a><a id="cr_in_base64"></a><dl>
     * <dt><b>CR_IN_BASE64</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unicode BASE64 format without begin/end.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_BASE64HEADER"></a><a id="cr_in_base64header"></a><dl>
     * <dt><b>CR_IN_BASE64HEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unicode BASE64 format with begin/end.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_BINARY"></a><a id="cr_in_binary"></a><dl>
     * <dt><b>CR_IN_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_ENCODEANY"></a><a id="cr_in_encodeany"></a><dl>
     * <dt><b>CR_IN_ENCODEANY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Try all of the CR_IN_BASE64HEADER, CR_IN_BASE64, or CR_IN_BINARY formats.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * One of the following format value flags can be used to specify the type of the request.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_RETURNCHALLENGE"></a><a id="cr_in_returnchallenge"></a><dl>
     * <dt><b>CR_IN_RETURNCHALLENGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return a challenge that can be submitted to a CA. The challenge is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Management over CMS</a> (CMC)  full request. When this flag is turned on, calling the <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nf-certcli-icertrequest2-getfullresponseproperty">GetFullResponseProperty</a> method with the FR_PROP_FULLRESPONSE flag returns a CMC response that contains key attestation challenge.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_CHALLENGERESPONSE"></a><a id="cr_in_challengeresponse"></a><dl>
     * <dt><b>CR_IN_CHALLENGERESPONSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call is a response to a challenge. The RequestId must be passed in the <i>strAttributes</i> parameter and the response to the challenge must be passed in the <i>strRequest</i> parameter.  This flag should be turned on when an application needs to send back the decrypted challenge to the CA. You can then call the <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nf-certcli-icertrequest2-getfullresponseproperty">GetFullResponseProperty</a> method to get the issued end entity certificate.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_CMC"></a><a id="cr_in_cmc"></a><dl>
     * <dt><b>CR_IN_CMC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Management over CMS</a> (CMC) request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_FORMATANY"></a><a id="cr_in_formatany"></a><dl>
     * <dt><b>CR_IN_FORMATANY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Try all of the CR_IN_CMC, CR_IN_KEYGEN, CR_IN_PKCS7,  or CR_IN_PKCS10 formats.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_KEYGEN"></a><a id="cr_in_keygen"></a><dl>
     * <dt><b>CR_IN_KEYGEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keygen request (Netscape format).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_PKCS7"></a><a id="cr_in_pkcs7"></a><dl>
     * <dt><b>CR_IN_PKCS7</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">PKCS #7</a> request (renewal or registration agent).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_PKCS10"></a><a id="cr_in_pkcs10"></a><dl>
     * <dt><b>CR_IN_PKCS10</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * PKCS #10 request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_RPC"></a><a id="cr_in_rpc"></a><dl>
     * <dt><b>CR_IN_RPC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transmit the messages using RPC instead of DCOM.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_FULLRESPONSE"></a><a id="cr_in_fullresponse"></a><dl>
     * <dt><b>CR_IN_FULLRESPONSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Return a full CMC response.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_CRLS"></a><a id="cr_in_crls"></a><dl>
     * <dt><b>CR_IN_CRLS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include the current certificate revocation lists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_MACHINE"></a><a id="cr_in_machine"></a><dl>
     * <dt><b>CR_IN_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the context of the key service computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_ROBO"></a><a id="cr_in_robo"></a><dl>
     * <dt><b>CR_IN_ROBO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the message is being requested on behalf of another sender.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) is not configured for "renew on behalf of", then the CA rejects the request.
     *  
     * 
     * For more information about enabling "renew on behalf of" on the CA, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd759245(v=ws.11)">Configuring the Certificate Enrollment Web Service for Renewal Only Mode</a>.
     * 
     * The request must be a renewal request and the signing certificate must be using the same template as the request.
     * 
     * In addition, the request will succeed only when one of the following conditions is true:
     * 
     * <ul>
     * <li>The signing certificate must have been issued by the same CA</li>
     * <li>The signing certificate's SAN2 extension has the UPN of the subject</li>
     * <li>The signing certificate's Subject Name has the FQDN_1779 of the subject</li>
     * </ul>
     * <b>Windows Server 2008 and Windows Server 2003:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_CLIENTIDNONE"></a><a id="cr_in_clientidnone"></a><dl>
     * <dt><b>CR_IN_CLIENTIDNONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not include in the request data that identifies the client.
     * 
     * <b>Windows Server 2008 and Windows Server 2003:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_IN_CONNECTONLY"></a><a id="cr_in_connectonly"></a><dl>
     * <dt><b>CR_IN_CONNECTONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the DCOM connection with the server is established, but the request is not  submitted.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BSTR} strRequest A pointer to the string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a>. If CR_IN_BASE64 or CR_IN_BASE64HEADER was specified in <i>Flags</i>, <i>strRequest</i> must be a Unicode string.
     * @param {BSTR} strAttributes A pointer to the string that contains optional extra <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> for the request. Each attribute is a name-value string pair. The colon character separates the name and value, and a newline character separates multiple name-value pairs, for example:
     * 
     * <table>
     * <tr>
     * <td><strong>C++</strong></td>
     * <td>
     *  "AttributeName1:AttributeValue1\nAttributeName2:AttributeValue2"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><strong>VB</strong></td>
     * <td>
     *  "AttributeName1:AttributeValue1" &amp; vbNewLine &amp; "AttributeName2:AttributeValue2"
     * 
     * </td>
     * </tr>
     * </table>
     * When Certificate Services server parses attribute names, it ignores spaces, hyphens (minus signs), and case. For example, "AttributeName1", "Attribute Name1", and "Attribute-name1" are all equivalent. For attribute values, Certificate Services server ignores leading and trailing white space.
     * @param {BSTR} strConfig Represents a valid configuration string for the Certificate Services server. The string can be either an HTTPS URL for an enrollment server or in the form <i>ComputerName</i><b>\\</b><i>CAName</i>, where <i>ComputerName</i> is the network name of the server, and <i>CAName</i> is the common name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>An HTTPS URL is not supported as an input.
     * @returns {Integer} A pointer to the request's disposition value.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest-submit
     */
    Submit(Flags, strRequest, strAttributes, strConfig) {
        strRequest := strRequest is String ? BSTR.Alloc(strRequest).Value : strRequest
        strAttributes := strAttributes is String ? BSTR.Alloc(strAttributes).Value : strAttributes
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(7, this, "int", Flags, "ptr", strRequest, "ptr", strAttributes, "ptr", strConfig, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * Retrieves a certificate's disposition status from an earlier request that may have previously returned CR_DISP_INCOMPLETE or CR_DISP_UNDER_SUBMISSION.
     * @param {Integer} RequestId The ID of the request that had previously returned CR_DISP_INCOMPLETE or CR_DISP_UNDER_SUBMISSION.
     * @param {BSTR} strConfig Represents a valid configuration string for the Certificate Services server. The string can be either an HTTPS URL for an enrollment server or in the form <i>ComputerName</i><b>\\</b><i>CAName</i>, where <i>ComputerName</i> is the network name of the server, and <i>CAName</i> is the common name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>An HTTPS URL is not supported as an input.
     * @returns {Integer} A pointer to the request's disposition value.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest-retrievepending
     */
    RetrievePending(RequestId, strConfig) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(8, this, "int", RequestId, "ptr", strConfig, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * Gets the last return code for this request. This returns the error code information, rather than the disposition of the request.
     * @returns {Integer} A pointer to the request's status code.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest-getlaststatus
     */
    GetLastStatus() {
        result := ComCall(9, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Gets the current internal request number for the request and subsequent certificate.
     * @returns {Integer} A pointer to the request ID value.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest-getrequestid
     */
    GetRequestId() {
        result := ComCall(10, this, "int*", &pRequestId := 0, "HRESULT")
        return pRequestId
    }

    /**
     * Gets a human-readable message that gives the current disposition of the certificate request.
     * @returns {BSTR} A pointer to the <b>BSTR</b> that contains the disposition message.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest-getdispositionmessage
     */
    GetDispositionMessage() {
        pstrDispositionMessage := BSTR()
        result := ComCall(11, this, "ptr", pstrDispositionMessage, "HRESULT")
        return pstrDispositionMessage
    }

    /**
     * Returns the certification authority (CA) certificate for the Certificate Services server.
     * @param {Integer} fExchangeCertificate A Boolean value that specifies which CA certificate to return. If <i>fExchangeCertificate</i> is set to <b>false</b>, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">signature certificate</a> of the CA will be returned. The Signature certificate of the CA can be used to verify signatures on certificates issued by the CA.
     * 
     * <b>Windows Server 2003:  </b>If <i>fExchangeCertificate</i> is set to <b>true</b>, the Exchange certificate of the CA will be returned. The Exchange certificate of the CA can be used to encrypt requests sent to the CA.
     * 
     * Beginning with Windows 7 and Windows Server 2008 R2, this parameter is ignored during https:// enrollment and the function, if successful, always returns the CA exchange certificate. To retrieve the CA signing certificate for an enrollment web service, use the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificatetemplate-get_property">Property</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertificationauthority">ICertificationAuthority</a> interface with the CAPropCertificate <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-enrollmentcaproperty">EnrollmentCAProperty</a> enumeration value.
     * 
     * Note that <b>TRUE</b> is defined (in a Microsoft header file) for C/C++ programmers as one, while  Visual Basic defines the <b>True</b> keyword as negative one. As a result, Visual Basic developers must use one (instead of <b>True</b>) to set this parameter to <b>TRUE</b>. However, to set this parameter to <b>FALSE</b>, Visual Basic developers can use zero or <b>False</b>.
     * @param {BSTR} strConfig Represents a valid configuration string for the Certificate Services server. The string can be either an HTTPS URL for an enrollment server or in the form <i>ComputerName</i><b>\\</b><i>CAName</i>, where <i>ComputerName</i> is the network name of the server, and <i>CAName</i> is the common name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>An HTTPS URL is not supported as an input.
     * @param {Integer} Flags The following flags can be used to specify the format of the returned certificate.
     * 
     * 
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
     *  
     * 
     * 
     * The following flag can be combined with the format flag to specify that the complete certificate chain should be included with the requested CA certificate. Otherwise, just the requested CA certificate (in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> format) is returned.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_OUT_CHAIN"></a><a id="cr_out_chain"></a><dl>
     * <dt><b>CR_OUT_CHAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include complete certificate chain in a PKCS #7.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {BSTR} A pointer to the <b>BSTR</b> that contains the CA certificate for the Certificate Services server, in the specified format.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest-getcacertificate
     */
    GetCACertificate(fExchangeCertificate, strConfig, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pstrCertificate := BSTR()
        result := ComCall(12, this, "int", fExchangeCertificate, "ptr", strConfig, "int", Flags, "ptr", pstrCertificate, "HRESULT")
        return pstrCertificate
    }

    /**
     * Returns the certificate issued for the request as an X.509 certificate, or optionally packaged in a Public Key Cryptography Standards (PKCS)
     * @param {Integer} Flags A flag for the format and  whether the complete certificate chain is included.
     * 
     * 
     * The format of the returned certificate
     *                   can be one of the following flags.
     * 
     * 
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
     * BASE64 format with begin/end
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_OUT_BASE64"></a><a id="cr_out_base64"></a><dl>
     * <dt><b>CR_OUT_BASE64</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * BASE64 format without begin/end
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_OUT_BINARY"></a><a id="cr_out_binary"></a><dl>
     * <dt><b>CR_OUT_BINARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Binary format
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * The following flags can be combined with the format flag.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_OUT_CHAIN"></a><a id="cr_out_chain"></a><dl>
     * <dt><b>CR_OUT_CHAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include complete certificate chain in the PKCS #7.
     * 
     *  If this flag is not specified, only the requested certificate, in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.509</a> format, is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CR_OUT_CRLS"></a><a id="cr_out_crls"></a><dl>
     * <dt><b>CR_OUT_CRLS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Include <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation lists</a> (CRLs) in the PKCS #7.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For example, to retrieve a binary certificate with complete certificate chain in C++ you would write the following.
     * 
     * <pre class="syntax" xml:space="preserve"><code>hResult = pCertReq-&gt;GetCACertificate(FALSE, bstrConfig,
     *      CR_OUT_BINARY | CR_OUT_CHAIN, &amp;bstrCert);</code></pre>
     * @returns {BSTR} A pointer to the <b>BSTR</b> that contains the certificate, in the specified format.
     * 
     * When using this method, create a variable of <b>BSTR</b> type, set the variable equal to <b>NULL</b>, and then pass the address of this variable as <i>pstrCertificate</i>. When you have finished using the certificate pointed to by <i>pstrCertificate</i>, free it by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//certcli/nf-certcli-icertrequest-getcertificate
     */
    GetCertificate(Flags) {
        pstrCertificate := BSTR()
        result := ComCall(13, this, "int", Flags, "ptr", pstrCertificate, "HRESULT")
        return pstrCertificate
    }
}
