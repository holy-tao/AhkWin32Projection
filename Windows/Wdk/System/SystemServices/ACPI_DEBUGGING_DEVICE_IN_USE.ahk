#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ACPI_DEBUGGING_DEVICE_IN_USE {
    #StructPack 4

    NameSpacePathLength : UInt32

    NameSpacePath : WCHAR[1]

}
