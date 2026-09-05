#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Flags to use when importing a PFX certificate.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-importpfxflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class ImportPFXFlags extends Win32Enum {

    /**
     * None
     * Native name: ImportNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Import the PFX certificate into the machine certificate store; otherwise install to the user certificate store.
     * Native name: ImportMachineContext
     * @type {Integer (Int32)}
     */
    static MachineContext => 1

    /**
     * Overwrite existing certificate, if exists.
     * Native name: ImportForceOverwrite
     * @type {Integer (Int32)}
     */
    static ForceOverwrite => 2

    /**
     * Silently perform the operation (do not show a user interface).
     * Native name: ImportSilent
     * @type {Integer (Int32)}
     */
    static Silent => 4

    /**
     * Save Properties on the imported PFX file.
     * Native name: ImportSaveProperties
     * @type {Integer (Int32)}
     */
    static SaveProperties => 8

    /**
     * Import the PFX certificate’s private key as exportable
     * Native name: ImportExportable
     * @type {Integer (Int32)}
     */
    static Exportable => 16

    /**
     * Import the PFX certificate’s private key as exportable and encrypted.
     * Native name: ImportExportableEncrypted
     * @type {Integer (Int32)}
     */
    static ExportableEncrypted => 32

    /**
     * Import the PFX certificate’s private key to not require consent.
     * Native name: ImportNoUserProtected
     * @type {Integer (Int32)}
     */
    static NoUserProtected => 64

    /**
     * Import the PFX certificate’s private key to require consent without a password.
     * Native name: ImportUserProtected
     * @type {Integer (Int32)}
     */
    static UserProtected => 128

    /**
     * Import the PFX certificate’s private key to require consent with a password.
     * Native name: ImportUserProtectedHigh
     * @type {Integer (Int32)}
     */
    static UserProtectedHigh => 256

    /**
     * Install the PFX certificate to the certificate store.
     * Native name: ImportInstallCertificate
     * @type {Integer (Int32)}
     */
    static InstallCertificate => 512

    /**
     * Install the PFX certificate’s chain to the certificate store.
     * Native name: ImportInstallChain
     * @type {Integer (Int32)}
     */
    static InstallChain => 1024

    /**
     * Install the PFX certificate’s chain and root to the certificate store.
     * Native name: ImportInstallChainAndRoot
     * @type {Integer (Int32)}
     */
    static InstallChainAndRoot => 2048
}
