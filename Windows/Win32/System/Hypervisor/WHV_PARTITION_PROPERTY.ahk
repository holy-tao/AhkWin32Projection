#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_EXTENDED_VM_EXITS.ahk
#Include .\WHV_PROCESSOR_FEATURES.ahk
#Include .\WHV_SYNTHETIC_PROCESSOR_FEATURES.ahk
#Include .\WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS.ahk
#Include .\WHV_PROCESSOR_XSAVE_FEATURES.ahk
#Include .\WHV_X64_CPUID_RESULT.ahk
#Include .\WHV_CPUID_OUTPUT.ahk
#Include .\WHV_X64_CPUID_RESULT2.ahk
#Include .\WHV_MSR_ACTION_ENTRY.ahk
#Include .\WHV_X64_MSR_EXIT_BITMAP.ahk
#Include .\WHV_PROCESSOR_FEATURES1.ahk
#Include .\WHV_PROCESSOR_FEATURES_BANKS.ahk
#Include .\WHV_PROCESSOR_PERFMON_FEATURES.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_PARTITION_PROPERTY extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * @type {WHV_EXTENDED_VM_EXITS}
     */
    ExtendedVmExits{
        get {
            if(!this.HasProp("__ExtendedVmExits"))
                this.__ExtendedVmExits := WHV_EXTENDED_VM_EXITS(this.ptr + 0)
            return this.__ExtendedVmExits
        }
    }

    /**
     * @type {WHV_PROCESSOR_FEATURES}
     */
    ProcessorFeatures{
        get {
            if(!this.HasProp("__ProcessorFeatures"))
                this.__ProcessorFeatures := WHV_PROCESSOR_FEATURES(this.ptr + 0)
            return this.__ProcessorFeatures
        }
    }

    /**
     * @type {WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS}
     */
    SyntheticProcessorFeaturesBanks{
        get {
            if(!this.HasProp("__SyntheticProcessorFeaturesBanks"))
                this.__SyntheticProcessorFeaturesBanks := WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS(this.ptr + 0)
            return this.__SyntheticProcessorFeaturesBanks
        }
    }

    /**
     * @type {WHV_PROCESSOR_XSAVE_FEATURES}
     */
    ProcessorXsaveFeatures{
        get {
            if(!this.HasProp("__ProcessorXsaveFeatures"))
                this.__ProcessorXsaveFeatures := WHV_PROCESSOR_XSAVE_FEATURES(this.ptr + 0)
            return this.__ProcessorXsaveFeatures
        }
    }

    /**
     * @type {Integer}
     */
    ProcessorClFlushSize {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ProcessorCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    CpuidExitList{
        get {
            if(!this.HasProp("__CpuidExitListProxyArray"))
                this.__CpuidExitListProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__CpuidExitListProxyArray
        }
    }

    /**
     * @type {Array<WHV_X64_CPUID_RESULT>}
     */
    CpuidResultList{
        get {
            if(!this.HasProp("__CpuidResultListProxyArray"))
                this.__CpuidResultListProxyArray := Win32FixedArray(this.ptr + 0, 8, WHV_X64_CPUID_RESULT, "")
            return this.__CpuidResultListProxyArray
        }
    }

    /**
     * @type {Array<WHV_X64_CPUID_RESULT2>}
     */
    CpuidResultList2{
        get {
            if(!this.HasProp("__CpuidResultList2ProxyArray"))
                this.__CpuidResultList2ProxyArray := Win32FixedArray(this.ptr + 0, 8, WHV_X64_CPUID_RESULT2, "")
            return this.__CpuidResultList2ProxyArray
        }
    }

    /**
     * @type {Array<WHV_MSR_ACTION_ENTRY>}
     */
    MsrActionList{
        get {
            if(!this.HasProp("__MsrActionListProxyArray"))
                this.__MsrActionListProxyArray := Win32FixedArray(this.ptr + 0, 8, WHV_MSR_ACTION_ENTRY, "")
            return this.__MsrActionListProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    UnimplementedMsrAction {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ExceptionExitBitmap {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    LocalApicEmulationMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SeparateSecurityDomain {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NestedVirtualization {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {WHV_X64_MSR_EXIT_BITMAP}
     */
    X64MsrExitBitmap{
        get {
            if(!this.HasProp("__X64MsrExitBitmap"))
                this.__X64MsrExitBitmap := WHV_X64_MSR_EXIT_BITMAP(this.ptr + 0)
            return this.__X64MsrExitBitmap
        }
    }

    /**
     * @type {Integer}
     */
    ProcessorClockFrequency {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    InterruptClockFrequency {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ApicRemoteRead {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {WHV_PROCESSOR_FEATURES_BANKS}
     */
    ProcessorFeaturesBanks{
        get {
            if(!this.HasProp("__ProcessorFeaturesBanks"))
                this.__ProcessorFeaturesBanks := WHV_PROCESSOR_FEATURES_BANKS(this.ptr + 0)
            return this.__ProcessorFeaturesBanks
        }
    }

    /**
     * @type {Integer}
     */
    ReferenceTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PrimaryNumaNode {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CpuReserve {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CpuCap {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CpuWeight {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CpuGroupId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ProcessorFrequencyCap {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AllowDeviceAssignment {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {WHV_PROCESSOR_PERFMON_FEATURES}
     */
    ProcessorPerfmonFeatures{
        get {
            if(!this.HasProp("__ProcessorPerfmonFeatures"))
                this.__ProcessorPerfmonFeatures := WHV_PROCESSOR_PERFMON_FEATURES(this.ptr + 0)
            return this.__ProcessorPerfmonFeatures
        }
    }

    /**
     * @type {Integer}
     */
    DisableSmt {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
