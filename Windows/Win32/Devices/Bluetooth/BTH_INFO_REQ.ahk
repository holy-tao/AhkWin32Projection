#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_INFO_REQ extends Win32Struct
{
    static sizeof => 10

    static packingSize => 1

    /**
     * @type {Integer}
     */
    btAddr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    infoType {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
