#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBPROPIDSET {
    #StructPack 8

    rgPropertyIDs : IntPtr

    cPropertyIDs : UInt32

    guidPropertySet : Guid

}
