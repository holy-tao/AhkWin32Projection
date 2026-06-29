#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct NVCACHE_PRIORITY_LEVEL_DESCRIPTOR {
    #StructPack 4

    PriorityLevel : Int8

    Reserved0 : Int8[3]

    ConsumedNVMSizeFraction : UInt32

    ConsumedMappingResourcesFraction : UInt32

    ConsumedNVMSizeForDirtyDataFraction : UInt32

    ConsumedMappingResourcesForDirtyDataFraction : UInt32

    Reserved1 : UInt32

}
