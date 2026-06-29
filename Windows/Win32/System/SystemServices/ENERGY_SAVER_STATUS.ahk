#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct ENERGY_SAVER_STATUS {
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
    static ENERGY_SAVER_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static ENERGY_SAVER_STANDARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static ENERGY_SAVER_HIGH_SAVINGS => 2
}
