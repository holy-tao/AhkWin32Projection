#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct SEC_OBJECT_ELEMENT {
    #StructPack 8

    guidObjectType : Guid

    ObjectID : DBID

}
