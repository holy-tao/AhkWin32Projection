#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_CAPABILITY_FEATURES.ahk
#Include .\WHV_EXTENDED_VM_EXITS.ahk
#Include .\WHV_PROCESSOR_FEATURES.ahk
#Include .\WHV_SYNTHETIC_PROCESSOR_FEATURES.ahk
#Include .\WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS.ahk
#Include .\WHV_PROCESSOR_XSAVE_FEATURES.ahk
#Include .\WHV_X64_MSR_EXIT_BITMAP.ahk
#Include .\WHV_PROCESSOR_FEATURES1.ahk
#Include .\WHV_PROCESSOR_FEATURES_BANKS.ahk
#Include .\WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS.ahk
#Include .\WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP.ahk
#Include .\WHV_PROCESSOR_PERFMON_FEATURES.ahk
#Include .\WHV_SCHEDULER_FEATURES.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_CAPABILITY extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    /**
     * @type {Integer}
     */
    HypervisorPresent {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {WHV_CAPABILITY_FEATURES}
     */
    Features{
        get {
            if(!this.HasProp("__Features"))
                this.__Features := WHV_CAPABILITY_FEATURES(this.ptr + 0)
            return this.__Features
        }
    }

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
     * @type {Integer}
     */
    ProcessorVendor {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
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
    ExceptionExitBitmap {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
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
     * @type {WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS}
     */
    GpaRangePopulateFlags{
        get {
            if(!this.HasProp("__GpaRangePopulateFlags"))
                this.__GpaRangePopulateFlags := WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS(this.ptr + 0)
            return this.__GpaRangePopulateFlags
        }
    }

    /**
     * @type {WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP}
     */
    ProcessorFrequencyCap{
        get {
            if(!this.HasProp("__ProcessorFrequencyCap"))
                this.__ProcessorFrequencyCap := WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP(this.ptr + 0)
            return this.__ProcessorFrequencyCap
        }
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
     * @type {WHV_SCHEDULER_FEATURES}
     */
    SchedulerFeatures{
        get {
            if(!this.HasProp("__SchedulerFeatures"))
                this.__SchedulerFeatures := WHV_SCHEDULER_FEATURES(this.ptr + 0)
            return this.__SchedulerFeatures
        }
    }
}
