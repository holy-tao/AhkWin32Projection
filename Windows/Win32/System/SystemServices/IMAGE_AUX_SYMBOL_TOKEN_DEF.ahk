#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_AUX_SYMBOL_TOKEN_DEF {
    #StructPack 4

    bAuxType : Int8

    bReserved : Int8

    SymbolTableIndex : UInt32

    rgbReserved : Int8[12]

}
