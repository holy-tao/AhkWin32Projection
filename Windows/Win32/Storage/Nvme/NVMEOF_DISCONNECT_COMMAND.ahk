#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_SGL_DATABLOCK_DESC.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_DISCONNECT_COMMAND extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    OPC {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    CID {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    FCTYPE {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 5, 19, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {NVME_SGL_DATABLOCK_DESC}
     */
    SGL1{
        get {
            if(!this.HasProp("__SGL1"))
                this.__SGL1 := NVME_SGL_DATABLOCK_DESC(24, this)
            return this.__SGL1
        }
    }

    /**
     * @type {Integer}
     */
    RECFMT {
        get => NumGet(this, 40, "ushort")
        set => NumPut("ushort", value, this, 40)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 42, 22, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}
