#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BLUETOOTH_ADDRESS.ahk

/**
 * Contains information about a Bluetooth radio.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_radio_info
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_RADIO_INFO extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * Size, in bytes,  of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Address of the local Bluetooth radio.
     * @type {BLUETOOTH_ADDRESS}
     */
    address{
        get {
            if(!this.HasProp("__address"))
                this.__address := BLUETOOTH_ADDRESS(8, this)
            return this.__address
        }
    }

    /**
     * Name of the local Bluetooth radio.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 24, 247, "UTF-16")
        set => StrPut(value, this.ptr + 24, 247, "UTF-16")
    }

    /**
     * Device class for the local Bluetooth radio.
     * @type {Integer}
     */
    ulClassofDevice {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }

    /**
     * This member contains data specific to individual Bluetooth device manufacturers.
     * @type {Integer}
     */
    lmpSubversion {
        get => NumGet(this, 524, "ushort")
        set => NumPut("ushort", value, this, 524)
    }

    /**
     * Manufacturer of the Bluetooth radio, expressed as a <b>BTH_MFG_Xxx</b> value. For more information about the Bluetooth assigned numbers document and a current list of values, see the Bluetooth specification at <a href="https://www.bluetooth.com/">www.bluetooth.com</a>.
     * @type {Integer}
     */
    manufacturer {
        get => NumGet(this, 526, "ushort")
        set => NumPut("ushort", value, this, 526)
    }
}
