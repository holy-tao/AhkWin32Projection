#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct RESOURCEMANAGER_BASIC_INFORMATION {
    #StructPack 4

    ResourceManagerId : Guid

    DescriptionLength : UInt32

    Description : WCHAR[1]

}
