#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Server certificates are sent when an HTTPS connection is opened. Use this method to implement a callback to be called to validate those server certificates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/bits10_3/nn-bits10_3-ibackgroundcopyservercertificatevalidationcallback
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyServerCertificateValidationCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyServerCertificateValidationCallback
     * @type {Guid}
     */
    static IID => Guid("{4cec0d02-def7-4158-813a-c32a46945ff7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ValidateServerCertificate"]

    /**
     * A callback method that you implement that will be called so that you can validate the server certificates sent when an HTTPS connection is opened.
     * @remarks
     * Certificate validation is performed in two phases. The first phase is the operating system (OS) phase where the OS performs a standard set of validation checks on the certificate. After that, if the OS phase passes the certificate, your callback will be called to perform additional validation.
     * 
     * Implement this validation method when you want to perform your own checks on the server certificate. Your own checks are in addition to the normal OS certificate validation checks.
     * 
     * If your validation method declines the certificate, the job will transition to **BG_JOB_STATE_TRANSIENT_ERROR** with a job error context of **BG_ERROR_CONTEXT_SERVER_CERTIFICATE_CALLBACK** and the error **HRESULT** from your callback. If your callback couldn't be called (for example, because BITS needed to validate a server certificate after your program exited), then the job error code will be **BG_E_SERVER_CERT_VALIDATION_INTERFACE_REQUIRED**. When your application is next run, it can fix this error by setting the validation callback again and resuming the job.
     * 
     * BITS calls this callback method only if you implement the [IBackgroundCopyServerCertificateValidationCallback](/windows/desktop/api/bits10_3/nn-bits10_3-ibackgroundcopyservercertificatevalidationcallback) interface and pass it into [IBackgroundCopyJobHttpOptions3::SetServerCertificateValidationInterface](/windows/desktop/api/bits10_3/nf-bits10_3-ibackgroundcopyjobhttpoptions3-setservercertificatevalidationinterface).
     * 
     * The validation interface becomes invalid when your application terminates; BITS does not maintain a record of the validation interface. As a result, your application's initialization process should call [SetServerCertificateValidationInterface](/windows/desktop/api/bits10_3/nf-bits10_3-ibackgroundcopyjobhttpoptions3-setservercertificatevalidationinterface) on those existing jobs for which you want to receive certificate validation requests.
     * 
     * If more than one application calls **SetServerCertificateValidationInterface** to set the notification interface for the job, the last application to call it is the one that will receive notifications. The other applications will not receive notifications.
     * 
     * Here are the general steps to validate a certificate. Be aware that these steps are just an example. The actual validation is under your control. Also, steps 5-7 are largely the same as what the OS does during the OS validation step.
     * 
     * 1. Call [CertCreateCertificateContext](/windows/desktop/api/wincrypt/nf-wincrypt-certcreatecertificatecontext) with `certEncodingType`, `certData`, and `certLength` to retrieve a [CERT_CONTEXT](/windows/desktop/api/wincrypt/ns-wincrypt-cert_context).
     * 
     * 2. Declare and initialize a **CRYPT_DATA_BLOB** structure (defined in `wincrypt.h`) with the serialized memory blob passed via `certStoreLength` and `certStoreData`.
     * 
     * ```cpp
     * DATA_BLOB storeData{};
     * storeData.cbData = certStoreLength;
     * storeData.pbData = const_cast<PBYTE>(certStoreData);
     * ```
     * 
     * 3. Obtain a handle to the certificate chain by calling [CertOpenStore](/windows/desktop/api/wincrypt/nf-wincrypt-certopenstore) with **CERT_STORE_PROV_SERIALIZED**, 0, nullptr, flags, and a pointer to the **CRYPT_DATA_BLOB** from step 2.
     * 4. Obtain a pointer to a certificate chain context by calling [CertGetCertificateChain](/windows/desktop/api/wincrypt/nf-wincrypt-certgetcertificatechain) with nullptr, `certContext`, nullptr, the handle from step 3, chain parameters, flags, and nullptr.
     * 5. Create the certificate validation policy.
     * 
     * ```cpp
     * CERT_CHAIN_POLICY_PARA policyParams{};
     * policyParams.cbSize = sizeof(policyParams);
     * policyParams.dwFlags =
     *     CERT_CHAIN_POLICY_IGNORE_NOT_TIME_VALID_FLAG |
     *     CERT_CHAIN_POLICY_IGNORE_WRONG_USAGE_FLAG |
     *     CERT_CHAIN_POLICY_IGNORE_INVALID_NAME_FLAG |
     *     CERT_CHAIN_POLICY_ALLOW_UNKNOWN_CA_FLAG;
     * ```
     * 
     * 6. Call [CertVerifyCertificateChainPolicy](/windows/desktop/api/wincrypt/nf-wincrypt-certverifycertificatechainpolicy) with policy type, chain context, policy parameters, and policy status.
     * 7. Convert the Win32 error (`policyStatus.dwError`) to an HRESULT and return that.
     * 
     * A description of the BITS validation caching behaviors follows. BITS maintains a per-job cache of certificates that have passed custom validation. This is to avoid redundant and potentially expensive re-validation over the lifetime of the job. The cache consists of \<server endpoint, cert hash\> tuples, where *endpoint* is defined as *server name:port*. If a job has already allowed a specific certificate from a specific endpoint, then the callback will not be called again.
     * 
     * Of course, the certificate will have to pass through the OS validation logic on every connection attempt (you can customize the OS validation logic with a call to [IBackgroundCopyJobHttpOptions::SetSecurityFlags](/windows/desktop/api/bits2_5/nf-bits2_5-ibackgroundcopyjobhttpoptions-setsecurityflags)), which addresses time-sensitive corner cases such as when the certificate was valid very recently (in terms of seconds), but it has expired now.
     * 
     * BITS does not cache certificates that are deemed invalid by the app-provided validation callback. It's important that you're aware of all unsuccessful connection attempts, so that you can detect malicious deployments at the app level. For example, a one-off bad certificate is much less concerning than thousands of bad certificates from the same server.
     * 
     * A job's certificate cache is cleared on every call to **SetServerCertificateValidationInterface**, since it indicates that the app's server certificate validation logic has changed.
     * @param {IBackgroundCopyJob} job Type: **[IBackgroundCopyJob](/windows/desktop/api/bits/nn-bits-ibackgroundcopyjob)\***
     * 
     * The job.
     * @param {IBackgroundCopyFile} file Type: **[IBackgroundCopyFile](/windows/desktop/api/bits/nn-bits-ibackgroundcopyfile)\***
     * 
     * The file being transferred.
     * @param {Integer} certLength Type: **[DWORD](/windows/desktop/winprog/windows-data-types)**
     * 
     * The length in bytes of the certificate data.
     * @param {Pointer<Integer>} certData Type: **const [BYTE](/windows/desktop/winprog/windows-data-types) \[\]**
     * 
     * An array of bytes containing the certificate data. The number of bytes must match `certLength`.
     * @param {Integer} certEncodingType Type: **[DWORD](/windows/desktop/winprog/windows-data-types)**
     * 
     * The certificate encoding type.
     * @param {Integer} certStoreLength Type: **[DWORD](/windows/desktop/winprog/windows-data-types)**
     * 
     * The length in bytes of the certificate store data.
     * @param {Pointer<Integer>} certStoreData Type: **const [BYTE](/windows/desktop/winprog/windows-data-types) \[\]**
     * 
     * An array of bytes containing the certificate store data. The number of bytes must match `certStoreLength`.
     * @returns {HRESULT} Return **S_OK** to indicate that the certificate is acceptable. Otherwise, return any [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) [error code](/windows/desktop/com/com-error-codes-10) to indicate that the certificate is not acceptable.
     * @see https://learn.microsoft.com/windows/win32/api/bits10_3/nf-bits10_3-ibackgroundcopyservercertificatevalidationcallback-validateservercertificate
     */
    ValidateServerCertificate(job, file, certLength, certData, certEncodingType, certStoreLength, certStoreData) {
        certDataMarshal := certData is VarRef ? "char*" : "ptr"
        certStoreDataMarshal := certStoreData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", job, "ptr", file, "uint", certLength, certDataMarshal, certData, "uint", certEncodingType, "uint", certStoreLength, certStoreDataMarshal, certStoreData, "HRESULT")
        return result
    }
}
