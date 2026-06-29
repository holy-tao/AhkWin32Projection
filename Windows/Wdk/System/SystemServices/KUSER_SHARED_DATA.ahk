#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ALTERNATIVE_ARCHITECTURE_TYPE.ahk" { ALTERNATIVE_ARCHITECTURE_TYPE }
#Import "..\..\..\Win32\System\Kernel\NT_PRODUCT_TYPE.ahk" { NT_PRODUCT_TYPE }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KUSER_SHARED_DATA {
    #StructPack 8

    TickCountLowDeprecated : UInt32

    TickCountMultiplier : UInt32

    InterruptTime : IntPtr

    SystemTime : IntPtr

    TimeZoneBias : IntPtr

    ImageNumberLow : UInt16

    ImageNumberHigh : UInt16

    NtSystemRoot : WCHAR[260]

    MaxStackTraceDepth : UInt32

    CryptoExponent : UInt32

    TimeZoneId : UInt32

    LargePageMinimum : UInt32

    AitSamplingValue : UInt32

    AppCompatFlag : UInt32

    RNGSeedVersion : Int64

    GlobalValidationRunlevel : UInt32

    TimeZoneBiasStamp : Int32

    NtBuildNumber : UInt32

    NtProductType : NT_PRODUCT_TYPE

    ProductTypeIsValid : BOOLEAN

    Reserved0 : BOOLEAN[1]

    NativeProcessorArchitecture : UInt16

    NtMajorVersion : UInt32

    NtMinorVersion : UInt32

    ProcessorFeatures : BOOLEAN[64]

    Reserved1 : UInt32

    Reserved3 : UInt32

    TimeSlip : UInt32

    AlternativeArchitecture : ALTERNATIVE_ARCHITECTURE_TYPE

    BootId : UInt32

    SystemExpirationDate : Int64

    SuiteMask : UInt32

    KdDebuggerEnabled : BOOLEAN

    MitigationPolicies : Int8


    /**
     * @type {Integer}
     */
    NXSupportPolicy {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    SEHValidationPolicy {
        get => (this._bitfield >> 2) & 0x3
        set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
    }

    /**
     * @type {Integer}
     */
    CurDirDevicesSkippedForDlls {
        get => (this._bitfield >> 4) & 0x3
        set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
    }
    CyclesPerYield : UInt16

    ActiveConsoleId : UInt32

    DismountCount : UInt32

    ComPlusPackage : UInt32

    LastSystemRITEventTickCount : UInt32

    NumberOfPhysicalPages : UInt32

    SafeBootMode : BOOLEAN

    VirtualizationFlags : Int8

    Reserved12 : Int8[2]

    SharedDataFlags : UInt32


    /**
     * @type {Integer}
     */
    DbgErrorPortPresent {
        get => (this._bitfield1 >> 0) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 0) | (this._bitfield1 & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    DbgElevationEnabled {
        get => (this._bitfield1 >> 1) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 1) | (this._bitfield1 & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    DbgVirtEnabled {
        get => (this._bitfield1 >> 2) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 2) | (this._bitfield1 & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    DbgInstallerDetectEnabled {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    DbgLkgEnabled {
        get => (this._bitfield1 >> 4) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 4) | (this._bitfield1 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    DbgDynProcessorEnabled {
        get => (this._bitfield1 >> 5) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 5) | (this._bitfield1 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    DbgConsoleBrokerEnabled {
        get => (this._bitfield1 >> 6) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 6) | (this._bitfield1 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    DbgSecureBootEnabled {
        get => (this._bitfield1 >> 7) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 7) | (this._bitfield1 & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    DbgMultiSessionSku {
        get => (this._bitfield1 >> 8) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 8) | (this._bitfield1 & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    DbgMultiUsersInSessionSku {
        get => (this._bitfield1 >> 9) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 9) | (this._bitfield1 & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    DbgStateSeparationEnabled {
        get => (this._bitfield1 >> 10) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 10) | (this._bitfield1 & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    SpareBits {
        get => (this._bitfield1 >> 11) & 0x1FFFFF
        set => this._bitfield1 := ((value & 0x1FFFFF) << 11) | (this._bitfield1 & ~(0x1FFFFF << 11))
    }
    DataFlagsPad : UInt32[1]

    TestRetInstruction : Int64

    QpcFrequency : Int64

    SystemCall : UInt32

    Reserved2 : UInt32

    SystemCallPad : Int64[2]

    TickCount : IntPtr

    TickCountPad : UInt32[1]

    Cookie : UInt32

    CookiePad : UInt32[1]

    ConsoleSessionForegroundProcessId : Int64

    TimeUpdateLock : Int64

    BaselineSystemTimeQpc : Int64

    BaselineInterruptTimeQpc : Int64

    QpcSystemTimeIncrement : Int64

    QpcInterruptTimeIncrement : Int64

    QpcSystemTimeIncrementShift : Int8

    QpcInterruptTimeIncrementShift : Int8

    UnparkedProcessorCount : UInt16

    EnclaveFeatureMask : UInt32[4]

    TelemetryCoverageRound : UInt32

    UserModeGlobalLogger : UInt16[16]

    ImageFileExecutionOptions : UInt32

    LangGenerationCount : UInt32

    Reserved4 : Int64

    InterruptTimeBias : Int64

    QpcBias : Int64

    ActiveProcessorCount : UInt32

    ActiveGroupCount : Int8

    Reserved9 : Int8

    QpcData : UInt16

    TimeZoneBiasEffectiveStart : Int64

    TimeZoneBiasEffectiveEnd : Int64

    XState : IntPtr

    FeatureConfigurationChangeStamp : IntPtr

    Spare : UInt32

    UserPointerAuthMask : Int64

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 717 })
        DefineProp(this.Prototype, '_bitfield1', { type: Int32, offset: 744 })
        DefineProp(this.Prototype, 'TickCountQuad', { type: Int64, offset: 792 })
        DefineProp(this.Prototype, 'ReservedTickCountOverlay', { type: UInt32[3], offset: 792 })
        DefineProp(this.Prototype, 'QpcBypassEnabled', { type: Int8, offset: 958 })
        DefineProp(this.Prototype, 'QpcShift', { type: Int8, offset: 959 })
        this.DeleteProp("__New")
    }
}
