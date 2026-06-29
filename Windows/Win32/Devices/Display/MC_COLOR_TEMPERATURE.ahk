#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a monitor's color temperature.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_color_temperature
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MC_COLOR_TEMPERATURE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Unknown temperature.
     * @type {Integer (Int32)}
     */
    static MC_COLOR_TEMPERATURE_UNKNOWN => 0

    /**
     * 4,000 kelvins (K).
     * @type {Integer (Int32)}
     */
    static MC_COLOR_TEMPERATURE_4000K => 1

    /**
     * 5,000 K.
     * @type {Integer (Int32)}
     */
    static MC_COLOR_TEMPERATURE_5000K => 2

    /**
     * 6,500 K.
     * @type {Integer (Int32)}
     */
    static MC_COLOR_TEMPERATURE_6500K => 3

    /**
     * 7,500 K.
     * @type {Integer (Int32)}
     */
    static MC_COLOR_TEMPERATURE_7500K => 4

    /**
     * 8,200 K.
     * @type {Integer (Int32)}
     */
    static MC_COLOR_TEMPERATURE_8200K => 5

    /**
     * 9,300 K
     * @type {Integer (Int32)}
     */
    static MC_COLOR_TEMPERATURE_9300K => 6

    /**
     * 10,000 K.
     * @type {Integer (Int32)}
     */
    static MC_COLOR_TEMPERATURE_10000K => 7

    /**
     * 11,500 K.
     * @type {Integer (Int32)}
     */
    static MC_COLOR_TEMPERATURE_11500K => 8
}
