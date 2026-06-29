#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct msidbLocatorType {
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
    static msidbLocatorTypeDirectory => 0

    /**
     * @type {Integer (Int32)}
     */
    static msidbLocatorTypeFileName => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbLocatorTypeRawValue => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbLocatorType64bit => 16
}
