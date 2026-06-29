#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 */
export default struct SERENUM_PORTION {
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
    static SerenumFirstHalf => 0

    /**
     * @type {Integer (Int32)}
     */
    static SerenumSecondHalf => 1

    /**
     * @type {Integer (Int32)}
     */
    static SerenumWhole => 2
}
