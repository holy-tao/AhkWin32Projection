#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_MEMORY_ACCESS_INFO.ahk" { WHV_MEMORY_ACCESS_INFO }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_MEMORY_ACCESS_CONTEXT {
    #StructPack 8

    InstructionByteCount : Int8

    Reserved : Int8[3]

    InstructionBytes : Int8[16]

    AccessInfo : WHV_MEMORY_ACCESS_INFO

    Gpa : Int64

    Gva : Int64

}
