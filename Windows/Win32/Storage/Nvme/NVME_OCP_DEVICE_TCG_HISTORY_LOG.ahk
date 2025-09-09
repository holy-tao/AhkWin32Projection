#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TCG_HISTORY_ENTRY.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_OCP_DEVICE_TCG_HISTORY_LOG extends Win32Struct
{
    static sizeof => 728

    static packingSize => 1

    /**
     * @type {Integer}
     */
    LID {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    HistoryEntryCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<TCG_HISTORY_ENTRY>}
     */
    HistoryEntries{
        get {
            if(!this.HasProp("__HistoryEntriesProxyArray"))
                this.__HistoryEntriesProxyArray := Win32FixedArray(this.ptr + 8, 84, TCG_HISTORY_ENTRY, "")
            return this.__HistoryEntriesProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 680, 38, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LogPageVersionNumber {
        get => NumGet(this, 718, "ushort")
        set => NumPut("ushort", value, this, 718)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LogPageGUID {
        get => NumGet(this, 720, "ptr")
        set => NumPut("ptr", value, this, 720)
    }
}
