#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SCATTER_GATHER_LIST {
    #StructPack 8

    NumberOfElements : UInt32

    Reserved : IntPtr

    Elements : IntPtr[1]

}
