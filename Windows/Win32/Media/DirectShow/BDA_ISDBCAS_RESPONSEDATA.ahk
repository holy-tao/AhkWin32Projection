#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_ISDBCAS_RESPONSEDATA {
    #StructPack 4

    lResult : Int32

    ulRequestID : UInt32

    ulIsdbStatus : UInt32

    ulIsdbDataSize : UInt32

    argbIsdbCommandData : Int8[1]

}
