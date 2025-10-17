#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Kernel\LIST_ENTRY.ahk
#Include ..\..\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class LDR_DATA_TABLE_ENTRY extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {Array<Void>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ptr")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {LIST_ENTRY}
     */
    InMemoryOrderLinks{
        get {
            if(!this.HasProp("__InMemoryOrderLinks"))
                this.__InMemoryOrderLinks := LIST_ENTRY(16, this)
            return this.__InMemoryOrderLinks
        }
    }

    /**
     * @type {Array<Void>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 32, 2, Primitive, "ptr")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    DllBase {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Array<Void>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 56, 2, Primitive, "ptr")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    FullDllName{
        get {
            if(!this.HasProp("__FullDllName"))
                this.__FullDllName := UNICODE_STRING(72, this)
            return this.__FullDllName
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 88, 8, Primitive, "char")
            return this.__Reserved4ProxyArray
        }
    }

    /**
     * @type {Array<Void>}
     */
    Reserved5{
        get {
            if(!this.HasProp("__Reserved5ProxyArray"))
                this.__Reserved5ProxyArray := Win32FixedArray(this.ptr + 96, 3, Primitive, "ptr")
            return this.__Reserved5ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Pointer<Void>}
     */
    Reserved6 {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    TimeDateStamp {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }
}
