#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_NESTED_ENLIGHTENMENTS_CONTROL.ahk
#Include .\WHV_NESTED_STATE_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_X64_VMX_NESTED_STATE extends Win32Struct {
    static sizeof => 8192

    static packingSize => 8

    class _Flags extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - GuestMode
         * - Vmxon
         * - CurrentVmcsValid
         * - VmEntryPending
         * - VmcsEnlightened
         * - EnlightenedVmEntry
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
        GuestMode {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Vmxon {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        CurrentVmcsValid {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        VmEntryPending {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }

        /**
         * @type {Integer}
         */
        VmcsEnlightened {
            get => (this._bitfield >> 4) & 0x1
            set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
        }

        /**
         * @type {Integer}
         */
        EnlightenedVmEntry {
            get => (this._bitfield >> 5) & 0x1
            set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
        }
    }

    class _VirtualApicRegs extends Win32Struct {
        static sizeof => 80
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Tpr {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        Ppr {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }

        /**
         * @type {Array<Integer>}
         */
        Isr {
            get {
                if(!this.HasProp("__IsrProxyArray"))
                    this.__IsrProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "uint")
                return this.__IsrProxyArray
            }
        }

        /**
         * @type {Array<Integer>}
         */
        Irr {
            get {
                if(!this.HasProp("__IrrProxyArray"))
                    this.__IrrProxyArray := Win32FixedArray(this.ptr + 40, 8, Primitive, "uint")
                return this.__IrrProxyArray
            }
        }

        /**
         * @type {Integer}
         */
        IcrLow {
            get => NumGet(this, 72, "uint")
            set => NumPut("uint", value, this, 72)
        }

        /**
         * @type {Integer}
         */
        IcrHigh {
            get => NumGet(this, 76, "uint")
            set => NumPut("uint", value, this, 76)
        }
    }

    /**
     * @type {WHV_NESTED_STATE_TYPE}
     */
    Vendor {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := WHV_X64_VMX_NESTED_STATE._Flags(4, this)
            return this.__Flags
        }
    }

    /**
     * @type {WHV_NESTED_ENLIGHTENMENTS_CONTROL}
     */
    NestedEnlightenmentsControl {
        get {
            if(!this.HasProp("__NestedEnlightenmentsControl"))
                this.__NestedEnlightenmentsControl := WHV_NESTED_ENLIGHTENMENTS_CONTROL(8, this)
            return this.__NestedEnlightenmentsControl
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Pdpt {
        get {
            if(!this.HasProp("__PdptProxyArray"))
                this.__PdptProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "uint")
            return this.__PdptProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    VmxonRegionGpa {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    VmcsGpa {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    CurrentEnlightenedVmcs {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {_VirtualApicRegs}
     */
    VirtualApicRegs {
        get {
            if(!this.HasProp("__VirtualApicRegs"))
                this.__VirtualApicRegs := WHV_X64_VMX_NESTED_STATE._VirtualApicRegs(72, this)
            return this.__VirtualApicRegs
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 152, 3944, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    VmcsBytes {
        get {
            if(!this.HasProp("__VmcsBytesProxyArray"))
                this.__VmcsBytesProxyArray := Win32FixedArray(this.ptr + 4096, 4096, Primitive, "char")
            return this.__VmcsBytesProxyArray
        }
    }
}
