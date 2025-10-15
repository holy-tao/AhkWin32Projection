#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\HCS_OPERATION.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_EVENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    EventData{
        get {
            if(!this.HasProp("__EventData"))
                this.__EventData := PWSTR(this.ptr + 8)
            return this.__EventData
        }
    }

    /**
     * @type {HCS_OPERATION}
     */
    Operation{
        get {
            if(!this.HasProp("__Operation"))
                this.__Operation := HCS_OPERATION(this.ptr + 16)
            return this.__Operation
        }
    }
}
