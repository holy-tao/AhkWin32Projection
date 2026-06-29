#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_STRING {
    #StructPack 4

    lResult : Int32

    ulStringSize : UInt32

    argbString : Int8[1]

}
