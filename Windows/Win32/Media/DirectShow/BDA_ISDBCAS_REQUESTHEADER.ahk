#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_ISDBCAS_REQUESTHEADER {
    #StructPack 4

    bInstruction : Int8

    bReserved : Int8[3]

    ulDataLength : UInt32

    argbIsdbCommand : Int8[1]

}
