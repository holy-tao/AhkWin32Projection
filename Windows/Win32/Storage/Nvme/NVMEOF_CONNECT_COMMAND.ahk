#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_SGL_DESC.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVMEOF_CONNECT_COMMAND extends Win32Struct
{
    static sizeof => 64

    static packingSize => 4

    class _CATTR_e__Union extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - PriorityClass
         * - SqFlowControlDisable
         * - IoQueueDeletion
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
        PriorityClass {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        SqFlowControlDisable {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        IoQueueDeletion {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        AsUchar {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
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
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 5, 19, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {NVME_SGL_DESC}
     */
    SGL1{
        get {
            if(!this.HasProp("__SGL1"))
                this.__SGL1 := NVME_SGL_DESC(24, this)
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
     * @type {Integer}
     */
    QID {
        get => NumGet(this, 42, "ushort")
        set => NumPut("ushort", value, this, 42)
    }

    /**
     * @type {Integer}
     */
    SQSIZE {
        get => NumGet(this, 44, "ushort")
        set => NumPut("ushort", value, this, 44)
    }

    /**
     * @type {_CATTR_e__Union}
     */
    CATTR{
        get {
            if(!this.HasProp("__CATTR"))
                this.__CATTR := %this.__Class%._CATTR_e__Union(46, this)
            return this.__CATTR
        }
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 47, "char")
        set => NumPut("char", value, this, 47)
    }

    /**
     * @type {Integer}
     */
    KATO {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 52, 12, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }
}
