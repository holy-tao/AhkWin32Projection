#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIRTUAL_STORAGE_TYPE.ahk
#Include .\STORAGE_DEPENDENCY_INFO_TYPE_1.ahk
#Include .\STORAGE_DEPENDENCY_INFO_TYPE_2.ahk

/**
 * Contains virtual hard disk (VHD) storage dependency information.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-storage_dependency_info
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class STORAGE_DEPENDENCY_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A [STORAGE_DEPENDENCY_INFO_TYPE_1](./ns-virtdisk-storage_dependency_info_type_1.md) or [STORAGE_DEPENDENCY_INFO_TYPE_2](./ns-virtdisk-storage_dependency_info_type_2.md).
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Number of entries returned in the following unioned members.
     * @type {Integer}
     */
    NumberEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<STORAGE_DEPENDENCY_INFO_TYPE_1>}
     */
    Version1Entries{
        get {
            if(!this.HasProp("__Version1EntriesProxyArray"))
                this.__Version1EntriesProxyArray := Win32FixedArray(this.ptr + 8, 1, STORAGE_DEPENDENCY_INFO_TYPE_1, "")
            return this.__Version1EntriesProxyArray
        }
    }

    /**
     * @type {Array<STORAGE_DEPENDENCY_INFO_TYPE_2>}
     */
    Version2Entries{
        get {
            if(!this.HasProp("__Version2EntriesProxyArray"))
                this.__Version2EntriesProxyArray := Win32FixedArray(this.ptr + 8, 1, STORAGE_DEPENDENCY_INFO_TYPE_2, "")
            return this.__Version2EntriesProxyArray
        }
    }
}
