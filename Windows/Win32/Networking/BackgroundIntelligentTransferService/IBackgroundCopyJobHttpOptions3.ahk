#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJobHttpOptions2.ahk

/**
 * Use this interface to set HTTP customer headers to write-only, or to set a server certificate validation callback method that you've implemented.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/bits10_3/nn-bits10_3-ibackgroundcopyjobhttpoptions3
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJobHttpOptions3 extends IBackgroundCopyJobHttpOptions2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJobHttpOptions3
     * @type {Guid}
     */
    static IID => Guid("{8a9263d3-fd4c-4eda-9b28-30132a4d4e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetServerCertificateValidationInterface", "MakeCustomHeadersWriteOnly"]

    /**
     * Server certificates are sent when an HTTPS connection is opened. Use this method to set a callback to be called to validate those server certificates.
     * @remarks
     * Use this method when you want to perform your own checks on the server certificate.
     * 
     * Call this method only if you implement the [IBackgroundCopyServerCertificateValidationCallback](/windows/desktop/api/bits10_3/nn-bits10_3-ibackgroundcopyservercertificatevalidationcallback) interface.
     * 
     * The validation interface becomes invalid when your application terminates; BITS does not maintain a record of the validation interface. As a result, your application's initialization process should call **SetServerCertificateValidationInterface** on those existing jobs for which you want to receive certificate validation requests.
     * 
     * If more than one application calls **SetServerCertificateValidationInterface** to set the notification interface for the job, the last application to call it is the one that will receive notifications. The other applications will not receive notifications.
     * 
     * If any certificate errors are found during the OS validation of the certificate, then the connection is aborted, and the custom callback is never called. You can customize the OS validation logic with a call to [IBackgroundCopyJobHttpOptions::SetSecurityFlags](/windows/desktop/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setsecurityflags). For example, you can ignore expected certificate validation errors.
     * 
     * If OS validation passes, then the [IBackgroundCopyServerCertificateValidationCallback::ValidateServerCertificate](./nf-bits10_3-ibackgroundcopyservercertificatevalidationcallback-validateservercertificate.md) method is called before completing the TLS handshake and before the HTTP request is sent.
     * 
     * If your validation method declines the certificate, the job will transition to **BG_JOB_STATE_TRANSIENT_ERROR** with a job error context of **BG_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK** and the error **HRESULT** from your callback. If your callback couldn't be called (for example, because BITS needed to validate a server certificate after your program exited), then the job error code will be **BG_E_SERVER_CERT_VALIDATION_INTERFACE_REQUIRED**. When your application is next run, it can fix this error by setting the validation callback again and resuming the job.
     * @param {IUnknown} certValidationCallback Type: **[IUnknown](/windows/desktop/api/unknwn/nn-unknwn-iunknown)\***
     * 
     * A pointer to an object that implements [IBackgroundCopyServerCertificateValidationCallback](/windows/desktop/api/bits10_3/nn-bits10_3-ibackgroundcopyservercertificatevalidationcallback). To remove the current callback interface pointer, set this parameter to `nullptr`.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, it returns **S_OK**. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10).
     * 
     * |Return value|Description|
     * |-|-|
     * |E_NOINTERFACE|You pass an interface pointer that cannot be queried for [IBackgroundCopyServerCertificateValidationCallback](/windows/desktop/api/bits10_3/nn-bits10_3-ibackgroundcopyservercertificatevalidationcallback).|
     * |BG_E_READ_ONLY_WHEN_JOB_ACTIVE|The state of a job must be PAUSED to set the callback.|
     * @see https://learn.microsoft.com/windows/win32/api//content/bits10_3/nf-bits10_3-ibackgroundcopyjobhttpoptions3-setservercertificatevalidationinterface
     */
    SetServerCertificateValidationInterface(certValidationCallback) {
        result := ComCall(13, this, "ptr", certValidationCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the HTTP custom headers for this job to be write-only.
     * @remarks
     * Use this API when your BITS custom headers must include security information (such as an API token) that you don't want to be readable by other programs running on the same computer. The BITS process, of course, can still read these headers, and send them over the HTTP connection. Once the headers are set to write-only, that cannot be unset.
     * @returns {HRESULT} The return value is always **S_OK**.
     * @see https://learn.microsoft.com/windows/win32/api//content/bits10_3/nf-bits10_3-ibackgroundcopyjobhttpoptions3-makecustomheaderswriteonly
     */
    MakeCustomHeadersWriteOnly() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
