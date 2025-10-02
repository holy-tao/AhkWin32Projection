#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_DISC_LPE extends Win32Struct
{
    static sizeof => 1024

    static packingSize => 2

    /**
     * @type {Integer}
     */
    TRTYPE {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ADRFAM {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    SUBTYPE {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    AsUchar {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    PORTID {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    CNTLID {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    ASQSZ {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 10, 22, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    TRSVCID{
        get {
            if(!this.HasProp("__TRSVCIDProxyArray"))
                this.__TRSVCIDProxyArray := Win32FixedArray(this.ptr + 32, 32, Primitive, "char")
            return this.__TRSVCIDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 64, 192, Primitive, "char")
            return this.__Reserved1ProxyArray
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
    TRADDR{
        get {
            if(!this.HasProp("__TRADDRProxyArray"))
                this.__TRADDRProxyArray := Win32FixedArray(this.ptr + 512, 256, Primitive, "char")
            return this.__TRADDRProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    TSAS{
        get {
            if(!this.HasProp("__TSASProxyArray"))
                this.__TSASProxyArray := Win32FixedArray(this.ptr + 768, 256, Primitive, "char")
            return this.__TSASProxyArray
        }
    }
}
