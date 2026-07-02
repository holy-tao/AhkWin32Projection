#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\LPSERVICE_CALLBACK_PROC.ahk" { LPSERVICE_CALLBACK_PROC }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SERVICE_ASYNC_INFO {
    #StructPack 8

    lpServiceCallbackProc : LPSERVICE_CALLBACK_PROC

    lParam : LPARAM

    hAsyncTaskHandle : HANDLE

}
