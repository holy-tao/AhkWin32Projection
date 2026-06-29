#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XSTATE_FEATURE.ahk" { XSTATE_FEATURE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct XSTATE_CONFIGURATION {
    #StructPack 8

    EnabledFeatures : Int64

    EnabledVolatileFeatures : Int64

    Size : UInt32

    ControlFlags : UInt32


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
    Features : XSTATE_FEATURE[64]

    EnabledSupervisorFeatures : Int64

    AlignedFeatures : Int64

    AllFeatureSize : UInt32

    AllFeatures : UInt32[64]

    EnabledUserVisibleSupervisorFeatures : Int64

    ExtendedFeatureDisableFeatures : Int64

    AllNonLargeFeatureSize : UInt32

    MaxSveVectorLength : UInt16

    Spare1 : UInt16

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 20 })
        this.DeleteProp("__New")
    }
}
