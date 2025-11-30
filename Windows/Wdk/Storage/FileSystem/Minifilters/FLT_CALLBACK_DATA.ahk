#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk
#Include ..\..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_CALLBACK_DATA extends Win32Struct
{
    static sizeof => 88

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
     * @type {IO_STATUS_BLOCK}
     */
    IoStatus{
        get {
            if(!this.HasProp("__IoStatus"))
                this.__IoStatus := IO_STATUS_BLOCK(24, this)
            return this.__IoStatus
        }
    }

    /**
     * @type {Pointer<FLT_TAG_DATA_BUFFER>}
     */
    TagData {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {LIST_ENTRY}
     */
    QueueLinks{
        get {
            if(!this.HasProp("__QueueLinks"))
                this.__QueueLinks := LIST_ENTRY(48, this)
            return this.__QueueLinks
        }
    }

    /**
     * @type {Array<Void>}
     */
    QueueContext{
        get {
            if(!this.HasProp("__QueueContextProxyArray"))
                this.__QueueContextProxyArray := Win32FixedArray(this.ptr + 64, 2, Primitive, "ptr")
            return this.__QueueContextProxyArray
        }
    }

    /**
     * @type {Array<Void>}
     */
    FilterContext{
        get {
            if(!this.HasProp("__FilterContextProxyArray"))
                this.__FilterContextProxyArray := Win32FixedArray(this.ptr + 48, 4, Primitive, "ptr")
            return this.__FilterContextProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RequestorMode {
        get => NumGet(this, 80, "char")
        set => NumPut("char", value, this, 80)
    }
}
