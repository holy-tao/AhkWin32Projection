#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 * @version v4.0.30319
 */
class SERIAL_LINE_CONTROL extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * @type {Integer}
     */
    StopBits {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Parity {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    WordLength {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
