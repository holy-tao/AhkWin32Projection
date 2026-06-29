#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BLUETOOTH_FIND_RADIO_PARAMS structure facilitates enumerating installed Bluetooth radios.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_find_radio_params
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_FIND_RADIO_PARAMS {
    #StructPack 4

    /**
     * Size of the <b>BLUETOOTH_FIND_RADIO_PARAMS</b> structure, in bytes.
     */
    dwSize : UInt32

}
