#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * BLUETOOTH_PIN_INFO structure contains information used for authentication via PIN.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_pin_info
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_PIN_INFO {
    #StructPack 1

    /**
     * The PIN  used for authentication.
     */
    pin : Int8[16]

    /**
     * The length of <i>pin</i>.
     */
    pinLength : Int8

}
