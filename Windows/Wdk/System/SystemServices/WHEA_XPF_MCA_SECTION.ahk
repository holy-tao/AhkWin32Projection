#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_CPU_VENDOR.ahk" { WHEA_CPU_VENDOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_XPF_MCA_SECTION {
    #StructPack 8

    VersionNumber : UInt32

    CpuVendor : WHEA_CPU_VENDOR

    Timestamp : Int64

    ProcessorNumber : UInt32

    GlobalStatus : IntPtr

    InstructionPointer : Int64

    BankNumber : UInt32

    Status : IntPtr

    Address : Int64

    Misc : Int64

    ExtendedRegisterCount : UInt32

    ApicId : UInt32

    ExtendedRegisters : Int64[24]

    GlobalCapability : IntPtr

    RecoveryInfo : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'AMDExtendedRegisters', { type: IntPtr, offset: 80 })
        this.DeleteProp("__New")
    }
}
