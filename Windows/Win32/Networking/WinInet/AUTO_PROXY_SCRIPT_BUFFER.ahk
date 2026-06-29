#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The AUTO_PROXY_SCRIPT_BUFFER structure is used to pass an autoproxy script in a buffer to InternetInitializeAutoProxyDll , instead of identifying a file that InternetInitializeAutoProxyDll opens.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-auto_proxy_script_buffer
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct AUTO_PROXY_SCRIPT_BUFFER {
    #StructPack 8

    /**
     * Size of this structure. Always set to "sizeof(AUTO_PROXY_SCRIPT_BUFFER)".
     */
    dwStructSize : UInt32

    /**
     * Pointer to the script buffer being passed using this structure.
     */
    lpszScriptBuffer : PSTR

    /**
     * Size of the script buffer pointed to by <b>lpszScriptBuffer</b>.
     */
    dwScriptBufferSize : UInt32

}
