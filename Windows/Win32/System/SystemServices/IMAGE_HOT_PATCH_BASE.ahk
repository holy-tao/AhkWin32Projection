#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_HOT_PATCH_BASE {
    #StructPack 4

    SequenceNumber : UInt32

    Flags : UInt32

    OriginalTimeDateStamp : UInt32

    OriginalCheckSum : UInt32

    CodeIntegrityInfo : UInt32

    CodeIntegritySize : UInt32

    PatchTable : UInt32

    BufferOffset : UInt32

}
