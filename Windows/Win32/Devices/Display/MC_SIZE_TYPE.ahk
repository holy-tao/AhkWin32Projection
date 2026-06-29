#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to get or set the width or height of a monitor's display area.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_size_type
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MC_SIZE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Width.
     * @type {Integer (Int32)}
     */
    static MC_WIDTH => 0

    /**
     * Height.
     * @type {Integer (Int32)}
     */
    static MC_HEIGHT => 1
}
