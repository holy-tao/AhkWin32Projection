#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * BLUETOOTH_IO_CAPABILITY enumeration defines the input/output capabilities of a Bluetooth Device.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_io_capability
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class BLUETOOTH_IO_CAPABILITY extends Win32Enum {

    /**
     * The Bluetooth device is capable of output via display only.
     * Native name: BLUETOOTH_IO_CAPABILITY_DISPLAYONLY
     * @type {Integer (Int32)}
     */
    static DISPLAYONLY => 0

    /**
     * The Bluetooth device is capable of output via a display, and has the additional capability to presenting a yes/no question to the user.
     * Native name: BLUETOOTH_IO_CAPABILITY_DISPLAYYESNO
     * @type {Integer (Int32)}
     */
    static DISPLAYYESNO => 1

    /**
     * The Bluetooth device is capable of input via keyboard.
     * Native name: BLUETOOTH_IO_CAPABILITY_KEYBOARDONLY
     * @type {Integer (Int32)}
     */
    static KEYBOARDONLY => 2

    /**
     * The Bluetooth device is not capable of input/output.
     * Native name: BLUETOOTH_IO_CAPABILITY_NOINPUTNOOUTPUT
     * @type {Integer (Int32)}
     */
    static NOINPUTNOOUTPUT => 3

    /**
     * The input/output capabilities for the Bluetooth device are undefined.
     * Native name: BLUETOOTH_IO_CAPABILITY_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 255
}
