#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINHTTP_PROXY_RESULT structure contains collection of proxy result entries provided by WinHttpGetProxyResult.
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ns-winhttp-winhttp_proxy_result
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_RESULT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of entries in the <b>pEntries</b> array.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ns-winhttp-winhttp_proxy_result_entry">WINHTTP_PROXY_RESULT_ENTRY</a> structures.
     * @type {Pointer<WINHTTP_PROXY_RESULT_ENTRY>}
     */
    pEntries {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
