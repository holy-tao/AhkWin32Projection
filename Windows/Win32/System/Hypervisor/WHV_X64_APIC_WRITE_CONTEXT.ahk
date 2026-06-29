#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_X64_APIC_WRITE_TYPE.ahk" { WHV_X64_APIC_WRITE_TYPE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_APIC_WRITE_CONTEXT {
    #StructPack 8

    Type : WHV_X64_APIC_WRITE_TYPE

    Reserved : UInt32

    WriteValue : Int64

}
