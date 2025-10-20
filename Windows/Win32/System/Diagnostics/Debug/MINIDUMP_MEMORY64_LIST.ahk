#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MINIDUMP_MEMORY_DESCRIPTOR64.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory64_list
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MINIDUMP_MEMORY64_LIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfMemoryRanges {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BaseRva {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<MINIDUMP_MEMORY_DESCRIPTOR64>}
     */
    MemoryRanges{
        get {
            if(!this.HasProp("__MemoryRangesProxyArray"))
                this.__MemoryRangesProxyArray := Win32FixedArray(this.ptr + 16, 1, MINIDUMP_MEMORY_DESCRIPTOR64, "")
            return this.__MemoryRangesProxyArray
        }
    }
}
