#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct NVCACHE_HINT_PAYLOAD {
    #StructPack 1

    Command : Int8

    Feature7_0 : Int8

    Feature15_8 : Int8

    Count15_8 : Int8

    LBA7_0 : Int8

    LBA15_8 : Int8

    LBA23_16 : Int8

    LBA31_24 : Int8

    LBA39_32 : Int8

    LBA47_40 : Int8

    Auxiliary7_0 : Int8

    Auxiliary23_16 : Int8

    Reserved : Int8[4]

}
