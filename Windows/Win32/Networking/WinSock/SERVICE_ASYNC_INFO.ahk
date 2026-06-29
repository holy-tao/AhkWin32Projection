#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SERVICE_ASYNC_INFO {
    #StructPack 8

    lpServiceCallbackProc : IntPtr

    lParam : LPARAM

    hAsyncTaskHandle : HANDLE

}
