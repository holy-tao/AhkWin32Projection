#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\XSTATE_FEATURE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class XSTATE_CONFIGURATION extends Win32Struct
{
    static sizeof => 840

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
     * @type {Array<XSTATE_FEATURE>}
     */
    Features{
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
     * @type {Array<UInt32>}
     */
    AllFeatures{
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
     * @type {Integer}
     */
    MaxSveVectorLength {
        get => NumGet(this, 836, "ushort")
        set => NumPut("ushort", value, this, 836)
    }

    /**
     * @type {Integer}
     */
    Spare1 {
        get => NumGet(this, 838, "ushort")
        set => NumPut("ushort", value, this, 838)
    }
}
