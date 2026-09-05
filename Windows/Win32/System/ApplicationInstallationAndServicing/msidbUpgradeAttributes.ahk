#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbUpgradeAttributes extends Win32Enum {

    /**
     * Native name: msidbUpgradeAttributesMigrateFeatures
     * @type {Integer (Int32)}
     */
    static MigrateFeatures => 1

    /**
     * Native name: msidbUpgradeAttributesOnlyDetect
     * @type {Integer (Int32)}
     */
    static OnlyDetect => 2

    /**
     * Native name: msidbUpgradeAttributesIgnoreRemoveFailure
     * @type {Integer (Int32)}
     */
    static IgnoreRemoveFailure => 4

    /**
     * Native name: msidbUpgradeAttributesVersionMinInclusive
     * @type {Integer (Int32)}
     */
    static VersionMinInclusive => 256

    /**
     * Native name: msidbUpgradeAttributesVersionMaxInclusive
     * @type {Integer (Int32)}
     */
    static VersionMaxInclusive => 512

    /**
     * Native name: msidbUpgradeAttributesLanguagesExclusive
     * @type {Integer (Int32)}
     */
    static LanguagesExclusive => 1024
}
