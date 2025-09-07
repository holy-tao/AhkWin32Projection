#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AutoProxyHelperVtbl structure creates a v-table of pointers to Proxy AutoConfig (PAC) helper functions.See the Navigator Proxy Auto-Config (PAC) File Format documentation for a specification of the form and use of Proxy Auto-Config helper functions.
 * @remarks
 * Together with the <a href="https://docs.microsoft.com/windows/desktop/api/wininet/ns-wininet-autoproxyhelperfunctions">AutoProxyHelperFunctions</a> structure, <b>AutoProxyHelperVtbl</b> serves to create a standard v-table that can be declared and populated using C, without requiring the use of C++.
  * 
  * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-autoproxyhelpervtbl
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class AutoProxyHelperVtbl extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Tries to resolve a specified host name. This PAC function is described in the specification under the same name. Returns <b>TRUE</b> if the host name can be resolved, or <b>FALSE</b> otherwise.
     * @type {Pointer}
     */
    IsResolvable {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Places the IP address of the local machine in a specified buffer. This PAC functions is described in the specification under the name <b>myIPAddress</b>. Returns zero if successful, or an error code if not.
     * @type {Pointer}
     */
    GetIPAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Places an IP address that corresponds to a host-name string in a specified buffer. This PAC function is described in the specification under the name, <b>dnsResolve</b>. Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @type {Pointer}
     */
    ResolveHostName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Determines whether a specified IP address masked by a specified mask value matches a specified destination address. This PAC function is described in the specification under the same name. 
     * 
     * The comparison is performed by converting the string representations to binary, logically ANDing the mask and the address specified in <i>lpszIPAddress</i>, and comparing the result with the address specified in <i>lpszDest</i>.
     * @type {Pointer}
     */
    IsInNet {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Tries to resolve a specified host name. This PAC function is described in the specification under the same name. Returns <b>TRUE</b> if the host name can be resolved, or <b>FALSE</b> otherwise.
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     * @type {Pointer}
     */
    IsResolvableEx {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Places the IP address of the local machine in a specified buffer. This PAC functions is described in the specification under the name <b>myIPAddress</b>. Returns zero if successful, or an error code if not.
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     * @type {Pointer}
     */
    GetIPAddressEx {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Places an IP address that corresponds to a host-name string in a specified buffer. This PAC function is described in the specification under the name, <b>dnsResolve</b>. Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     * @type {Pointer}
     */
    ResolveHostNameEx {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Determines whether a specified IP address masked by a specified mask value matches a specified destination address. This PAC function is described in the specification under the same name. 
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     * @type {Pointer}
     */
    IsInNetEx {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Sorts a list of IP addresses. 
     * 
     * 
     * <b>Windows XP and earlier:  </b>Available only in Windows XP with SP2 with Internet Explorer 7. Otherwise, not available.
     * @type {Pointer}
     */
    SortIpList {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
