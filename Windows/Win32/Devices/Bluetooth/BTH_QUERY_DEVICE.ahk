#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BTH_QUERY_DEVICE structure is used when querying for the presence of a Bluetooth device.
 * @remarks
 * See the Bluetooth specification at 
  * <a href="https://www.bluetooth.com/">www.bluetooth.com</a> for additional information about LAP.
 * @see https://learn.microsoft.com/windows/win32/api/ws2bth/ns-ws2bth-bth_query_device
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_QUERY_DEVICE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Reserved. Must be set to zero.
     * @type {Integer}
     */
    LAP {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Requested length of the inquiry, in seconds.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
