#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how much of a certificate chain is included when creating a Personal Information Exchange (PFX) message.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-pfxexportoptions
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class PFXExportOptions{

    /**
     * Includes only the end entity certificate.
     * @type {Integer (Int32)}
     */
    static PFXExportEEOnly => 0

    /**
     * Includes the certificate chain without the root <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> certificate.
     * @type {Integer (Int32)}
     */
    static PFXExportChainNoRoot => 1

    /**
     * Includes the entire certificate chain, including the root certification authority certificate.
     * @type {Integer (Int32)}
     */
    static PFXExportChainWithRoot => 2
}
