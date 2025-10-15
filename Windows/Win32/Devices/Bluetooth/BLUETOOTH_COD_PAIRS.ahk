#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The BLUETOOTH_COD_PAIRS structure provides for specification and retrieval of Bluetooth Class Of Device (COD) information.
 * @remarks
 * 
  * If a minor code is provided in <b>ulCODMask</b> it must also match the minor code returned by the remote device.  A major code must be set if a minor code is specified; zero is not a valid major code.
  * 
  * See the Bluetooth specification at 
  * <a href="https://www.bluetooth.com/">www.bluetooth.com</a> for Class Of Device information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/ns-bluetoothapis-bluetooth_cod_pairs
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_COD_PAIRS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A mask to compare to determine the class of device. The major and minor codes of <b>ulCODMask</b> are used to compare  the class of device found.  If a major code is provided  it must match the major code returned by the remote device, such that GET_COD_MAJOR(ulCODMask) is equal to GET_COD_MAJOR([class of device of the remote device]).
     * @type {Integer}
     */
    ulCODMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Descriptive string of the mask.
     * @type {PWSTR}
     */
    pcszDescription{
        get {
            if(!this.HasProp("__pcszDescription"))
                this.__pcszDescription := PWSTR(this.ptr + 8)
            return this.__pcszDescription
        }
    }
}
