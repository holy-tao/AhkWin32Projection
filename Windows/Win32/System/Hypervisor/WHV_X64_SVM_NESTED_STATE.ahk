#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_NESTED_ENLIGHTENMENTS_CONTROL.ahk
#Include .\WHV_NESTED_STATE_TYPE.ahk
#Include .\WHV_SVM_NESTED_HOST_STATE.ahk
#Include .\WHV_SVM_VMCB_SELECTOR.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_X64_SVM_NESTED_STATE extends Win32Struct {
    static sizeof => 8192

    static packingSize => 8

    class _Flags extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - GuestMode
         * - VmEntryPending
         * - HostSaveGpaValid
         * - CurrentVmcbValid
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
        VmEntryPending {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        HostSaveGpaValid {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        CurrentVmcbValid {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
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
                this.__Flags := WHV_X64_SVM_NESTED_STATE._Flags(4, this)
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
     * @type {Integer}
     */
    HostSaveGpa {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    VmControlMsr {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    VirtualTscRatioMsr {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    VmcbGpa {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {WHV_SVM_NESTED_HOST_STATE}
     */
    HostState {
        get {
            if(!this.HasProp("__HostState"))
                this.__HostState := WHV_SVM_NESTED_HOST_STATE(48, this)
            return this.__HostState
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 264, 3832, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    VmcbBytes {
        get {
            if(!this.HasProp("__VmcbBytesProxyArray"))
                this.__VmcbBytesProxyArray := Win32FixedArray(this.ptr + 4096, 4096, Primitive, "char")
            return this.__VmcbBytesProxyArray
        }
    }
}
