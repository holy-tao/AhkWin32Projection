#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MEM_DEDICATED_ATTRIBUTE_TYPE.ahk" { MEM_DEDICATED_ATTRIBUTE_TYPE }

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct MEMORY_PARTITION_DEDICATED_MEMORY_ATTRIBUTE {
    #StructPack 8

    Type : MEM_DEDICATED_ATTRIBUTE_TYPE

    Reserved : UInt32

    Value : Int64

}
