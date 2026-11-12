#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\XSTATE_FEATURE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class XSTATE_CONFIGURATION extends Win32Struct {
    static sizeof => 856

    static packingSize => 8

    /**
     * @type {Integer}
     */
    EnabledFeatures {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EnabledVolatileFeatures {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ControlFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * This bitfield backs the following members:
     * - OptimizedSave
     * - CompactionEnabled
     * - ExtendedFeatureDisable
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    OptimizedSave {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    CompactionEnabled {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ExtendedFeatureDisable {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {XSTATE_FEATURE}
     */
    Features {
        get {
            if(!this.HasProp("__FeaturesProxyArray"))
                this.__FeaturesProxyArray := Win32FixedArray(this.ptr + 24, 64, XSTATE_FEATURE, "")
            return this.__FeaturesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    EnabledSupervisorFeatures {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * @type {Integer}
     */
    AlignedFeatures {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * @type {Integer}
     */
    AllFeatureSize {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {Array<Integer>}
     */
    AllFeatures {
        get {
            if(!this.HasProp("__AllFeaturesProxyArray"))
                this.__AllFeaturesProxyArray := Win32FixedArray(this.ptr + 556, 64, Primitive, "uint")
            return this.__AllFeaturesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    EnabledUserVisibleSupervisorFeatures {
        get => NumGet(this, 816, "uint")
        set => NumPut("uint", value, this, 816)
    }

    /**
     * @type {Integer}
     */
    ExtendedFeatureDisableFeatures {
        get => NumGet(this, 824, "uint")
        set => NumPut("uint", value, this, 824)
    }

    /**
     * @type {Integer}
     */
    AllNonLargeFeatureSize {
        get => NumGet(this, 832, "uint")
        set => NumPut("uint", value, this, 832)
    }

    /**
     * @type {Array<Integer>}
     */
    Amd64Spare1 {
        get {
            if(!this.HasProp("__Amd64Spare1ProxyArray"))
                this.__Amd64Spare1ProxyArray := Win32FixedArray(this.ptr + 836, 3, Primitive, "uint")
            return this.__Amd64Spare1ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MaxSveVectorLength {
        get => NumGet(this, 836, "ushort")
        set => NumPut("ushort", value, this, 836)
    }

    /**
     * @type {Integer}
     */
    MaxSmeVectorLength {
        get => NumGet(this, 838, "ushort")
        set => NumPut("ushort", value, this, 838)
    }

    /**
     * @type {Integer}
     */
    SmeZTRegisterCount {
        get => NumGet(this, 840, "ushort")
        set => NumPut("ushort", value, this, 840)
    }

    /**
     * @type {Integer}
     */
    Arm64Flags {
        get => NumGet(this, 842, "ushort")
        set => NumPut("ushort", value, this, 842)
    }

    /**
     * This bitfield backs the following members:
     * - SmeFa64
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 842, "ushort")
        set => NumPut("ushort", value, this, 842)
    }

    /**
     * @type {Integer}
     */
    SmeFa64 {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    SupportedSmeVectorLengths {
        get => NumGet(this, 844, "char")
        set => NumPut("char", value, this, 844)
    }

    /**
     * @type {Array<Integer>}
     */
    Arm64Spare {
        get {
            if(!this.HasProp("__Arm64SpareProxyArray"))
                this.__Arm64SpareProxyArray := Win32FixedArray(this.ptr + 845, 3, Primitive, "char")
            return this.__Arm64SpareProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Spare {
        get => NumGet(this, 848, "uint")
        set => NumPut("uint", value, this, 848)
    }
}
