#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FS_FILTER_SECTION_SYNC_OUTPUT {
    #StructPack 4

    StructureSize : UInt32

    SizeReturned : UInt32

    Flags : UInt32

    DesiredReadAlignment : UInt32

}
