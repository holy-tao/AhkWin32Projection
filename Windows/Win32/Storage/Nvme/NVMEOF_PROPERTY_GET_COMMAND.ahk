#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_PROPERTY_GET_COMMAND extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    class _ATTRIB extends Win32Struct {
        static sizeof => 64
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - PropertySize
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        PropertySize {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 3) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
        }
    
    }

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
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 5, 35, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {_ATTRIB}
     */
    ATTRIB{
        get {
            if(!this.HasProp("__ATTRIB"))
                this.__ATTRIB := %this.__Class%._ATTRIB(40, this)
            return this.__ATTRIB
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 41, 3, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    OFST {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 48, 16, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }
}
