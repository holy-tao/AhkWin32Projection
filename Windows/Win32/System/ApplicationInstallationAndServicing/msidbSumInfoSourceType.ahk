#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct msidbSumInfoSourceType {
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
    static msidbSumInfoSourceTypeSFN => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbSumInfoSourceTypeCompressed => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbSumInfoSourceTypeAdminImage => 4

    /**
     * @type {Integer (Int32)}
     */
    static msidbSumInfoSourceTypeLUAPackage => 8
}
