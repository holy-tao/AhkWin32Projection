#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_RUN_VP_CANCEL_REASON.ahk" { WHV_RUN_VP_CANCEL_REASON }
#Import ".\WHV_X64_APIC_SMI_CONTEXT.ahk" { WHV_X64_APIC_SMI_CONTEXT }
#Import ".\WHV_VP_EXCEPTION_INFO.ahk" { WHV_VP_EXCEPTION_INFO }
#Import ".\WHV_X64_UNSUPPORTED_FEATURE_CONTEXT.ahk" { WHV_X64_UNSUPPORTED_FEATURE_CONTEXT }
#Import ".\WHV_X64_RDTSC_CONTEXT.ahk" { WHV_X64_RDTSC_CONTEXT }
#Import ".\WHV_X64_APIC_INIT_SIPI_CONTEXT.ahk" { WHV_X64_APIC_INIT_SIPI_CONTEXT }
#Import ".\WHV_X64_UNSUPPORTED_FEATURE_CODE.ahk" { WHV_X64_UNSUPPORTED_FEATURE_CODE }
#Import ".\WHV_X64_APIC_WRITE_TYPE.ahk" { WHV_X64_APIC_WRITE_TYPE }
#Import ".\WHV_UINT128.ahk" { WHV_UINT128 }
#Import ".\WHV_X64_MSR_ACCESS_INFO.ahk" { WHV_X64_MSR_ACCESS_INFO }
#Import ".\WHV_VP_EXCEPTION_CONTEXT.ahk" { WHV_VP_EXCEPTION_CONTEXT }
#Import ".\WHV_MEMORY_ACCESS_INFO.ahk" { WHV_MEMORY_ACCESS_INFO }
#Import ".\WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT.ahk" { WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT }
#Import ".\WHV_RUN_VP_CANCELED_CONTEXT.ahk" { WHV_RUN_VP_CANCELED_CONTEXT }
#Import ".\WHV_X64_APIC_EOI_CONTEXT.ahk" { WHV_X64_APIC_EOI_CONTEXT }
#Import ".\WHV_VP_EXIT_CONTEXT.ahk" { WHV_VP_EXIT_CONTEXT }
#Import ".\WHV_X64_VP_EXECUTION_STATE.ahk" { WHV_X64_VP_EXECUTION_STATE }
#Import ".\WHV_X64_IO_PORT_ACCESS_CONTEXT.ahk" { WHV_X64_IO_PORT_ACCESS_CONTEXT }
#Import ".\WHV_MEMORY_ACCESS_CONTEXT.ahk" { WHV_MEMORY_ACCESS_CONTEXT }
#Import ".\WHV_SYNIC_SINT_DELIVERABLE_CONTEXT.ahk" { WHV_SYNIC_SINT_DELIVERABLE_CONTEXT }
#Import ".\WHV_X64_RDTSC_INFO.ahk" { WHV_X64_RDTSC_INFO }
#Import ".\WHV_HYPERCALL_CONTEXT.ahk" { WHV_HYPERCALL_CONTEXT }
#Import ".\WHV_X64_IO_PORT_ACCESS_INFO.ahk" { WHV_X64_IO_PORT_ACCESS_INFO }
#Import ".\WHV_X64_PENDING_INTERRUPTION_TYPE.ahk" { WHV_X64_PENDING_INTERRUPTION_TYPE }
#Import ".\WHV_X64_APIC_WRITE_CONTEXT.ahk" { WHV_X64_APIC_WRITE_CONTEXT }
#Import ".\WHV_X64_CPUID_ACCESS_CONTEXT.ahk" { WHV_X64_CPUID_ACCESS_CONTEXT }
#Import ".\WHV_RUN_VP_EXIT_REASON.ahk" { WHV_RUN_VP_EXIT_REASON }
#Import ".\WHV_X64_MSR_ACCESS_CONTEXT.ahk" { WHV_X64_MSR_ACCESS_CONTEXT }
#Import ".\WHV_X64_SEGMENT_REGISTER.ahk" { WHV_X64_SEGMENT_REGISTER }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_RUN_VP_EXIT_CONTEXT {
    #StructPack 8

    ExitReason : WHV_RUN_VP_EXIT_REASON

    Reserved : UInt32

    VpContext : WHV_VP_EXIT_CONTEXT

    MemoryAccess : WHV_MEMORY_ACCESS_CONTEXT

    static __New() {
        DefineProp(this.Prototype, 'IoPortAccess', { type: WHV_X64_IO_PORT_ACCESS_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'MsrAccess', { type: WHV_X64_MSR_ACCESS_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'CpuidAccess', { type: WHV_X64_CPUID_ACCESS_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'VpException', { type: WHV_VP_EXCEPTION_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'InterruptWindow', { type: WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'UnsupportedFeature', { type: WHV_X64_UNSUPPORTED_FEATURE_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'CancelReason', { type: WHV_RUN_VP_CANCELED_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'ApicEoi', { type: WHV_X64_APIC_EOI_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'ReadTsc', { type: WHV_X64_RDTSC_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'ApicSmi', { type: WHV_X64_APIC_SMI_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'Hypercall', { type: WHV_HYPERCALL_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'ApicInitSipi', { type: WHV_X64_APIC_INIT_SIPI_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'ApicWrite', { type: WHV_X64_APIC_WRITE_CONTEXT, offset: 56 })
        DefineProp(this.Prototype, 'SynicSintDeliverable', { type: WHV_SYNIC_SINT_DELIVERABLE_CONTEXT, offset: 56 })
        this.DeleteProp("__New")
    }
}
