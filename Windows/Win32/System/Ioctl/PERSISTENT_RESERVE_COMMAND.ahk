#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class PERSISTENT_RESERVE_COMMAND extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    class _PR_IN extends Win32Struct {
        static sizeof => 4
        static packingSize => 2

        /**
         * This bitfield backs the following members:
         * - ServiceAction
         * - Reserved1
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ServiceAction {
            get => (this._bitfield >> 0) & 0x1F
            set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield >> 5) & 0x7
            set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
        }
    
        /**
         * @type {Integer}
         */
        AllocationLength {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
    }

    class _PR_OUT extends Win32Struct {
        static sizeof => 3
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - ServiceAction
         * - Reserved1
         * @type {Integer}
         */
        _bitfield1 {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ServiceAction {
            get => (this._bitfield1 >> 0) & 0x1F
            set => this._bitfield1 := ((value & 0x1F) << 0) | (this._bitfield1 & ~(0x1F << 0))
        }
    
        /**
         * @type {Integer}
         */
        Reserved1 {
            get => (this._bitfield1 >> 5) & 0x7
            set => this._bitfield1 := ((value & 0x7) << 5) | (this._bitfield1 & ~(0x7 << 5))
        }
    
        /**
         * This bitfield backs the following members:
         * - Type
         * - Scope
         * @type {Integer}
         */
        _bitfield2 {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        Type {
            get => (this._bitfield2 >> 0) & 0xF
            set => this._bitfield2 := ((value & 0xF) << 0) | (this._bitfield2 & ~(0xF << 0))
        }
    
        /**
         * @type {Integer}
         */
        Scope {
            get => (this._bitfield2 >> 4) & 0xF
            set => this._bitfield2 := ((value & 0xF) << 4) | (this._bitfield2 & ~(0xF << 4))
        }
    
        /**
         * @type {Array<Byte>}
         */
        ParameterList{
            get {
                if(!this.HasProp("__ParameterListProxyArray"))
                    this.__ParameterListProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
                return this.__ParameterListProxyArray
            }
        }
    
    }

    /**
     * @type {_PR_IN}
     */
    PR_IN{
        get {
            if(!this.HasProp("__PR_IN"))
                this.__PR_IN := %this.__Class%._PR_IN(8, this)
            return this.__PR_IN
        }
    }

    /**
     * @type {_PR_OUT}
     */
    PR_OUT{
        get {
            if(!this.HasProp("__PR_OUT"))
                this.__PR_OUT := %this.__Class%._PR_OUT(8, this)
            return this.__PR_OUT
        }
    }
}
