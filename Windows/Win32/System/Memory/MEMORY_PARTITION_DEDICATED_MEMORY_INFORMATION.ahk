#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct MEMORY_PARTITION_DEDICATED_MEMORY_INFORMATION {
    #StructPack 8

    NextEntryOffset : UInt32

    SizeOfInformation : UInt32

    Flags : UInt32

    AttributesOffset : UInt32

    AttributeCount : UInt32

    Reserved : UInt32

    TypeId : Int64

}
