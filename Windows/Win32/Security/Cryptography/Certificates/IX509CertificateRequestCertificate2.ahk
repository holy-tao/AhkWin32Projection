#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IX509CertificateRequestCertificate.ahk

/**
 * The IX509CertificateRequestCertificate2 interface represents a request object for a self-generated certificate, enabling you to create a certificate directly without going through a registration or certification authority.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestcertificate2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestCertificate2 extends IX509CertificateRequestCertificate{
    /**
     * The interface identifier for IX509CertificateRequestCertificate2
     * @type {Guid}
     */
    static IID => Guid("{728ab35a-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 71

    /**
     * 
     * @param {Integer} context 
     * @param {Pointer<IX509EnrollmentPolicyServer>} pPolicyServer 
     * @param {Pointer<IX509CertificateTemplate>} pTemplate 
     * @returns {HRESULT} 
     */
    InitializeFromTemplate(context, pPolicyServer, pTemplate) {
        result := ComCall(71, this, "int", context, "ptr", pPolicyServer, "ptr", pTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {Pointer<IX509PrivateKey>} pPrivateKey 
     * @param {Pointer<IX509EnrollmentPolicyServer>} pPolicyServer 
     * @param {Pointer<IX509CertificateTemplate>} pTemplate 
     * @returns {HRESULT} 
     */
    InitializeFromPrivateKeyTemplate(Context, pPrivateKey, pPolicyServer, pTemplate) {
        result := ComCall(72, this, "int", Context, "ptr", pPrivateKey, "ptr", pPolicyServer, "ptr", pTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509EnrollmentPolicyServer>} ppPolicyServer 
     * @returns {HRESULT} 
     */
    get_PolicyServer(ppPolicyServer) {
        result := ComCall(73, this, "ptr", ppPolicyServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateTemplate>} ppTemplate 
     * @returns {HRESULT} 
     */
    get_Template(ppTemplate) {
        result := ComCall(74, this, "ptr", ppTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
