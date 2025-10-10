#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags to use when importing a PFX certificate.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-importpfxflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ImportPFXFlags{

    /**
     * None
     * @type {Integer (Int32)}
     */
    static ImportNone => 0

    /**
     * Import the PFX certificate into the machine certificate store; otherwise install to the user certificate store.
     * @type {Integer (Int32)}
     */
    static ImportMachineContext => 1

    /**
     * Overwrite existing certificate, if exists.
     * @type {Integer (Int32)}
     */
    static ImportForceOverwrite => 2

    /**
     * Silently perform the operation (do not show a user interface).
     * @type {Integer (Int32)}
     */
    static ImportSilent => 4

    /**
     * Save Properties on the imported PFX file.
     * @type {Integer (Int32)}
     */
    static ImportSaveProperties => 8

    /**
     * Import the PFX certificate’s private key as exportable
     * @type {Integer (Int32)}
     */
    static ImportExportable => 16

    /**
     * Import the PFX certificate’s private key as exportable and encrypted.
     * @type {Integer (Int32)}
     */
    static ImportExportableEncrypted => 32

    /**
     * Import the PFX certificate’s private key to not require consent.
     * @type {Integer (Int32)}
     */
    static ImportNoUserProtected => 64

    /**
     * Import the PFX certificate’s private key to require consent without a password.
     * @type {Integer (Int32)}
     */
    static ImportUserProtected => 128

    /**
     * Import the PFX certificate’s private key to require consent with a password.
     * @type {Integer (Int32)}
     */
    static ImportUserProtectedHigh => 256

    /**
     * Install the PFX certificate to the certificate store.
     * @type {Integer (Int32)}
     */
    static ImportInstallCertificate => 512

    /**
     * Install the PFX certificate’s chain to the certificate store.
     * @type {Integer (Int32)}
     */
    static ImportInstallChain => 1024

    /**
     * Install the PFX certificate’s chain and root to the certificate store.
     * @type {Integer (Int32)}
     */
    static ImportInstallChainAndRoot => 2048
}
