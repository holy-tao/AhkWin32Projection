#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_GET_BC_PROPERTIES_INPUT {
    #StructPack 8

    Version : UInt32

    Reserved1 : UInt32

    LowestByteOffset : Int64

    HighestByteOffset : Int64

    AccessType : UInt32

    AccessMode : UInt32

}
