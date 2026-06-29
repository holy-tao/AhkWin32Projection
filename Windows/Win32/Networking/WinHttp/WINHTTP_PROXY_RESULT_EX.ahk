#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WINHTTP_PROXY_RESULT_ENTRY.ahk" { WINHTTP_PROXY_RESULT_ENTRY }

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_PROXY_RESULT_EX {
    #StructPack 8

    cEntries : UInt32

    pEntries : WINHTTP_PROXY_RESULT_ENTRY.Ptr

    hProxyDetectionHandle : HANDLE

    dwProxyInterfaceAffinity : UInt32

}
