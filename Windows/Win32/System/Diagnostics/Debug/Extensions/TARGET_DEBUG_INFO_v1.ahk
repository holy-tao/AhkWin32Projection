#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OS_TYPE.ahk" { OS_TYPE }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_ALL.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_ALL }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_X86.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_X86 }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_ARM64.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_ARM64 }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_IA64.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_IA64 }
#Import ".\OS_INFO_v1.ahk" { OS_INFO_v1 }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_ARM.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_ARM }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_AMD64.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_AMD64 }
#Import ".\DEBUG_PROCESSOR_IDENTIFICATION_ALPHA.ahk" { DEBUG_PROCESSOR_IDENTIFICATION_ALPHA }
#Import ".\CPU_INFO_v1.ahk" { CPU_INFO_v1 }
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct TARGET_DEBUG_INFO_v1 {
    #StructPack 8

    SizeOfStruct : UInt32

    Id : Int64

    Source : Int64

    EntryDate : Int64

    SysUpTime : Int64

    AppUpTime : Int64

    CrashTime : Int64

    Mode : Int64

    OsInfo : OS_INFO_v1

    Cpu : CPU_INFO_v1

    DumpFile : CHAR[260]

    FailureData : IntPtr

    StackTr : CHAR[4096]

}
