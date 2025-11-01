#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCS_OPERATION.ahk

/**
 * 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_EVENT
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
    EventData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HCS_OPERATION}
     */
    Operation{
        get {
            if(!this.HasProp("__Operation"))
                this.__Operation := HCS_OPERATION(16, this)
            return this.__Operation
        }
    }
}
