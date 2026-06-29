#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESS_HANDLE_TRACING_QUERY {
    #StructPack 8

    Handle : HANDLE

    TotalTraces : UInt32

    HandleTrace : IntPtr[1]

}
