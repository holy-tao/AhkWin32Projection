#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_CONNECT_DATA extends Win32Struct
{
    static sizeof => 1024

    static packingSize => 2

    /**
     * @type {Array<Byte>}
     */
    HOSTID{
        get {
            if(!this.HasProp("__HOSTIDProxyArray"))
                this.__HOSTIDProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__HOSTIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CNTLID {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 18, 238, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    SUBNQN{
        get {
            if(!this.HasProp("__SUBNQNProxyArray"))
                this.__SUBNQNProxyArray := Win32FixedArray(this.ptr + 256, 256, Primitive, "char")
            return this.__SUBNQNProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    HOSTNQN{
        get {
            if(!this.HasProp("__HOSTNQNProxyArray"))
                this.__HOSTNQNProxyArray := Win32FixedArray(this.ptr + 512, 256, Primitive, "char")
            return this.__HOSTNQNProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 768, 256, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
