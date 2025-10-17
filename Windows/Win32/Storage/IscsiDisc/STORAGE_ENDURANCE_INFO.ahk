#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class STORAGE_ENDURANCE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    class _Flags extends Win32Struct {
        static sizeof => 48
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - Shared
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Shared {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 1) & 0x7FFFFFFF
            set => this._bitfield := ((value & 0x7FFFFFFF) << 1) | (this._bitfield & ~(0x7FFFFFFF << 1))
        }
    
    }

    /**
     * @type {Integer}
     */
    ValidFields {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    GroupId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_Flags}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := %this.__Class%._Flags(8, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    LifePercentage {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    BytesReadCount{
        get {
            if(!this.HasProp("__BytesReadCountProxyArray"))
                this.__BytesReadCountProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__BytesReadCountProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ByteWriteCount{
        get {
            if(!this.HasProp("__ByteWriteCountProxyArray"))
                this.__ByteWriteCountProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__ByteWriteCountProxyArray
        }
    }
}
