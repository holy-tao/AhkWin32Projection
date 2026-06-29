#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SORTKEY.ahk" { SORTKEY }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SORTSET {
    #StructPack 8

    cCol : UInt32

    aCol : SORTKEY.Ptr

}
