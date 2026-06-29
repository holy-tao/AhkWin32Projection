#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_BUFFER {
    #StructPack 4

    lResult : Int32

    ulBufferSize : UInt32

    argbBuffer : Int8[1]

}
