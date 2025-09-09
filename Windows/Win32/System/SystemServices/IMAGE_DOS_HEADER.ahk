#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class IMAGE_DOS_HEADER extends Win32Struct
{
    static sizeof => 64

    static packingSize => 2

    /**
     * @type {Integer}
     */
    e_magic {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    e_cblp {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    e_cp {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    e_crlc {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    e_cparhdr {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    e_minalloc {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    e_maxalloc {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    e_ss {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    e_sp {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    e_csum {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    e_ip {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    e_cs {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    e_lfarlc {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    e_ovno {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * @type {Array<UInt16>}
     */
    e_res{
        get {
            if(!this.HasProp("__e_resProxyArray"))
                this.__e_resProxyArray := Win32FixedArray(this.ptr + 28, 4, Primitive, "ushort")
            return this.__e_resProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    e_oemid {
        get => NumGet(this, 36, "ushort")
        set => NumPut("ushort", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    e_oeminfo {
        get => NumGet(this, 38, "ushort")
        set => NumPut("ushort", value, this, 38)
    }

    /**
     * @type {Array<UInt16>}
     */
    e_res2{
        get {
            if(!this.HasProp("__e_res2ProxyArray"))
                this.__e_res2ProxyArray := Win32FixedArray(this.ptr + 40, 10, Primitive, "ushort")
            return this.__e_res2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    e_lfanew {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }
}
