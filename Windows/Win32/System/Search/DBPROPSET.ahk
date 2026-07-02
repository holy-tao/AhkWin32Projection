#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBPROP.ahk" { DBPROP }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBPROPSET {
    #StructPack 8

    rgProperties : DBPROP.Ptr

    cProperties : UInt32

    guidPropertySet : Guid

}
