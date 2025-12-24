#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MEMORY_PARTITION_DEDICATED_MEMORY_OPEN_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DedicatedMemoryTypeId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    HandleAttributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DesiredAccess {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {HANDLE}
     */
    DedicatedMemoryPartitionHandle{
        get {
            if(!this.HasProp("__DedicatedMemoryPartitionHandle"))
                this.__DedicatedMemoryPartitionHandle := HANDLE(16, this)
            return this.__DedicatedMemoryPartitionHandle
        }
    }
}
