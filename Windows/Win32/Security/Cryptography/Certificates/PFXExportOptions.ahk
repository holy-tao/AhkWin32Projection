#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies how much of a certificate chain is included when creating a Personal Information Exchange (PFX) message.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-pfxexportoptions
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class PFXExportOptions extends Win32Enum {

    /**
     * Includes only the end entity certificate.
     * Native name: PFXExportEEOnly
     * @type {Integer (Int32)}
     */
    static ExportEEOnly => 0

    /**
     * Includes the certificate chain without the root <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> certificate.
     * Native name: PFXExportChainNoRoot
     * @type {Integer (Int32)}
     */
    static ChainNoRoot => 1

    /**
     * Includes the entire certificate chain, including the root certification authority certificate.
     * Native name: PFXExportChainWithRoot
     * @type {Integer (Int32)}
     */
    static ChainWithRoot => 2
}
