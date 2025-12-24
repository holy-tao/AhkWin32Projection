#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\XSTATE_FEATURE.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\XSTATE_CONFIGURATION.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KUSER_SHARED_DATA extends Win32Struct
{
    static sizeof => 1840

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TickCountLowDeprecated {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TickCountMultiplier {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<KSYSTEM_TIME>}
     */
    InterruptTime {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<KSYSTEM_TIME>}
     */
    SystemTime {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<KSYSTEM_TIME>}
     */
    TimeZoneBias {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ImageNumberLow {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ImageNumberHigh {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * @type {String}
     */
    NtSystemRoot {
        get => StrGet(this.ptr + 36, 259, "UTF-16")
        set => StrPut(value, this.ptr + 36, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    MaxStackTraceDepth {
        get => NumGet(this, 556, "uint")
        set => NumPut("uint", value, this, 556)
    }

    /**
     * @type {Integer}
     */
    CryptoExponent {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * @type {Integer}
     */
    TimeZoneId {
        get => NumGet(this, 564, "uint")
        set => NumPut("uint", value, this, 564)
    }

    /**
     * @type {Integer}
     */
    LargePageMinimum {
        get => NumGet(this, 568, "uint")
        set => NumPut("uint", value, this, 568)
    }

    /**
     * @type {Integer}
     */
    AitSamplingValue {
        get => NumGet(this, 572, "uint")
        set => NumPut("uint", value, this, 572)
    }

    /**
     * @type {Integer}
     */
    AppCompatFlag {
        get => NumGet(this, 576, "uint")
        set => NumPut("uint", value, this, 576)
    }

    /**
     * @type {Integer}
     */
    RNGSeedVersion {
        get => NumGet(this, 584, "uint")
        set => NumPut("uint", value, this, 584)
    }

    /**
     * @type {Integer}
     */
    GlobalValidationRunlevel {
        get => NumGet(this, 592, "uint")
        set => NumPut("uint", value, this, 592)
    }

    /**
     * @type {Integer}
     */
    TimeZoneBiasStamp {
        get => NumGet(this, 596, "int")
        set => NumPut("int", value, this, 596)
    }

    /**
     * @type {Integer}
     */
    NtBuildNumber {
        get => NumGet(this, 600, "uint")
        set => NumPut("uint", value, this, 600)
    }

    /**
     * @type {Integer}
     */
    NtProductType {
        get => NumGet(this, 604, "int")
        set => NumPut("int", value, this, 604)
    }

    /**
     * @type {BOOLEAN}
     */
    ProductTypeIsValid {
        get => NumGet(this, 608, "char")
        set => NumPut("char", value, this, 608)
    }

    /**
     * @type {Array<BOOLEAN>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 609, 1, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NativeProcessorArchitecture {
        get => NumGet(this, 610, "ushort")
        set => NumPut("ushort", value, this, 610)
    }

    /**
     * @type {Integer}
     */
    NtMajorVersion {
        get => NumGet(this, 612, "uint")
        set => NumPut("uint", value, this, 612)
    }

    /**
     * @type {Integer}
     */
    NtMinorVersion {
        get => NumGet(this, 616, "uint")
        set => NumPut("uint", value, this, 616)
    }

    /**
     * @type {Array<BOOLEAN>}
     */
    ProcessorFeatures{
        get {
            if(!this.HasProp("__ProcessorFeaturesProxyArray"))
                this.__ProcessorFeaturesProxyArray := Win32FixedArray(this.ptr + 620, 64, Primitive, "char")
            return this.__ProcessorFeaturesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 684, "uint")
        set => NumPut("uint", value, this, 684)
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 688, "uint")
        set => NumPut("uint", value, this, 688)
    }

    /**
     * @type {Integer}
     */
    TimeSlip {
        get => NumGet(this, 692, "uint")
        set => NumPut("uint", value, this, 692)
    }

    /**
     * @type {Integer}
     */
    AlternativeArchitecture {
        get => NumGet(this, 696, "int")
        set => NumPut("int", value, this, 696)
    }

    /**
     * @type {Integer}
     */
    BootId {
        get => NumGet(this, 700, "uint")
        set => NumPut("uint", value, this, 700)
    }

    /**
     * @type {Integer}
     */
    SystemExpirationDate {
        get => NumGet(this, 704, "int64")
        set => NumPut("int64", value, this, 704)
    }

    /**
     * @type {Integer}
     */
    SuiteMask {
        get => NumGet(this, 712, "uint")
        set => NumPut("uint", value, this, 712)
    }

    /**
     * @type {BOOLEAN}
     */
    KdDebuggerEnabled {
        get => NumGet(this, 716, "char")
        set => NumPut("char", value, this, 716)
    }

    /**
     * @type {Integer}
     */
    MitigationPolicies {
        get => NumGet(this, 717, "char")
        set => NumPut("char", value, this, 717)
    }

    /**
     * This bitfield backs the following members:
     * - NXSupportPolicy
     * - SEHValidationPolicy
     * - CurDirDevicesSkippedForDlls
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 717, "char")
        set => NumPut("char", value, this, 717)
    }

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

    /**
     * @type {Integer}
     */
    CyclesPerYield {
        get => NumGet(this, 718, "ushort")
        set => NumPut("ushort", value, this, 718)
    }

    /**
     * @type {Integer}
     */
    ActiveConsoleId {
        get => NumGet(this, 720, "uint")
        set => NumPut("uint", value, this, 720)
    }

    /**
     * @type {Integer}
     */
    DismountCount {
        get => NumGet(this, 724, "uint")
        set => NumPut("uint", value, this, 724)
    }

    /**
     * @type {Integer}
     */
    ComPlusPackage {
        get => NumGet(this, 728, "uint")
        set => NumPut("uint", value, this, 728)
    }

    /**
     * @type {Integer}
     */
    LastSystemRITEventTickCount {
        get => NumGet(this, 732, "uint")
        set => NumPut("uint", value, this, 732)
    }

    /**
     * @type {Integer}
     */
    NumberOfPhysicalPages {
        get => NumGet(this, 736, "uint")
        set => NumPut("uint", value, this, 736)
    }

    /**
     * @type {BOOLEAN}
     */
    SafeBootMode {
        get => NumGet(this, 740, "char")
        set => NumPut("char", value, this, 740)
    }

    /**
     * @type {Integer}
     */
    VirtualizationFlags {
        get => NumGet(this, 741, "char")
        set => NumPut("char", value, this, 741)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved12{
        get {
            if(!this.HasProp("__Reserved12ProxyArray"))
                this.__Reserved12ProxyArray := Win32FixedArray(this.ptr + 742, 2, Primitive, "char")
            return this.__Reserved12ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SharedDataFlags {
        get => NumGet(this, 744, "uint")
        set => NumPut("uint", value, this, 744)
    }

    /**
     * This bitfield backs the following members:
     * - DbgErrorPortPresent
     * - DbgElevationEnabled
     * - DbgVirtEnabled
     * - DbgInstallerDetectEnabled
     * - DbgLkgEnabled
     * - DbgDynProcessorEnabled
     * - DbgConsoleBrokerEnabled
     * - DbgSecureBootEnabled
     * - DbgMultiSessionSku
     * - DbgMultiUsersInSessionSku
     * - DbgStateSeparationEnabled
     * - SpareBits
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 744, "uint")
        set => NumPut("uint", value, this, 744)
    }

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

    /**
     * @type {Array<UInt32>}
     */
    DataFlagsPad{
        get {
            if(!this.HasProp("__DataFlagsPadProxyArray"))
                this.__DataFlagsPadProxyArray := Win32FixedArray(this.ptr + 748, 1, Primitive, "uint")
            return this.__DataFlagsPadProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    TestRetInstruction {
        get => NumGet(this, 752, "uint")
        set => NumPut("uint", value, this, 752)
    }

    /**
     * @type {Integer}
     */
    QpcFrequency {
        get => NumGet(this, 760, "int64")
        set => NumPut("int64", value, this, 760)
    }

    /**
     * @type {Integer}
     */
    SystemCall {
        get => NumGet(this, 768, "uint")
        set => NumPut("uint", value, this, 768)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 772, "uint")
        set => NumPut("uint", value, this, 772)
    }

    /**
     * @type {Array<UInt64>}
     */
    SystemCallPad{
        get {
            if(!this.HasProp("__SystemCallPadProxyArray"))
                this.__SystemCallPadProxyArray := Win32FixedArray(this.ptr + 776, 2, Primitive, "uint")
            return this.__SystemCallPadProxyArray
        }
    }

    /**
     * @type {Pointer<KSYSTEM_TIME>}
     */
    TickCount {
        get => NumGet(this, 792, "ptr")
        set => NumPut("ptr", value, this, 792)
    }

    /**
     * @type {Integer}
     */
    TickCountQuad {
        get => NumGet(this, 792, "uint")
        set => NumPut("uint", value, this, 792)
    }

    /**
     * @type {Array<UInt32>}
     */
    ReservedTickCountOverlay{
        get {
            if(!this.HasProp("__ReservedTickCountOverlayProxyArray"))
                this.__ReservedTickCountOverlayProxyArray := Win32FixedArray(this.ptr + 792, 3, Primitive, "uint")
            return this.__ReservedTickCountOverlayProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    TickCountPad{
        get {
            if(!this.HasProp("__TickCountPadProxyArray"))
                this.__TickCountPadProxyArray := Win32FixedArray(this.ptr + 804, 1, Primitive, "uint")
            return this.__TickCountPadProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Cookie {
        get => NumGet(this, 808, "uint")
        set => NumPut("uint", value, this, 808)
    }

    /**
     * @type {Array<UInt32>}
     */
    CookiePad{
        get {
            if(!this.HasProp("__CookiePadProxyArray"))
                this.__CookiePadProxyArray := Win32FixedArray(this.ptr + 812, 1, Primitive, "uint")
            return this.__CookiePadProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ConsoleSessionForegroundProcessId {
        get => NumGet(this, 816, "int64")
        set => NumPut("int64", value, this, 816)
    }

    /**
     * @type {Integer}
     */
    TimeUpdateLock {
        get => NumGet(this, 824, "uint")
        set => NumPut("uint", value, this, 824)
    }

    /**
     * @type {Integer}
     */
    BaselineSystemTimeQpc {
        get => NumGet(this, 832, "uint")
        set => NumPut("uint", value, this, 832)
    }

    /**
     * @type {Integer}
     */
    BaselineInterruptTimeQpc {
        get => NumGet(this, 840, "uint")
        set => NumPut("uint", value, this, 840)
    }

    /**
     * @type {Integer}
     */
    QpcSystemTimeIncrement {
        get => NumGet(this, 848, "uint")
        set => NumPut("uint", value, this, 848)
    }

    /**
     * @type {Integer}
     */
    QpcInterruptTimeIncrement {
        get => NumGet(this, 856, "uint")
        set => NumPut("uint", value, this, 856)
    }

    /**
     * @type {Integer}
     */
    QpcSystemTimeIncrementShift {
        get => NumGet(this, 864, "char")
        set => NumPut("char", value, this, 864)
    }

    /**
     * @type {Integer}
     */
    QpcInterruptTimeIncrementShift {
        get => NumGet(this, 865, "char")
        set => NumPut("char", value, this, 865)
    }

    /**
     * @type {Integer}
     */
    UnparkedProcessorCount {
        get => NumGet(this, 866, "ushort")
        set => NumPut("ushort", value, this, 866)
    }

    /**
     * @type {Array<UInt32>}
     */
    EnclaveFeatureMask{
        get {
            if(!this.HasProp("__EnclaveFeatureMaskProxyArray"))
                this.__EnclaveFeatureMaskProxyArray := Win32FixedArray(this.ptr + 868, 4, Primitive, "uint")
            return this.__EnclaveFeatureMaskProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    TelemetryCoverageRound {
        get => NumGet(this, 884, "uint")
        set => NumPut("uint", value, this, 884)
    }

    /**
     * @type {Array<UInt16>}
     */
    UserModeGlobalLogger{
        get {
            if(!this.HasProp("__UserModeGlobalLoggerProxyArray"))
                this.__UserModeGlobalLoggerProxyArray := Win32FixedArray(this.ptr + 888, 16, Primitive, "ushort")
            return this.__UserModeGlobalLoggerProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ImageFileExecutionOptions {
        get => NumGet(this, 920, "uint")
        set => NumPut("uint", value, this, 920)
    }

    /**
     * @type {Integer}
     */
    LangGenerationCount {
        get => NumGet(this, 924, "uint")
        set => NumPut("uint", value, this, 924)
    }

    /**
     * @type {Integer}
     */
    Reserved4 {
        get => NumGet(this, 928, "uint")
        set => NumPut("uint", value, this, 928)
    }

    /**
     * @type {Integer}
     */
    InterruptTimeBias {
        get => NumGet(this, 936, "uint")
        set => NumPut("uint", value, this, 936)
    }

    /**
     * @type {Integer}
     */
    QpcBias {
        get => NumGet(this, 944, "uint")
        set => NumPut("uint", value, this, 944)
    }

    /**
     * @type {Integer}
     */
    ActiveProcessorCount {
        get => NumGet(this, 952, "uint")
        set => NumPut("uint", value, this, 952)
    }

    /**
     * @type {Integer}
     */
    ActiveGroupCount {
        get => NumGet(this, 956, "char")
        set => NumPut("char", value, this, 956)
    }

    /**
     * @type {Integer}
     */
    Reserved9 {
        get => NumGet(this, 957, "char")
        set => NumPut("char", value, this, 957)
    }

    /**
     * @type {Integer}
     */
    QpcData {
        get => NumGet(this, 958, "ushort")
        set => NumPut("ushort", value, this, 958)
    }

    /**
     * @type {Integer}
     */
    QpcBypassEnabled {
        get => NumGet(this, 958, "char")
        set => NumPut("char", value, this, 958)
    }

    /**
     * @type {Integer}
     */
    QpcShift {
        get => NumGet(this, 959, "char")
        set => NumPut("char", value, this, 959)
    }

    /**
     * @type {Integer}
     */
    TimeZoneBiasEffectiveStart {
        get => NumGet(this, 960, "int64")
        set => NumPut("int64", value, this, 960)
    }

    /**
     * @type {Integer}
     */
    TimeZoneBiasEffectiveEnd {
        get => NumGet(this, 968, "int64")
        set => NumPut("int64", value, this, 968)
    }

    /**
     * @type {XSTATE_CONFIGURATION}
     */
    XState{
        get {
            if(!this.HasProp("__XState"))
                this.__XState := XSTATE_CONFIGURATION(976, this)
            return this.__XState
        }
    }

    /**
     * @type {Pointer<KSYSTEM_TIME>}
     */
    FeatureConfigurationChangeStamp {
        get => NumGet(this, 1816, "ptr")
        set => NumPut("ptr", value, this, 1816)
    }

    /**
     * @type {Integer}
     */
    Spare {
        get => NumGet(this, 1824, "uint")
        set => NumPut("uint", value, this, 1824)
    }

    /**
     * @type {Integer}
     */
    UserPointerAuthMask {
        get => NumGet(this, 1832, "uint")
        set => NumPut("uint", value, this, 1832)
    }
}
