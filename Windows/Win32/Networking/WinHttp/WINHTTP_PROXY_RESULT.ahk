#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINHTTP_PROXY_RESULT_ENTRY.ahk" { WINHTTP_PROXY_RESULT_ENTRY }

/**
 * The WINHTTP_PROXY_RESULT structure contains collection of proxy result entries provided by WinHttpGetProxyResult.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_result
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_PROXY_RESULT {
    #StructPack 8

    /**
     * The number of entries in the <b>pEntries</b> array.
     */
    cEntries : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_proxy_result_entry">WINHTTP_PROXY_RESULT_ENTRY</a> structures.
     */
    pEntries : WINHTTP_PROXY_RESULT_ENTRY.Ptr

}
