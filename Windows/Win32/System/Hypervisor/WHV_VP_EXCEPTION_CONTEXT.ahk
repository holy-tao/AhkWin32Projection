#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_VP_EXCEPTION_INFO.ahk" { WHV_VP_EXCEPTION_INFO }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VP_EXCEPTION_CONTEXT {
    #StructPack 8

    InstructionByteCount : Int8

    Reserved : Int8[3]

    InstructionBytes : Int8[16]

    ExceptionInfo : WHV_VP_EXCEPTION_INFO

    ExceptionType : Int8

    Reserved2 : Int8[3]

    ErrorCode : UInt32

    ExceptionParameter : Int64

}
