#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct CCM_SPECIAL {
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
    static CCM_SPECIAL_SEPARATOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_SUBMENU => 2

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_DEFAULT_ITEM => 4

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_INSERTION_POINT => 8

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_TESTONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static CCM_SPECIAL_ELEVATION_ICON => 32
}
