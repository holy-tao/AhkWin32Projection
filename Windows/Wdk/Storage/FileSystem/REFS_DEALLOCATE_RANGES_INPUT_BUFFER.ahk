#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_DEALLOCATE_RANGES_INPUT_BUFFER {
    #StructPack 8

    RangeCount : UInt32

    Ranges : IntPtr[1]

}
