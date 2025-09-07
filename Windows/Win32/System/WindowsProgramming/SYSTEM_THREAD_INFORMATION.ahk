#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLIENT_ID.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class SYSTEM_THREAD_INFORMATION extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Array<Int64>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "int64")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    StartAddress {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {CLIENT_ID}
     */
    ClientId{
        get {
            if(!this.HasProp("__ClientId"))
                this.__ClientId := CLIENT_ID(this.ptr + 40)
            return this.__ClientId
        }
    }

    /**
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    BasePriority {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    ThreadState {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    WaitReason {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
