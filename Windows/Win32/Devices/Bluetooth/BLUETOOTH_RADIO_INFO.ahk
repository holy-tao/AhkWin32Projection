#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BLUETOOTH_ADDRESS.ahk" { BLUETOOTH_ADDRESS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a Bluetooth radio.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_radio_info
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_RADIO_INFO {
    #StructPack 8

    /**
     * Size, in bytes,  of the structure.
     */
    dwSize : UInt32

    /**
     * Address of the local Bluetooth radio.
     */
    address : BLUETOOTH_ADDRESS

    /**
     * Name of the local Bluetooth radio.
     */
    szName : WCHAR[248]

    /**
     * Device class for the local Bluetooth radio.
     */
    ulClassofDevice : UInt32

    /**
     * This member contains data specific to individual Bluetooth device manufacturers.
     */
    lmpSubversion : UInt16

    /**
     * Manufacturer of the Bluetooth radio, expressed as a <b>BTH_MFG_Xxx</b> value. For more information about the Bluetooth assigned numbers document and a current list of values, see the Bluetooth specification at <a href="https://www.bluetooth.com/">www.bluetooth.com</a>.
     */
    manufacturer : UInt16

}
