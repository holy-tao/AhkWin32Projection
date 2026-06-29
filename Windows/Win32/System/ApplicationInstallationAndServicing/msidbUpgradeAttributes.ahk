#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct msidbUpgradeAttributes {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
