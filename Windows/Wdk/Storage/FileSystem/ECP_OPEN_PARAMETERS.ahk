#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct ECP_OPEN_PARAMETERS {
    #StructPack 4

    Size : UInt16

    Reserved : UInt16

    Flags : UInt32

}
