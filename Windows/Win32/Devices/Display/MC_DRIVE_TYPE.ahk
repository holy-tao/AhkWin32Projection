#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether to set or get a monitor's red, green, or blue drive.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_drive_type
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MC_DRIVE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Red drive.
     * @type {Integer (Int32)}
     */
    static MC_RED_DRIVE => 0

    /**
     * Green drive.
     * @type {Integer (Int32)}
     */
    static MC_GREEN_DRIVE => 1

    /**
     * Blue drive.
     * @type {Integer (Int32)}
     */
    static MC_BLUE_DRIVE => 2
}
