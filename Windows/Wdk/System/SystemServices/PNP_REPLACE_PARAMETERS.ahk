#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PNP_REPLACE_MEMORY_LIST.ahk" { PNP_REPLACE_MEMORY_LIST }
#Import ".\PNP_REPLACE_PROCESSOR_LIST.ahk" { PNP_REPLACE_PROCESSOR_LIST }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PNP_REPLACE_PARAMETERS {
    #StructPack 8

    Size : UInt32

    Version : UInt32

    Target : Int64

    Spare : Int64

    TargetProcessors : PNP_REPLACE_PROCESSOR_LIST.Ptr

    SpareProcessors : PNP_REPLACE_PROCESSOR_LIST.Ptr

    TargetMemory : PNP_REPLACE_MEMORY_LIST.Ptr

    SpareMemory : PNP_REPLACE_MEMORY_LIST.Ptr

    MapMemory : IntPtr

}
