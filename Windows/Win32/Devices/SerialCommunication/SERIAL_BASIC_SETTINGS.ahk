#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SERIAL_TIMEOUTS.ahk
#Include .\SERIAL_HANDFLOW.ahk

/**
 * @namespace Windows.Win32.Devices.SerialCommunication
 * @version v4.0.30319
 */
class SERIAL_BASIC_SETTINGS extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {SERIAL_TIMEOUTS}
     */
    Timeouts{
        get {
            if(!this.HasProp("__Timeouts"))
                this.__Timeouts := SERIAL_TIMEOUTS(0, this)
            return this.__Timeouts
        }
    }

    /**
     * @type {SERIAL_HANDFLOW}
     */
    HandFlow{
        get {
            if(!this.HasProp("__HandFlow"))
                this.__HandFlow := SERIAL_HANDFLOW(20, this)
            return this.__HandFlow
        }
    }

    /**
     * @type {Integer}
     */
    RxFifo {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    TxFifo {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
