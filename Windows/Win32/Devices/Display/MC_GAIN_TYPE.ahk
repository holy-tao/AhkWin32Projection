#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to get or set a monitor's red, green, or blue gain.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_gain_type
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MC_GAIN_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Red gain.
     * @type {Integer (Int32)}
     */
    static MC_RED_GAIN => 0

    /**
     * Green gain.
     * @type {Integer (Int32)}
     */
    static MC_GREEN_GAIN => 1

    /**
     * Blue gain.
     * @type {Integer (Int32)}
     */
    static MC_BLUE_GAIN => 2
}
