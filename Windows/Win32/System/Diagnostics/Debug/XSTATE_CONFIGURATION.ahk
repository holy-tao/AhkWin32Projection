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
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
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
    Spare {
        get => NumGet(this, 836, "uint")
        set => NumPut("uint", value, this, 836)
    }
}
