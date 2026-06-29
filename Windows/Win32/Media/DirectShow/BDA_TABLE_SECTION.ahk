#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_TABLE_SECTION {
    #StructPack 4

    ulPrimarySectionId : UInt32

    ulSecondarySectionId : UInt32

    ulcbSectionLength : UInt32

    argbSectionData : UInt32[1]

}
