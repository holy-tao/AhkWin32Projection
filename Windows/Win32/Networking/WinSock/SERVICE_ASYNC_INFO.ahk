#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SERVICE_ASYNC_INFO {
    #StructPack 8

    lpServiceCallbackProc : IntPtr

    lParam : LPARAM

    hAsyncTaskHandle : HANDLE

}
