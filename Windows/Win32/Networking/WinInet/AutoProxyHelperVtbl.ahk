#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AutoProxyHelperVtbl structure creates a v-table of pointers to Proxy AutoConfig (PAC) helper functions.See the Navigator Proxy Auto-Config (PAC) File Format documentation for a specification of the form and use of Proxy Auto-Config helper functions.
 * @remarks
 * Together with the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-autoproxyhelperfunctions">AutoProxyHelperFunctions</a> structure, <b>AutoProxyHelperVtbl</b> serves to create a standard v-table that can be declared and populated using C, without requiring the use of C++.
 * 
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-autoproxyhelpervtbl
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct AutoProxyHelperVtbl {
    #StructPack 8

    /**
     * Tries to resolve a specified host name. This PAC function is described in the specification under the same name. Returns <b>TRUE</b> if the host name can be resolved, or <b>FALSE</b> otherwise.
     */
    IsResolvable : IntPtr

    /**
     * Places the IP address of the local machine in a specified buffer. This PAC functions is described in the specification under the name <b>myIPAddress</b>. Returns zero if successful, or an error code if not.
     */
    GetIPAddress : IntPtr

    /**
     * Places an IP address that corresponds to a host-name string in a specified buffer. This PAC function is described in the specification under the name, <b>dnsResolve</b>. Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     */
    ResolveHostName : IntPtr

    /**
     * Determines whether a specified IP address masked by a specified mask value matches a specified destination address. This PAC function is described in the specification under the same name. 
     * 
     * The comparison is performed by converting the string representations to binary, logically ANDing the mask and the address specified in <i>lpszIPAddress</i>, and comparing the result with the address specified in <i>lpszDest</i>.
     */
    IsInNet : IntPtr

    /**
     * Tries to resolve a specified host name. This PAC function is described in the specification under the same name. Returns <b>TRUE</b> if the host name can be resolved, or <b>FALSE</b> otherwise.
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     */
    IsResolvableEx : IntPtr

    /**
     * Places the IP address of the local machine in a specified buffer. This PAC functions is described in the specification under the name <b>myIPAddress</b>. Returns zero if successful, or an error code if not.
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     */
    GetIPAddressEx : IntPtr

    /**
     * Places an IP address that corresponds to a host-name string in a specified buffer. This PAC function is described in the specification under the name, <b>dnsResolve</b>. Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     */
    ResolveHostNameEx : IntPtr

    /**
     * Determines whether a specified IP address masked by a specified mask value matches a specified destination address. This PAC function is described in the specification under the same name. 
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     */
    IsInNetEx : IntPtr

    /**
     * Sorts a list of IP addresses. 
     * 
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     */
    SortIpList : IntPtr

}
