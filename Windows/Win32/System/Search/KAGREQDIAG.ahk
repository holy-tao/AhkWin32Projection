#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Variant\VARENUM.ahk" { VARENUM }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct KAGREQDIAG {
    #StructPack 4

    ulDiagFlags : UInt32

    vt : VARENUM

    sDiagField : Int16

}
