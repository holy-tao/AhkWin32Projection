#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Can be used to create any of the following objects on a webpage.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollmentwebclassfactory
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509EnrollmentWebClassFactory extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509EnrollmentWebClassFactory
     * @type {Guid}
     */
    static IID => Guid("{728ab349-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateObject"]

    /**
     * Can be used to create an object in the user context on a webpage.
     * @param {BSTR} strProgID A <b>BSTR</b> variable that contains the Prog ID. The following table shows the strings you can use for each object that can be created by using this method.
     * 
     * <table>
     * <tr>
     * <th>Object</th>
     * <th>Prog ID string</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICertProperties"></a><a id="icertproperties"></a><a id="ICERTPROPERTIES"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertproperties">ICertProperties</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CCertProperties"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICertPropertyDescription"></a><a id="icertpropertydescription"></a><a id="ICERTPROPERTYDESCRIPTION"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertydescription">ICertPropertyDescription</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CCertPropertyDescription"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICertPropertyFriendlyName"></a><a id="icertpropertyfriendlyname"></a><a id="ICERTPROPERTYFRIENDLYNAME"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertpropertyfriendlyname">ICertPropertyFriendlyName</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CCertPropertyFriendlyName"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICspInformation"></a><a id="icspinformation"></a><a id="ICSPINFORMATION"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CCspInformation"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICspInformations"></a><a id="icspinformations"></a><a id="ICSPINFORMATIONS"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformations">ICspInformations</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CCspInformations"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ICspStatus"></a><a id="icspstatus"></a><a id="ICSPSTATUS"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CCspStatus"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IObjectId"></a><a id="iobjectid"></a><a id="IOBJECTID"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CObjectId"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IObjectIds"></a><a id="iobjectids"></a><a id="IOBJECTIDS"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectids">IObjectIds</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CObjectIds"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ISignerCertificate"></a><a id="isignercertificate"></a><a id="ISIGNERCERTIFICATE"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-isignercertificate">ISignerCertificate</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CSignerCertificate"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX500DistinguishedName"></a><a id="ix500distinguishedname"></a><a id="IX500DISTINGUISHEDNAME"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix500distinguishedname">IX500DistinguishedName</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX500DistinguishedName"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509CertificateRequestCmc"></a><a id="ix509certificaterequestcmc"></a><a id="IX509CERTIFICATEREQUESTCMC"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestcmc">IX509CertificateRequestCmc</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509CertificateRequestCmc"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509CertificateRequestPkcs10"></a><a id="ix509certificaterequestpkcs10"></a><a id="IX509CERTIFICATEREQUESTPKCS10"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509CertificateRequestPkcs10"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509CertificateRequestPkcs7"></a><a id="ix509certificaterequestpkcs7"></a><a id="IX509CERTIFICATEREQUESTPKCS7"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs7">IX509CertificateRequestPkcs7</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509CertificateRequestPkcs7"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509Enrollment"></a><a id="ix509enrollment"></a><a id="IX509ENROLLMENT"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollment">IX509Enrollment</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509Enrollment"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509EnrollmentHelper"></a><a id="ix509enrollmenthelper"></a><a id="IX509ENROLLMENTHELPER"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509enrollmenthelper">IX509EnrollmentHelper</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509EnrollmentHelper"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509Extension"></a><a id="ix509extension"></a><a id="IX509EXTENSION"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extension">IX509Extension</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509Extension"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509ExtensionEnhancedKeyUsage"></a><a id="ix509extensionenhancedkeyusage"></a><a id="IX509EXTENSIONENHANCEDKEYUSAGE"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionenhancedkeyusage">IX509ExtensionEnhancedKeyUsage</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509ExtensionEnhancedKeyUsage"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509ExtensionKeyUsage"></a><a id="ix509extensionkeyusage"></a><a id="IX509EXTENSIONKEYUSAGE"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensionkeyusage">IX509ExtensionKeyUsage</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509ExtensionKeyUsage"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509Extensions"></a><a id="ix509extensions"></a><a id="IX509EXTENSIONS"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensions">IX509Extensions</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509Extensions"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509ExtensionTemplate"></a><a id="ix509extensiontemplate"></a><a id="IX509EXTENSIONTEMPLATE"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensiontemplate">IX509ExtensionTemplate</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509ExtensionTemplate"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509ExtensionTemplateName"></a><a id="ix509extensiontemplatename"></a><a id="IX509EXTENSIONTEMPLATENAME"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509extensiontemplatename">IX509ExtensionTemplateName</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509ExtensionTemplateName"
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IX509PrivateKey"></a><a id="ix509privatekey"></a><a id="IX509PRIVATEKEY"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * "X509Enrollment.CX509PrivateKey"
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IUnknown} Address of a variable that receives a pointer to an  <b>IUnknown</b> interface that represents the created object.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509enrollmentwebclassfactory-createobject
     */
    CreateObject(strProgID) {
        strProgID := strProgID is String ? BSTR.Alloc(strProgID).Value : strProgID

        result := ComCall(7, this, "ptr", strProgID, "ptr*", &ppIUnknown := 0, "HRESULT")
        return IUnknown(ppIUnknown)
    }
}
