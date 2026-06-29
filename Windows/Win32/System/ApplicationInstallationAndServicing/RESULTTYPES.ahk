#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct RESULTTYPES {
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
    static ieUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ieError => 1

    /**
     * @type {Integer (Int32)}
     */
    static ieWarning => 2

    /**
     * @type {Integer (Int32)}
     */
    static ieInfo => 3
}
