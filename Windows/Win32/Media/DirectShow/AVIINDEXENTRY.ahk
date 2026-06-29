#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVIINDEXENTRY {
    #StructPack 4

    ckid : UInt32

    dwFlags : UInt32

    dwChunkOffset : UInt32

    dwChunkLength : UInt32

}
