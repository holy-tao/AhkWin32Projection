#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AUTO_PROXY_SCRIPT_BUFFER structure is used to pass an autoproxy script in a buffer to InternetInitializeAutoProxyDll , instead of identifying a file that InternetInitializeAutoProxyDll opens.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wininet/ns-wininet-auto_proxy_script_buffer
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class AUTO_PROXY_SCRIPT_BUFFER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Size of this structure. Always set to "sizeof(AUTO_PROXY_SCRIPT_BUFFER)".
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the script buffer being passed using this structure.
     * @type {PSTR}
     */
    lpszScriptBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Size of the script buffer pointed to by <b>lpszScriptBuffer</b>.
     * @type {Integer}
     */
    dwScriptBufferSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
