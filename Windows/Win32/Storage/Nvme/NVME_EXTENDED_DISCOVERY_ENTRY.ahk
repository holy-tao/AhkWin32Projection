#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_EXTENDED_DISCOVERY_ENTRY extends Win32Struct
{
    static sizeof => 1032

    static packingSize => 4

    class _TREQ_e__Union extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - SecureChannel
         * - SqFlowControlDisable
         * - ZeroHostIdSupport
         * - AuthAndSecureChannel
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
        SecureChannel {
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
        ZeroHostIdSupport {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        AuthAndSecureChannel {
            get => (this._bitfield >> 4) & 0x3
            set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
        }
    
        /**
         * @type {Integer}
         */
        AsUchar {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
    }

    class _EFLAGS_e__Union extends Win32Struct {
        static sizeof => 2
        static packingSize => 2

        /**
         * This bitfield backs the following members:
         * - DuplicateReturnedInfo
         * - ExplicitPersistentConnectionSupport
         * - NoCDCConnectivity
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        DuplicateReturnedInfo {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        ExplicitPersistentConnectionSupport {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    
        /**
         * @type {Integer}
         */
        NoCDCConnectivity {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    
        /**
         * @type {Integer}
         */
        AsUshort {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
    }

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
     * @type {_TREQ_e__Union}
     */
    TREQ{
        get {
            if(!this.HasProp("__TREQ"))
                this.__TREQ := %this.__Class%._TREQ_e__Union(3, this)
            return this.__TREQ
        }
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
     * @type {_EFLAGS_e__Union}
     */
    EFLAGS{
        get {
            if(!this.HasProp("__EFLAGS"))
                this.__EFLAGS := %this.__Class%._EFLAGS_e__Union(10, this)
            return this.__EFLAGS
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 12, 20, Primitive, "char")
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
    NQN{
        get {
            if(!this.HasProp("__NQNProxyArray"))
                this.__NQNProxyArray := Win32FixedArray(this.ptr + 256, 256, Primitive, "char")
            return this.__NQNProxyArray
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

    /**
     * @type {Integer}
     */
    TEL {
        get => NumGet(this, 1024, "uint")
        set => NumPut("uint", value, this, 1024)
    }

    /**
     * @type {Integer}
     */
    NUMEXAT {
        get => NumGet(this, 1028, "ushort")
        set => NumPut("ushort", value, this, 1028)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 1030, "ushort")
        set => NumPut("ushort", value, this, 1030)
    }
}
