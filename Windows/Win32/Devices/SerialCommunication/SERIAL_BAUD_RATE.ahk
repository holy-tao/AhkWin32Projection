#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 * @version v4.0.30319
 */
class SERIAL_BAUD_RATE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    BaudRate {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
