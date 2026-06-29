#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct UPDATEDRIVERFORPLUGANDPLAYDEVICES_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALLFLAG_FORCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALLFLAG_READONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALLFLAG_NONINTERACTIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALLFLAG_BITS => 7
}
