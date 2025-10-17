#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_LBA_RANGET_TYPE_ENTRY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    class _Attributes extends Win32Struct {
        static sizeof => 64
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - MayOverwritten
         * - Hidden
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
        MayOverwritten {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Hidden {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 2) & 0x3F
            set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
        }
    
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {_Attributes}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := %this.__Class%._Attributes(1, this)
            return this.__Attributes
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 2, 14, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SLBA {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NLB {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    GUID{
        get {
            if(!this.HasProp("__GUIDProxyArray"))
                this.__GUIDProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__GUIDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 48, 16, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
