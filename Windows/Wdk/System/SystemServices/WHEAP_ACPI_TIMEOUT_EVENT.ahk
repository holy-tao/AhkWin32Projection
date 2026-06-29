#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_ACPI_TIMEOUT_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    TableType : CHAR[32]

    TableRequest : CHAR[32]

}
