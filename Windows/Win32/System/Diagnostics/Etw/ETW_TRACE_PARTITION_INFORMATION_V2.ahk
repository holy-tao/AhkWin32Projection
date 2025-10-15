#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_TRACE_PARTITION_INFORMATION_V2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    QpcOffsetFromRoot {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PartitionType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    PartitionId{
        get {
            if(!this.HasProp("__PartitionId"))
                this.__PartitionId := PWSTR(this.ptr + 16)
            return this.__PartitionId
        }
    }

    /**
     * @type {PWSTR}
     */
    ParentId{
        get {
            if(!this.HasProp("__ParentId"))
                this.__ParentId := PWSTR(this.ptr + 24)
            return this.__ParentId
        }
    }
}
