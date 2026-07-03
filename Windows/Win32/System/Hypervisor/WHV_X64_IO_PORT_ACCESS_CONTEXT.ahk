#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_X64_IO_PORT_ACCESS_INFO.ahk" { WHV_X64_IO_PORT_ACCESS_INFO }
#Import ".\WHV_X64_SEGMENT_REGISTER.ahk" { WHV_X64_SEGMENT_REGISTER }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_IO_PORT_ACCESS_CONTEXT {
    #StructPack 8

    InstructionByteCount : Int8

    Reserved : Int8[3]

    InstructionBytes : Int8[16]

    AccessInfo : WHV_X64_IO_PORT_ACCESS_INFO

    PortNumber : UInt16

    Reserved2 : UInt16[3]

    Rax : Int64

    Rcx : Int64

    Rsi : Int64

    Rdi : Int64

    Ds : WHV_X64_SEGMENT_REGISTER

    Es : WHV_X64_SEGMENT_REGISTER

}
