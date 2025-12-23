#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BD_PAC_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class BD_DISC_WRITE_PROTECT_PAC extends Win32Struct
{
    static sizeof => 428

    static packingSize => 1

    /**
     * @type {BD_PAC_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := BD_PAC_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    KnownPACEntireDiscFlags {
        get => NumGet(this, 384, "char")
        set => NumPut("char", value, this, 384)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 385, 3, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    WriteProtectControlByte {
        get => NumGet(this, 388, "char")
        set => NumPut("char", value, this, 388)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 389, 7, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    WriteProtectPassword{
        get {
            if(!this.HasProp("__WriteProtectPasswordProxyArray"))
                this.__WriteProtectPasswordProxyArray := Win32FixedArray(this.ptr + 396, 32, Primitive, "char")
            return this.__WriteProtectPasswordProxyArray
        }
    }
}
