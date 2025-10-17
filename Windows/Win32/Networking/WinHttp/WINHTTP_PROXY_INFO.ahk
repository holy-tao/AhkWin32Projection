#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINHTTP_PROXY_INFO structure contains the session or default proxy configuration.
 * @remarks
 * 
  * This structure is used with 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetoption">WinHttpSetOption</a> and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpqueryoption">WinHttpQueryOption</a> to get or set the proxy configuration for the current session by specifying the WINHTTP_OPTION_PROXY flag.
  * 
  * This structure is used with 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpsetdefaultproxyconfiguration">WinHttpSetDefaultProxyConfiguration</a> and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetdefaultproxyconfiguration">WinHttpGetDefaultProxyConfiguration</a> to get or set the default proxy configuration in the registry.
  * 
  * The proxy server list contains one or more of the following strings separated by semicolons or whitespace.
  * 
  * 
  * <pre class="syntax" xml:space="preserve"><code>([&lt;scheme&gt;=][&lt;scheme&gt;"://"]&lt;server&gt;[":"&lt;port&gt;])
  * </code></pre>
  * The proxy bypass list contains one or more server names separated by semicolons or whitespace.  The proxy bypass list can also contain the string "&lt;local&gt;" to indicate that all local intranet sites are bypassed.  Local intranet sites are considered to be all servers that do not contain a period in their name.
  * 
  * <div class="alert"><b>Note</b>  For Windows XP and Windows 2000, see the <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Run-Time Requirements</a> section of the WinHttp start page.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ns-winhttp-winhttp_proxy_info
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwAccessType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a string value that contains the proxy server list.
     * @type {PWSTR}
     */
    lpszProxy {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a string value that contains the proxy bypass list.
     * @type {PWSTR}
     */
    lpszProxyBypass {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
