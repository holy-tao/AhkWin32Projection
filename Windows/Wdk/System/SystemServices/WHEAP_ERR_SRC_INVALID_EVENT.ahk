#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_ERR_SRC_INVALID_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    ErrDescriptor : IntPtr

    Error : CHAR[32]

}
