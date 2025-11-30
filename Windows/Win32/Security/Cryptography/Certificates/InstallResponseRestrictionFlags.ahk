#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that identify the restrictions placed on the local installation of a certificate chain.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-installresponserestrictionflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class InstallResponseRestrictionFlags extends Win32Enum{

    /**
     * Does not allow the installation of untrusted certificates or certificates for which there is no corresponding request.
     * @type {Integer (Int32)}
     */
    static AllowNone => 0

    /**
     * Creates the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> from the certificate response rather than from the dummy certificate. This makes the dummy certificate optional. If this value is not set, the dummy certificate must exist, and the private key is extracted from it.
     * @type {Integer (Int32)}
     */
    static AllowNoOutstandingRequest => 1

    /**
     * Installs untrusted end entity and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> certificates. Certification authority certificates include root and subordinate certification authority certificates. End entity certificates are installed to the personal store, and certification authority certificates are installed to the certification authority store.
     * @type {Integer (Int32)}
     */
    static AllowUntrustedCertificate => 2

    /**
     * Performs the same action as the <b>AllowUntrustedCertificate</b> flag but also installs the certificate even if the certificate chain cannot be built because the root is not trusted.
     * 
     * <div class="alert"><b>Note</b>  On Windows Vista, the behavior of this flag is the same as that defined for the <b>AllowUntrustedCertificate</b> flag. You can install an untrusted root beginning with Windows Vista with SP1.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static AllowUntrustedRoot => 4
}
