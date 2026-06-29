#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to get or set the vertical or horizontal position of a monitor's display area.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_position_type
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MC_POSITION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Horizontal position.
     * @type {Integer (Int32)}
     */
    static MC_HORIZONTAL_POSITION => 0

    /**
     * Vertical position.
     * @type {Integer (Int32)}
     */
    static MC_VERTICAL_POSITION => 1
}
