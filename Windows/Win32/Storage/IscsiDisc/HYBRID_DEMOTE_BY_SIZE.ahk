#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct HYBRID_DEMOTE_BY_SIZE {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    SourcePriority : Int8

    TargetPriority : Int8

    Reserved0 : UInt16

    Reserved1 : UInt32

    LbaCount : Int64

}
