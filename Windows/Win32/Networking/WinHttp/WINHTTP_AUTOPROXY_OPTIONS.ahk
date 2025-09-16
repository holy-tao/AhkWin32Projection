#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINHTTP_AUTOPROXY_OPTIONS structure is used to indicate to the WinHttpGetProxyForURL function whether to specify the URL of the Proxy Auto-Configuration (PAC) file or to automatically locate the URL with DHCP or DNS queries to the network.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_autoproxy_options
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_AUTOPROXY_OPTIONS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Mechanisms should be used to obtain the PAC file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_ALLOW_AUTOCONFIG"></a><a id="winhttp_autoproxy_allow_autoconfig"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_ALLOW_AUTOCONFIG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables proxy detection via autoconfig URL.
     * <div> </div><div class="alert"><b>Note</b>  Support for this flag was introduced in Windows 10, version 1703 (10.0; Build 15063).</div><div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_ALLOW_CM"></a><a id="winhttp_autoproxy_allow_cm"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_ALLOW_CM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables proxy detection via connection manager.
     * <div> </div><div class="alert"><b>Note</b>  Support for this flag was introduced in Windows 10, version 1703 (10.0; Build 15063).</div><div> </div>
     * </td>
     * </tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_ALLOW_STATIC"></a><a id="winhttp_autoproxy_allow_static"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_ALLOW_STATIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables proxy detection via static configuration.
     * <div> </div><div class="alert"><b>Note</b>  Support for this flag was introduced in Windows 10, version 1703 (10.0; Build 15063).</div><div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_AUTO_DETECT"></a><a id="winhttp_autoproxy_auto_detect"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_AUTO_DETECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempt to automatically discover the URL of the PAC file using both DHCP and DNS queries to the local network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_CONFIG_URL"></a><a id="winhttp_autoproxy_config_url"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_CONFIG_URL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Download the PAC file from the URL specified by <b>lpszAutoConfigUrl</b> in the <b>WINHTTP_AUTOPROXY_OPTIONS</b> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_HOST_KEEPCASE"></a><a id="winhttp_autoproxy_host_keepcase"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_HOST_KEEPCASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Maintains the case of the hostnames passed to the PAC script. This is the default behavior.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_HOST_LOWERCASE"></a><a id="winhttp_autoproxy_host_lowercase"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_HOST_LOWERCASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Converts hostnames to lowercase before passing them to the PAC script.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_NO_CACHE_CLIENT"></a><a id="winhttp_autoproxy_no_cache_client"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_NO_CACHE_CLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables querying a host to proxy cache of script execution results in the current process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_NO_CACHE_SVC"></a><a id="winhttp_autoproxy_no_cache_svc"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_NO_CACHE_SVC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables querying a host to proxy cache of script execution results in the autoproxy service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_NO_DIRECTACCESS"></a><a id="winhttp_autoproxy_no_directaccess"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_NO_DIRECTACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables querying Direct Access proxy settings for this request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_RUN_INPROCESS"></a><a id="winhttp_autoproxy_run_inprocess"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_RUN_INPROCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Executes the Web Proxy Auto-Discovery (WPAD) protocol in-process instead of delegating to an out-of-process WinHTTP AutoProxy Service, if available. This flag must be combined with one of the other flags.
     * 
     * This option has no effect when passed to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.
     * 
     * <div class="alert"><b>Note</b>  This flag is deprecated.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_RUN_OUTPROCESS_ONLY"></a><a id="winhttp_autoproxy_run_outprocess_only"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_RUN_OUTPROCESS_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * By default, WinHTTP is configured to fall back to auto-discover a proxy in-process. If this fallback behavior is undesirable in the event that an out-of-process discovery fails, it can be disabled using this flag.
     * 
     * This option has no effect when passed to <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurlex">WinHttpGetProxyForUrlEx</a>.
     * 
     * 
     * <div class="alert"><b>Note</b>  This flag is available on Windows Server 2003 only.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTOPROXY_SORT_RESULTS_"></a><a id="winhttp_autoproxy_sort_results_"></a><dl>
     * <dt><b>WINHTTP_AUTOPROXY_SORT_RESULTS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Orders the proxy results based on a heuristic placing the fastest proxies first.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If <b>dwFlags</b> includes the WINHTTP_AUTOPROXY_AUTO_DETECT flag, then <b>dwAutoDetectFlags</b> specifies what protocols are to be used to locate the PAC file. If both the DHCP and DNS auto detect flags are specified, then DHCP is used first; if no PAC URL is discovered using DHCP, then DNS is used.
     * 
     * If <b>dwFlags</b> does not include the WINHTTP_AUTOPROXY_AUTO_DETECT flag, then <b>dwAutoDetectFlags</b> must be zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTO_DETECT_TYPE_DHCP"></a><a id="winhttp_auto_detect_type_dhcp"></a><dl>
     * <dt><b>WINHTTP_AUTO_DETECT_TYPE_DHCP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use DHCP to locate the proxy auto-configuration file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINHTTP_AUTO_DETECT_TYPE_DNS_A"></a><a id="winhttp_auto_detect_type_dns_a"></a><dl>
     * <dt><b>WINHTTP_AUTO_DETECT_TYPE_DNS_A</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use DNS to attempt to locate the proxy auto-configuration file at a well-known location on the domain of the local computer.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwAutoDetectFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If <b>dwFlags</b> includes the WINHTTP_AUTOPROXY_CONFIG_URL flag, the <b>lpszAutoConfigUrl</b> must point to a <b>null</b>-terminated Unicode string that contains the URL of the proxy auto-configuration (PAC) file.
     * 
     * If <b>dwFlags</b> does not include the WINHTTP_AUTOPROXY_CONFIG_URL flag, then <b>lpszAutoConfigUrl</b> must be <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    lpszAutoConfigUrl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reserved for future use; must be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    lpvReserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reserved for future use; must be zero.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies whether the client's domain credentials should be automatically sent in response to an NTLM or Negotiate Authentication challenge when WinHTTP requests the PAC file.
     * 
     * If this flag is TRUE, credentials should automatically be sent in response to an authentication challenge. If this flag is FALSE and authentication is required to download the PAC file, the <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpgetproxyforurl">WinHttpGetProxyForUrl</a> function fails.
     * @type {Integer}
     */
    fAutoLogonIfChallenged {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
