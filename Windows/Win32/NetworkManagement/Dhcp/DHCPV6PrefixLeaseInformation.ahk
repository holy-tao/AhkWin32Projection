#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Information about a prefix lease.
 * @remarks
 * In a prefix delegation scenario, the validation of lease lifetime values (specific status codes, <b>T1</b>, <b>T2</b>, <b>MaxLeaseExpirationTime</b>, and <b>LastRenewalTime</b>) are performed by the calling API, rather than the application consuming the data, as the latter might interpret these values differently.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefixleaseinformation
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6PrefixLeaseInformation extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Number of prefixes.
     * @type {Integer}
     */
    nPrefixes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list <a href="https://docs.microsoft.com/windows/desktop/api/dhcpv6csdk/ns-dhcpv6csdk-dhcpv6prefix">DHCPV6Prefix</a> structures that contain the prefixes requested or returned by the server.
     * @type {Pointer<DHCPV6Prefix>}
     */
    prefixArray {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Identity Association identifier for the prefix operation.
     * @type {Integer}
     */
    iaid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The renewal time for the prefix, in seconds.
     * @type {Integer}
     */
    T1 {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The rebind time of the prefix, in seconds.
     * @type {Integer}
     */
    T2 {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The maximum lease expiration time of all the prefix leases in this structure.
     * @type {Integer}
     */
    MaxLeaseExpirationTime {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * The time at which the last renewal for the prefixes occurred.
     * @type {Integer}
     */
    LastRenewalTime {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * Status code returned by the server for the IAPD. The following codes can be returned by the DHCP server for prefix delegation scenarios:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATUS_NO_ERROR"></a><a id="status_no_error"></a><dl>
     * <dt><b>STATUS_NO_ERROR</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The prefix was successfully leased or renewed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATUS_UNSPECIFIED_FAILURE"></a><a id="status_unspecified_failure"></a><dl>
     * <dt><b>STATUS_UNSPECIFIED_FAILURE</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The lease or renewal action failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATUS_NO_BINDING"></a><a id="status_no_binding"></a><dl>
     * <dt><b>STATUS_NO_BINDING</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv6 server does not have a binding for the prefix.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STATUS_NOPREFIX_AVAIL"></a><a id="status_noprefix_avail"></a><dl>
     * <dt><b>STATUS_NOPREFIX_AVAIL</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv6 server does not have a prefix available to offer the requesting client.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    status {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * The server DUID from which the prefix is received.  This data is used in subsequent renews.
     * @type {Pointer<Byte>}
     */
    ServerId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The length of the above DUID data.
     * @type {Integer}
     */
    ServerIdLen {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
