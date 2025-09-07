#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SERVER_TRANSPORT_INFO_1 structure contains information about the specified transport protocol, including name and address. This information level is valid only for the NetServerTransportAddEx function.
 * @remarks
 * The 
  * 				<b>SERVER_TRANSPORT_INFO_1</b> structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportaddex">NetServerTransportAddEx</a> function to bind the specified server to the transport protocol.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_transport_info_1
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_TRANSPORT_INFO_1 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of clients connected to the server that are using the transport protocol specified by the <b>svti1_transportname</b> member.
     * @type {Integer}
     */
    svti1_numberofvcs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a null-terminated character string that contains the name of a transport device; for example,
     * 
     * 
     * ``` syntax
     * \Device\NetBT_Tcpip_{2C9725F4-151A-11D3-AEEC-C3B211BD350B}
     * 
     * ```
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {Pointer<Ptr>}
     */
    svti1_transportname {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPBYTE</b>
     * 
     * A pointer to a variable that contains the address the server is using on the transport device specified by the <b>svti1_transportname</b> member.
     * 
     * This member is usually the NetBIOS name that the server is using. In these instances, the name must be 16 characters long, and the last character must be a blank character (0x20).
     * @type {Pointer<Byte>}
     */
    svti1_transportaddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    svti1_transportaddresslength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a NULL-terminated character string that contains the address the network adapter is using. The string is transport-specific.
     * 
     * You can retrieve this value only with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportenum">NetServerTransportEnum</a> function. You cannot set this value with a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportadd">NetServerTransportAdd</a> function or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportaddex">NetServerTransportAddEx</a> function.)
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {Pointer<Ptr>}
     */
    svti1_networkaddress {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a NULL-terminated character string that contains the name of the domain to which the server should announce its presence. (When you call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportenum">NetServerTransportEnum</a>, this member is the name of the domain to which the server is announcing its presence.)
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {Pointer<Ptr>}
     */
    svti1_domain {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
