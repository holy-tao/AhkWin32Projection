#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\ETW_BUFFER_CONTEXT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_BUFFER_HEADER extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Array<UInt32>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    TimeStamp {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {ETW_BUFFER_CONTEXT}
     */
    ClientContext{
        get {
            if(!this.HasProp("__ClientContext"))
                this.__ClientContext := ETW_BUFFER_CONTEXT(40, this)
            return this.__ClientContext
        }
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    FilledBytes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Array<UInt32>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 52, 5, Primitive, "uint")
            return this.__Reserved4ProxyArray
        }
    }
}
