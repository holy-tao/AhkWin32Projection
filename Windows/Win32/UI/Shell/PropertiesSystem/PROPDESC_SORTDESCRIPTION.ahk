#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct PROPDESC_SORTDESCRIPTION {
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
    static PDSD_GENERAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static PDSD_A_Z => 1

    /**
     * @type {Integer (Int32)}
     */
    static PDSD_LOWEST_HIGHEST => 2

    /**
     * @type {Integer (Int32)}
     */
    static PDSD_SMALLEST_BIGGEST => 3

    /**
     * @type {Integer (Int32)}
     */
    static PDSD_OLDEST_NEWEST => 4
}
