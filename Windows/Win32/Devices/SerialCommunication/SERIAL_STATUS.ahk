#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 * @version v4.0.30319
 */
class SERIAL_STATUS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Errors {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    HoldReasons {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    AmountInInQueue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AmountInOutQueue {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    EofReceived{
        get {
            if(!this.HasProp("__EofReceived"))
                this.__EofReceived := BOOLEAN(this.ptr + 16)
            return this.__EofReceived
        }
    }

    /**
     * @type {BOOLEAN}
     */
    WaitForImmediate{
        get {
            if(!this.HasProp("__WaitForImmediate"))
                this.__WaitForImmediate := BOOLEAN(this.ptr + 17)
            return this.__WaitForImmediate
        }
    }
}
