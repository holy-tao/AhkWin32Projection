#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MPRAPI_OBJECT_HEADER.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\PPP_PROJECTION_INFO.ahk
#Include .\IKEV2_PROJECTION_INFO.ahk
#Include .\PROJECTION_INFO.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains specific information for the connection that includes:\_the user name, domain, and Globally Unique Identifier (GUID) associated with the connection, its Network Access Protection (NAP) quarantine state, its packet statistics, as well as its Point-to-Point(PPP) and Internet Key Exchange version 2 (IKEv2) related information.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_connection_ex
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_CONNECTION_EX extends Win32Struct
{
    static sizeof => 1616

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>RAS_CONNECTION_EX</b> structure. 
     * 
     * <div class="alert"><b>Note</b>  The <b>revision</b> member  of  <b>Header</b> must be <b>MPRAPI_RAS_CONNECTION_OBJECT_REVISION_1</b> and <b>type</b> must be <b>MPRAPI_OBJECT_TYPE_RAS_CONNECTION_OBJECT</b>.</div>
     * <div> </div>
     * @type {MPRAPI_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := MPRAPI_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * A value that represent the duration of the connection, in seconds.
     * @type {Integer}
     */
    dwConnectDuration {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">ROUTER_INTERFACE_TYPE</a> enumeration that identifies the type of connection interface.
     * @type {Integer}
     */
    dwInterfaceType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwConnectionFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A null-terminated Unicode string that contains the name of the interface for this connection.
     * @type {String}
     */
    wszInterfaceName {
        get => StrGet(this.ptr + 16, 256, "UTF-16")
        set => StrPut(value, this.ptr + 16, 256, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the name of the user logged on to the connection.
     * @type {String}
     */
    wszUserName {
        get => StrGet(this.ptr + 530, 256, "UTF-16")
        set => StrPut(value, this.ptr + 530, 256, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the domain on which the connected user is authenticated.
     * @type {String}
     */
    wszLogonDomain {
        get => StrGet(this.ptr + 1044, 15, "UTF-16")
        set => StrPut(value, this.ptr + 1044, 15, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the name of the remote computer.
     * @type {String}
     */
    wszRemoteComputer {
        get => StrGet(this.ptr + 1076, 16, "UTF-16")
        set => StrPut(value, this.ptr + 1076, 16, "UTF-16")
    }

    /**
     * A GUID  that identifies the connection. For incoming connections, this GUID is valid only as long as the connection is active.
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
     * A FILETIME structure that specifies the time required for the connection to come out of quarantine after which the connection will be dropped. This value is valid only if <b>rasQuarState</b> has a value of <b>RAS_QUAR_STATE_PROBATION</b>.
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
     * A value that specifies the number of bytes transmitted on the connection.
     * @type {Integer}
     */
    dwBytesXmited {
        get => NumGet(this, 1136, "uint")
        set => NumPut("uint", value, this, 1136)
    }

    /**
     * A value that specifies the number of bytes received on the connection.
     * @type {Integer}
     */
    dwBytesRcved {
        get => NumGet(this, 1140, "uint")
        set => NumPut("uint", value, this, 1140)
    }

    /**
     * A value that specifies the number of frames transmitted on the connection.
     * @type {Integer}
     */
    dwFramesXmited {
        get => NumGet(this, 1144, "uint")
        set => NumPut("uint", value, this, 1144)
    }

    /**
     * A value that specifies the number of frames received on the connection.
     * @type {Integer}
     */
    dwFramesRcved {
        get => NumGet(this, 1148, "uint")
        set => NumPut("uint", value, this, 1148)
    }

    /**
     * A value that specifies the number of Cyclic Redundancy Check (CRC) errors on the connection.
     * @type {Integer}
     */
    dwCrcErr {
        get => NumGet(this, 1152, "uint")
        set => NumPut("uint", value, this, 1152)
    }

    /**
     * A value that specifies the number of time-out errors on the connection.
     * @type {Integer}
     */
    dwTimeoutErr {
        get => NumGet(this, 1156, "uint")
        set => NumPut("uint", value, this, 1156)
    }

    /**
     * A value that specifies the number of alignment errors on the connection.
     * @type {Integer}
     */
    dwAlignmentErr {
        get => NumGet(this, 1160, "uint")
        set => NumPut("uint", value, this, 1160)
    }

    /**
     * A value that specifies the number of hardware overrun errors on the connection.
     * @type {Integer}
     */
    dwHardwareOverrunErr {
        get => NumGet(this, 1164, "uint")
        set => NumPut("uint", value, this, 1164)
    }

    /**
     * A value that specifies the number of framing errors on the connection.
     * @type {Integer}
     */
    dwFramingErr {
        get => NumGet(this, 1168, "uint")
        set => NumPut("uint", value, this, 1168)
    }

    /**
     * A value that specifies the number of buffer overrun errors on the connection.
     * @type {Integer}
     */
    dwBufferOverrunErr {
        get => NumGet(this, 1172, "uint")
        set => NumPut("uint", value, this, 1172)
    }

    /**
     * A value that specifies the percentage by which data received on this connection is compressed. <b>dwCompressionRatioIn</b> is the size of the compressed data divided by the size of the same data in an uncompressed state.
     * @type {Integer}
     */
    dwCompressionRatioIn {
        get => NumGet(this, 1176, "uint")
        set => NumPut("uint", value, this, 1176)
    }

    /**
     * A value that specifies the percentage by which data transmitted on this connection is compressed. The ratio is the size of the compressed data divided by the size of the same data in an uncompressed state.
     * @type {Integer}
     */
    dwCompressionRatioOut {
        get => NumGet(this, 1180, "uint")
        set => NumPut("uint", value, this, 1180)
    }

    /**
     * A value that specifies the number of IKEv2 Mobility and Multihoming Protocol (MOBIKE) switches that have occurred on the connection as defined in <a href="https://www.ietf.org/rfc/rfc4555.txt">RFC4555</a>. <b>dwNumSwitchOvers</b> is only valid if <b>dwConnectionFlags</b> is <b>RAS_FLAGS_IKEV2_CONNECTION</b>.
     * @type {Integer}
     */
    dwNumSwitchOvers {
        get => NumGet(this, 1184, "uint")
        set => NumPut("uint", value, this, 1184)
    }

    /**
     * A null-terminated Unicode string that contains the IP address of the remote computer in the connection. This string is of the form "a.b.c.d".
     * @type {String}
     */
    wszRemoteEndpointAddress {
        get => StrGet(this.ptr + 1188, 64, "UTF-16")
        set => StrPut(value, this.ptr + 1188, 64, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the IP address of the local computer in the connection. This string is of the form "a.b.c.d".
     * @type {String}
     */
    wszLocalEndpointAddress {
        get => StrGet(this.ptr + 1318, 64, "UTF-16")
        set => StrPut(value, this.ptr + 1318, 64, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-projection_info">PROJECTION_INFO</a> structure that contains either a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_projection_info">PPP_PROJECTION_INFO</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ikev2_projection_info">IKEV2_PROJECTION_INFO</a> structure.
     * @type {PROJECTION_INFO}
     */
    ProjectionInfo{
        get {
            if(!this.HasProp("__ProjectionInfo"))
                this.__ProjectionInfo := PROJECTION_INFO(this.ptr + 1448)
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
                this.__hConnection := HANDLE(this.ptr + 1600)
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
                this.__hInterface := HANDLE(this.ptr + 1608)
            return this.__hInterface
        }
    }
}
