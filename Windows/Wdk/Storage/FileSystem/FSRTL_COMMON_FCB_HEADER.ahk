#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\ERESOURCE.ahk" { ERESOURCE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSRTL_COMMON_FCB_HEADER {
    #StructPack 8

    NodeTypeCode : Int16

    NodeByteSize : Int16

    Flags : Int8

    IsFastIoPossible : Int8

    Flags2 : Int8

    /**
     * This bitfield backs the following members:
     * - Reserved
     * - Version
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Version {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    Resource : ERESOURCE.Ptr

    PagingIoResource : ERESOURCE.Ptr

    AllocationSize : Int64

    FileSize : Int64

    ValidDataLength : Int64

}
