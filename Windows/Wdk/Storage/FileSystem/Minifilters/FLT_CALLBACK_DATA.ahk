#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\FLT_IO_PARAMETER_BLOCK.ahk
#Include ..\..\..\Foundation\PETHREAD.ahk
#Include .\FLT_TAG_DATA_BUFFER.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
class FLT_CALLBACK_DATA extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PETHREAD}
     */
    Thread {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<FLT_IO_PARAMETER_BLOCK>}
     */
    Iopb {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    IoStatus {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<FLT_TAG_DATA_BUFFER>}
     */
    TagData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    QueueLinks {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Array<Pointer<Void>>}
     */
    QueueContext {
        get {
            if(!this.HasProp("__QueueContextProxyArray"))
                this.__QueueContextProxyArray := Win32FixedArray(this.ptr + 48, 2, Primitive, "ptr")
            return this.__QueueContextProxyArray
        }
    }

    /**
     * @type {Array<Pointer<Void>>}
     */
    FilterContext {
        get {
            if(!this.HasProp("__FilterContextProxyArray"))
                this.__FilterContextProxyArray := Win32FixedArray(this.ptr + 40, 4, Primitive, "ptr")
            return this.__FilterContextProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RequestorMode {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }
}
