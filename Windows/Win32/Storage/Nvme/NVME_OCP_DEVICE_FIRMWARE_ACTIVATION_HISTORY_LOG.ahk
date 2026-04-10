#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FIRMWARE_ACTIVATION_HISTORY_ENTRY.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_OCP_DEVICE_FIRMWARE_ACTIVATION_HISTORY_LOG extends Win32Struct {
    static sizeof => 4248

    static packingSize => 8

    /**
     * @type {Integer}
     */
    LID {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved0 {
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ValidNumberOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {FIRMWARE_ACTIVATION_HISTORY_ENTRY}
     */
    Entries {
        get {
            if(!this.HasProp("__EntriesProxyArray"))
                this.__EntriesProxyArray := Win32FixedArray(this.ptr + 8, 20, FIRMWARE_ACTIVATION_HISTORY_ENTRY, "")
            return this.__EntriesProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 1448, 2790, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LogPageVersionNumber {
        get => NumGet(this, 4238, "ushort")
        set => NumPut("ushort", value, this, 4238)
    }

    /**
     * @type {Pointer}
     */
    LogPageGUID {
        get => NumGet(this, 4240, "ptr")
        set => NumPut("ptr", value, this, 4240)
    }
}
