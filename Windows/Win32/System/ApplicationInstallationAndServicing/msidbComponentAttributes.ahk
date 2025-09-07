#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbComponentAttributes{

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesLocalOnly => 0

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesSourceOnly => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesOptional => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesRegistryKeyPath => 4

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesSharedDllRefCount => 8

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesPermanent => 16

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesODBCDataSource => 32

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesTransitive => 64

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesNeverOverwrite => 128

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributes64bit => 256

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesDisableRegistryReflection => 512

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesUninstallOnSupersedence => 1024

    /**
     * @type {Integer (Int32)}
     */
    static msidbComponentAttributesShared => 2048
}
