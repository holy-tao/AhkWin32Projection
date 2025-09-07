#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbUpgradeAttributes{

    /**
     * @type {Integer (Int32)}
     */
    static msidbUpgradeAttributesMigrateFeatures => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbUpgradeAttributesOnlyDetect => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbUpgradeAttributesIgnoreRemoveFailure => 4

    /**
     * @type {Integer (Int32)}
     */
    static msidbUpgradeAttributesVersionMinInclusive => 256

    /**
     * @type {Integer (Int32)}
     */
    static msidbUpgradeAttributesVersionMaxInclusive => 512

    /**
     * @type {Integer (Int32)}
     */
    static msidbUpgradeAttributesLanguagesExclusive => 1024
}
