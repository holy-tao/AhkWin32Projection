#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DBPROPINFO.ahk" { DBPROPINFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBPROPINFOSET {
    #StructPack 8

    rgPropertyInfos : DBPROPINFO.Ptr

    cPropertyInfos : UInt32

    guidPropertySet : Guid

}
