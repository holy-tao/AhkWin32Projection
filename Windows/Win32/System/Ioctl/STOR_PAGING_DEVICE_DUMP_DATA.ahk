#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEVICEDUMP_STRUCTURE_VERSION.ahk
#Include .\STOR_PAGING_DEVICE_DUMP_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STOR_PAGING_DEVICE_DUMP_DATA extends Win32Struct {
    static sizeof => 144

    static packingSize => 4

    /**
     * @type {DEVICEDUMP_STRUCTURE_VERSION}
     */
    Descriptor {
        get {
            if(!this.HasProp("__Descriptor"))
                this.__Descriptor := DEVICEDUMP_STRUCTURE_VERSION(0, this)
            return this.__Descriptor
        }
    }

    /**
     * @type {Integer}
     */
    EntryCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    EntrySize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {STOR_PAGING_DEVICE_DUMP_ENTRY}
     */
    Entries {
        get {
            if(!this.HasProp("__EntriesProxyArray"))
                this.__EntriesProxyArray := Win32FixedArray(this.ptr + 20, 1, STOR_PAGING_DEVICE_DUMP_ENTRY, "")
            return this.__EntriesProxyArray
        }
    }
}
