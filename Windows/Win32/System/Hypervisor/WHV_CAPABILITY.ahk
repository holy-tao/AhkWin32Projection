#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_PROCESSOR_PERFMON_FEATURES.ahk" { WHV_PROCESSOR_PERFMON_FEATURES }
#Import ".\WHV_PROCESSOR_VENDOR.ahk" { WHV_PROCESSOR_VENDOR }
#Import ".\WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP.ahk" { WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP }
#Import ".\WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS.ahk" { WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS }
#Import ".\WHV_CAPABILITY_FEATURES.ahk" { WHV_CAPABILITY_FEATURES }
#Import ".\WHV_SCHEDULER_FEATURES.ahk" { WHV_SCHEDULER_FEATURES }
#Import ".\WHV_PROCESSOR_FEATURES1.ahk" { WHV_PROCESSOR_FEATURES1 }
#Import ".\WHV_EXTENDED_VM_EXITS.ahk" { WHV_EXTENDED_VM_EXITS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WHV_PROCESSOR_XSAVE_FEATURES.ahk" { WHV_PROCESSOR_XSAVE_FEATURES }
#Import ".\WHV_PROCESSOR_FEATURES_BANKS.ahk" { WHV_PROCESSOR_FEATURES_BANKS }
#Import ".\WHV_PROCESSOR_FEATURES.ahk" { WHV_PROCESSOR_FEATURES }
#Import ".\WHV_SYNTHETIC_PROCESSOR_FEATURES.ahk" { WHV_SYNTHETIC_PROCESSOR_FEATURES }
#Import ".\WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS.ahk" { WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS }
#Import ".\WHV_X64_MSR_EXIT_BITMAP.ahk" { WHV_X64_MSR_EXIT_BITMAP }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_CAPABILITY {
    #StructPack 8

    HypervisorPresent : BOOL

    static __New() {
        DefineProp(this.Prototype, 'Features', { type: WHV_CAPABILITY_FEATURES, offset: 0 })
        DefineProp(this.Prototype, 'ExtendedVmExits', { type: WHV_EXTENDED_VM_EXITS, offset: 0 })
        DefineProp(this.Prototype, 'ProcessorVendor', { type: WHV_PROCESSOR_VENDOR, offset: 0 })
        DefineProp(this.Prototype, 'ProcessorFeatures', { type: WHV_PROCESSOR_FEATURES, offset: 0 })
        DefineProp(this.Prototype, 'SyntheticProcessorFeaturesBanks', { type: WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS, offset: 0 })
        DefineProp(this.Prototype, 'ProcessorXsaveFeatures', { type: WHV_PROCESSOR_XSAVE_FEATURES, offset: 0 })
        DefineProp(this.Prototype, 'ProcessorClFlushSize', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'ExceptionExitBitmap', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'X64MsrExitBitmap', { type: WHV_X64_MSR_EXIT_BITMAP, offset: 0 })
        DefineProp(this.Prototype, 'ProcessorClockFrequency', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'InterruptClockFrequency', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'ProcessorFeaturesBanks', { type: WHV_PROCESSOR_FEATURES_BANKS, offset: 0 })
        DefineProp(this.Prototype, 'GpaRangePopulateFlags', { type: WHV_ADVISE_GPA_RANGE_POPULATE_FLAGS, offset: 0 })
        DefineProp(this.Prototype, 'ProcessorFrequencyCap', { type: WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP, offset: 0 })
        DefineProp(this.Prototype, 'ProcessorPerfmonFeatures', { type: WHV_PROCESSOR_PERFMON_FEATURES, offset: 0 })
        DefineProp(this.Prototype, 'SchedulerFeatures', { type: WHV_SCHEDULER_FEATURES, offset: 0 })
        this.DeleteProp("__New")
    }
}
