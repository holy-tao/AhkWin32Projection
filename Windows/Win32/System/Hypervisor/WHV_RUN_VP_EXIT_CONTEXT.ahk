#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_X64_VP_EXECUTION_STATE.ahk
#Include .\WHV_X64_SEGMENT_REGISTER.ahk
#Include .\WHV_VP_EXIT_CONTEXT.ahk
#Include .\WHV_MEMORY_ACCESS_INFO.ahk
#Include .\WHV_MEMORY_ACCESS_CONTEXT.ahk
#Include .\WHV_X64_IO_PORT_ACCESS_INFO.ahk
#Include .\WHV_X64_IO_PORT_ACCESS_CONTEXT.ahk
#Include .\WHV_X64_MSR_ACCESS_INFO.ahk
#Include .\WHV_X64_MSR_ACCESS_CONTEXT.ahk
#Include .\WHV_X64_CPUID_ACCESS_CONTEXT.ahk
#Include .\WHV_VP_EXCEPTION_INFO.ahk
#Include .\WHV_VP_EXCEPTION_CONTEXT.ahk
#Include .\WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT.ahk
#Include .\WHV_X64_UNSUPPORTED_FEATURE_CONTEXT.ahk
#Include .\WHV_RUN_VP_CANCELED_CONTEXT.ahk
#Include .\WHV_X64_RDTSC_INFO.ahk
#Include .\WHV_X64_RDTSC_CONTEXT.ahk
#Include .\WHV_UINT128.ahk
#Include .\WHV_HYPERCALL_CONTEXT.ahk
#Include .\WHV_X64_APIC_WRITE_CONTEXT.ahk
#Include .\WHV_SYNIC_SINT_DELIVERABLE_CONTEXT.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_RUN_VP_EXIT_CONTEXT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ExitReason {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {WHV_VP_EXIT_CONTEXT}
     */
    VpContext{
        get {
            if(!this.HasProp("__VpContext"))
                this.__VpContext := WHV_VP_EXIT_CONTEXT(this.ptr + 8)
            return this.__VpContext
        }
    }

    /**
     * @type {WHV_MEMORY_ACCESS_CONTEXT}
     */
    MemoryAccess{
        get {
            if(!this.HasProp("__MemoryAccess"))
                this.__MemoryAccess := WHV_MEMORY_ACCESS_CONTEXT(this.ptr + 56)
            return this.__MemoryAccess
        }
    }

    /**
     * @type {WHV_X64_IO_PORT_ACCESS_CONTEXT}
     */
    IoPortAccess{
        get {
            if(!this.HasProp("__IoPortAccess"))
                this.__IoPortAccess := WHV_X64_IO_PORT_ACCESS_CONTEXT(this.ptr + 56)
            return this.__IoPortAccess
        }
    }

    /**
     * @type {WHV_X64_MSR_ACCESS_CONTEXT}
     */
    MsrAccess{
        get {
            if(!this.HasProp("__MsrAccess"))
                this.__MsrAccess := WHV_X64_MSR_ACCESS_CONTEXT(this.ptr + 56)
            return this.__MsrAccess
        }
    }

    /**
     * @type {WHV_X64_CPUID_ACCESS_CONTEXT}
     */
    CpuidAccess{
        get {
            if(!this.HasProp("__CpuidAccess"))
                this.__CpuidAccess := WHV_X64_CPUID_ACCESS_CONTEXT(this.ptr + 56)
            return this.__CpuidAccess
        }
    }

    /**
     * @type {WHV_VP_EXCEPTION_CONTEXT}
     */
    VpException{
        get {
            if(!this.HasProp("__VpException"))
                this.__VpException := WHV_VP_EXCEPTION_CONTEXT(this.ptr + 56)
            return this.__VpException
        }
    }

    /**
     * @type {WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT}
     */
    InterruptWindow{
        get {
            if(!this.HasProp("__InterruptWindow"))
                this.__InterruptWindow := WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT(this.ptr + 56)
            return this.__InterruptWindow
        }
    }

    /**
     * @type {WHV_X64_UNSUPPORTED_FEATURE_CONTEXT}
     */
    UnsupportedFeature{
        get {
            if(!this.HasProp("__UnsupportedFeature"))
                this.__UnsupportedFeature := WHV_X64_UNSUPPORTED_FEATURE_CONTEXT(this.ptr + 56)
            return this.__UnsupportedFeature
        }
    }

    /**
     * @type {WHV_RUN_VP_CANCELED_CONTEXT}
     */
    CancelReason{
        get {
            if(!this.HasProp("__CancelReason"))
                this.__CancelReason := WHV_RUN_VP_CANCELED_CONTEXT(this.ptr + 56)
            return this.__CancelReason
        }
    }

    /**
     * @type {Integer}
     */
    ApicEoi {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {WHV_X64_RDTSC_CONTEXT}
     */
    ReadTsc{
        get {
            if(!this.HasProp("__ReadTsc"))
                this.__ReadTsc := WHV_X64_RDTSC_CONTEXT(this.ptr + 56)
            return this.__ReadTsc
        }
    }

    /**
     * @type {Integer}
     */
    ApicSmi {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {WHV_HYPERCALL_CONTEXT}
     */
    Hypercall{
        get {
            if(!this.HasProp("__Hypercall"))
                this.__Hypercall := WHV_HYPERCALL_CONTEXT(this.ptr + 56)
            return this.__Hypercall
        }
    }

    /**
     * @type {Integer}
     */
    ApicInitSipi {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {WHV_X64_APIC_WRITE_CONTEXT}
     */
    ApicWrite{
        get {
            if(!this.HasProp("__ApicWrite"))
                this.__ApicWrite := WHV_X64_APIC_WRITE_CONTEXT(this.ptr + 56)
            return this.__ApicWrite
        }
    }

    /**
     * @type {WHV_SYNIC_SINT_DELIVERABLE_CONTEXT}
     */
    SynicSintDeliverable{
        get {
            if(!this.HasProp("__SynicSintDeliverable"))
                this.__SynicSintDeliverable := WHV_SYNIC_SINT_DELIVERABLE_CONTEXT(this.ptr + 56)
            return this.__SynicSintDeliverable
        }
    }
}
