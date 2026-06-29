#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * BLUETOOTH_IO_CAPABILITY enumeration defines the input/output capabilities of a Bluetooth Device.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_io_capability
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_IO_CAPABILITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The Bluetooth device is capable of output via display only.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_IO_CAPABILITY_DISPLAYONLY => 0

    /**
     * The Bluetooth device is capable of output via a display, and has the additional capability to presenting a yes/no question to the user.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_IO_CAPABILITY_DISPLAYYESNO => 1

    /**
     * The Bluetooth device is capable of input via keyboard.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_IO_CAPABILITY_KEYBOARDONLY => 2

    /**
     * The Bluetooth device is not capable of input/output.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_IO_CAPABILITY_NOINPUTNOOUTPUT => 3

    /**
     * The input/output capabilities for the Bluetooth device are undefined.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_IO_CAPABILITY_UNDEFINED => 255
}
