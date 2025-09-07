#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\PPP_PROJECTION_INFO2.ahk
#Include .\IKEV2_PROJECTION_INFO2.ahk
#Include .\PROJECTION_INFO2.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains specific information for the connection that includes:\_the user name, domain, Globally Unique Identifier (GUID) associated with the connection, Network Access Protection (NAP) quarantine state, packet statistics, as well as its Point-to-Point (PPP) and Internet Key Exchange version 2 (IKEv2) related information.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_connection_4
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_CONNECTION_4 extends Win32Struct
{
    static sizeof => 1640

    static packingSize => 8

    /**
     * A value that represent the duration of the connection in seconds.
     * @type {Integer}
     */
    dwConnectDuration {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">ROUTER_INTERFACE_TYPE</a> enumeration that identifies the type of connection interface.
     * @type {Integer}
     */
    dwInterfaceType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwConnectionFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A null-terminated Unicode string that contains the name of the interface for this connection.
     * @type {String}
     */
    wszInterfaceName {
        get => StrGet(this.ptr + 12, 256, "UTF-16")
        set => StrPut(value, this.ptr + 12, 256, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the name of the user logged on to the connection.
     * @type {String}
     */
    wszUserName {
        get => StrGet(this.ptr + 526, 256, "UTF-16")
        set => StrPut(value, this.ptr + 526, 256, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the domain on which the connected user is authenticated.
     * @type {String}
     */
    wszLogonDomain {
        get => StrGet(this.ptr + 1040, 15, "UTF-16")
        set => StrPut(value, this.ptr + 1040, 15, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the name of the remote computer.
     * @type {String}
     */
    wszRemoteComputer {
        get => StrGet(this.ptr + 1072, 16, "UTF-16")
        set => StrPut(value, this.ptr + 1072, 16, "UTF-16")
    }

    /**
     * A GUID that identifies the connection. For incoming connections, this GUID is valid only as long as the connection is active.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 1112, "ptr")
        set => NumPut("ptr", value, this, 1112)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-ras_quarantine_state">RAS_QUARANTINE_STATE</a> structure that specifies the NAP quarantine state of the connection.
     * @type {Integer}
     */
    rasQuarState {
        get => NumGet(this, 1120, "int")
        set => NumPut("int", value, this, 1120)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies the time required for the connection to come out of quarantine after which the connection will be dropped. This value is valid only if the <b>rasQuarState</b> member has a value of <b>RAS_QUAR_STATE_PROBATION</b>.
     * @type {FILETIME}
     */
    probationTime{
        get {
            if(!this.HasProp("__probationTime"))
                this.__probationTime := FILETIME(this.ptr + 1128)
            return this.__probationTime
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that specifies the connection start time in UTC.
     * @type {FILETIME}
     */
    connectionStartTime{
        get {
            if(!this.HasProp("__connectionStartTime"))
                this.__connectionStartTime := FILETIME(this.ptr + 1136)
            return this.__connectionStartTime
        }
    }

    /**
     * A value that specifies the number of bytes transmitted on the connection.
     * @type {Integer}
     */
    ullBytesXmited {
        get => NumGet(this, 1144, "uint")
        set => NumPut("uint", value, this, 1144)
    }

    /**
     * A value that specifies the number of bytes received on the connection.
     * @type {Integer}
     */
    ullBytesRcved {
        get => NumGet(this, 1152, "uint")
        set => NumPut("uint", value, this, 1152)
    }

    /**
     * A value that specifies the number of frames transmitted on the connection.
     * @type {Integer}
     */
    dwFramesXmited {
        get => NumGet(this, 1160, "uint")
        set => NumPut("uint", value, this, 1160)
    }

    /**
     * A value that specifies the number of frames received on the connection.
     * @type {Integer}
     */
    dwFramesRcved {
        get => NumGet(this, 1164, "uint")
        set => NumPut("uint", value, this, 1164)
    }

    /**
     * A value that specifies the number of Cyclic Redundancy Check (CRC) errors on the connection.
     * @type {Integer}
     */
    dwCrcErr {
        get => NumGet(this, 1168, "uint")
        set => NumPut("uint", value, this, 1168)
    }

    /**
     * A value that specifies the number of time-out errors on the connection.
     * @type {Integer}
     */
    dwTimeoutErr {
        get => NumGet(this, 1172, "uint")
        set => NumPut("uint", value, this, 1172)
    }

    /**
     * A value that specifies the number of alignment errors on the connection.
     * @type {Integer}
     */
    dwAlignmentErr {
        get => NumGet(this, 1176, "uint")
        set => NumPut("uint", value, this, 1176)
    }

    /**
     * A value that specifies the number of hardware overrun errors on the connection.
     * @type {Integer}
     */
    dwHardwareOverrunErr {
        get => NumGet(this, 1180, "uint")
        set => NumPut("uint", value, this, 1180)
    }

    /**
     * A value that specifies the number of framing errors on the connection.
     * @type {Integer}
     */
    dwFramingErr {
        get => NumGet(this, 1184, "uint")
        set => NumPut("uint", value, this, 1184)
    }

    /**
     * A value that specifies the number of buffer overrun errors on the connection.
     * @type {Integer}
     */
    dwBufferOverrunErr {
        get => NumGet(this, 1188, "uint")
        set => NumPut("uint", value, this, 1188)
    }

    /**
     * A value that specifies the percentage by which data received on this connection is compressed. The <b>dwCompressionRatioIn</b> member is the size of the compressed data divided by the size of the same data in an uncompressed state.
     * @type {Integer}
     */
    dwCompressionRatioIn {
        get => NumGet(this, 1192, "uint")
        set => NumPut("uint", value, this, 1192)
    }

    /**
     * A value that specifies the percentage by which data transmitted on this connection is compressed. The ratio is the size of the compressed data divided by the size of the same data in an uncompressed state.
     * @type {Integer}
     */
    dwCompressionRatioOut {
        get => NumGet(this, 1196, "uint")
        set => NumPut("uint", value, this, 1196)
    }

    /**
     * A value that specifies the number of IKEv2 Mobility and Multihoming Protocol (MOBIKE) switches that have occurred on the connection.  The <b>dwNumSwitchOvers</b> member is only valid if the <b>dwConnectionFlags</b> member is <b>RAS_FLAGS_IKEV2_CONNECTION</b>.
     * @type {Integer}
     */
    dwNumSwitchOvers {
        get => NumGet(this, 1200, "uint")
        set => NumPut("uint", value, this, 1200)
    }

    /**
     * A null-terminated Unicode string that contains the IP address of the remote computer in the connection. This string is of the form "a.b.c.d".
     * @type {String}
     */
    wszRemoteEndpointAddress {
        get => StrGet(this.ptr + 1204, 64, "UTF-16")
        set => StrPut(value, this.ptr + 1204, 64, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the IP address of the local computer in the connection. This string is of the form "a.b.c.d".
     * @type {String}
     */
    wszLocalEndpointAddress {
        get => StrGet(this.ptr + 1334, 64, "UTF-16")
        set => StrPut(value, this.ptr + 1334, 64, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-projection_info2">PROJECTION_INFO2</a> structure that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_projection_info2">PPP_PROJECTION_INFO2</a> structure or a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ikev2_projection_info2">IKEV2_PROJECTION_INFO2</a> structure.
     * @type {PROJECTION_INFO2}
     */
    ProjectionInfo{
        get {
            if(!this.HasProp("__ProjectionInfo"))
                this.__ProjectionInfo := PROJECTION_INFO2(this.ptr + 1464)
            return this.__ProjectionInfo
        }
    }

    /**
     * A handle to the RAS connection.
     * @type {HANDLE}
     */
    hConnection{
        get {
            if(!this.HasProp("__hConnection"))
                this.__hConnection := HANDLE(this.ptr + 1616)
            return this.__hConnection
        }
    }

    /**
     * A handle to the RAS connection interface.
     * @type {HANDLE}
     */
    hInterface{
        get {
            if(!this.HasProp("__hInterface"))
                this.__hInterface := HANDLE(this.ptr + 1624)
            return this.__hInterface
        }
    }

    /**
     * A value that specifies the tunnel type of the VPN connection. The following table shows the possible values for this member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDT_Tunnel_Pptp"></a><a id="rdt_tunnel_pptp"></a><a id="RDT_TUNNEL_PPTP"></a><dl>
     * <dt><b>RDT_Tunnel_Pptp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Point-to-Point tunnel (PPTP)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDT_Tunnel_L2tp"></a><a id="rdt_tunnel_l2tp"></a><a id="RDT_TUNNEL_L2TP"></a><dl>
     * <dt><b>RDT_Tunnel_L2tp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * L2TP tunnel
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDT_Tunnel_Sstp"></a><a id="rdt_tunnel_sstp"></a><a id="RDT_TUNNEL_SSTP"></a><dl>
     * <dt><b>RDT_Tunnel_Sstp</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SSTP tunnel
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RDT_Tunnel_IKev2"></a><a id="rdt_tunnel_ikev2"></a><a id="RDT_TUNNEL_IKEV2"></a><dl>
     * <dt><b>RDT_Tunnel_IKev2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IKEv2 tunnel
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwDeviceType {
        get => NumGet(this, 1632, "uint")
        set => NumPut("uint", value, this, 1632)
    }
}
