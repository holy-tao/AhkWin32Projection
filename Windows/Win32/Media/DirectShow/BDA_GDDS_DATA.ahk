#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_GDDS_DATA {
    #StructPack 4

    lResult : Int32

    ulDataLength : UInt32

    ulPercentageProgress : UInt32

    argbData : Int8[1]

}
