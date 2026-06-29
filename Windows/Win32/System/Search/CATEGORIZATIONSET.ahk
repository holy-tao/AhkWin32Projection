#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CATEGORIZATION.ahk" { CATEGORIZATION }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct CATEGORIZATIONSET {
    #StructPack 8

    cCat : UInt32

    aCat : CATEGORIZATION.Ptr

}
