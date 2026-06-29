#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBINDEXCOLUMNDESC {
    #StructPack 8

    pColumnID : DBID.Ptr

    eIndexColOrder : UInt32

}
