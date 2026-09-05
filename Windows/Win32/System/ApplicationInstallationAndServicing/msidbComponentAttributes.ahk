#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbComponentAttributes extends Win32Enum {

    /**
     * Native name: msidbComponentAttributesLocalOnly
     * @type {Integer (Int32)}
     */
    static LocalOnly => 0

    /**
     * Native name: msidbComponentAttributesSourceOnly
     * @type {Integer (Int32)}
     */
    static SourceOnly => 1

    /**
     * Native name: msidbComponentAttributesOptional
     * @type {Integer (Int32)}
     */
    static Optional => 2

    /**
     * Native name: msidbComponentAttributesRegistryKeyPath
     * @type {Integer (Int32)}
     */
    static RegistryKeyPath => 4

    /**
     * Native name: msidbComponentAttributesSharedDllRefCount
     * @type {Integer (Int32)}
     */
    static SharedDllRefCount => 8

    /**
     * Native name: msidbComponentAttributesPermanent
     * @type {Integer (Int32)}
     */
    static Permanent => 16

    /**
     * Native name: msidbComponentAttributesODBCDataSource
     * @type {Integer (Int32)}
     */
    static AttributesODBCDataSource => 32

    /**
     * Native name: msidbComponentAttributesTransitive
     * @type {Integer (Int32)}
     */
    static Transitive => 64

    /**
     * Native name: msidbComponentAttributesNeverOverwrite
     * @type {Integer (Int32)}
     */
    static NeverOverwrite => 128

    /**
     * Native name: msidbComponentAttributes64bit
     * @type {Integer (Int32)}
     */
    static Attributes64bit => 256

    /**
     * Native name: msidbComponentAttributesDisableRegistryReflection
     * @type {Integer (Int32)}
     */
    static DisableRegistryReflection => 512

    /**
     * Native name: msidbComponentAttributesUninstallOnSupersedence
     * @type {Integer (Int32)}
     */
    static UninstallOnSupersedence => 1024

    /**
     * Native name: msidbComponentAttributesShared
     * @type {Integer (Int32)}
     */
    static Shared => 2048
}
