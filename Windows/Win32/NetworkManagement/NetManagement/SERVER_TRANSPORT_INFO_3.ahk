#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The SERVER_TRANSPORT_INFO_3 structure contains information about the specified transport protocol, including name, address and password (credentials). This information level is valid only for the NetServerTransportAddEx function.
 * @remarks
 * 
  * The 
  * 				<b>SERVER_TRANSPORT_INFO_3</b> structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportaddex">NetServerTransportAddEx</a> function to bind the specified server to the transport protocol.
  * 
  * An example of the use of the SVTI2_REMAP_PIPE_NAMES value follows. Call the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportaddex">NetServerTransportAddEx</a> function to add a transport to the server, specifying the address of "MyServer" in the <b>svti3_transportaddress</b> member, and <b>SVTI2_REMAP_PIPE_NAMES</b> in the <b>svti3_flags</b> member. When a client attempts to open "Pipe" on "\\MyServer" the client will actually open $$MyServer\Pipe instead.
  * 
  * The <b>svti3_passwordlength</b> and <b>svti3_password</b> members are necessary for a client and server to perform mutual authentication.
  * 
  * On Windows Server 2008  and Windows Vista with SP1, every name registered with the Windows remote file server (SRV) is designated as either a scoped name or a non-scoped name.  Every share that is added to the system will then either be attached to all of the non-scoped names, or to a single scoped name.  Applications that wish to use the scoping features are responsible for both registering the new name as a scoped endpoint and then creating the shares with an appropriate scope. In this way, legacy uses of the Network Management and Network Share Management functions are not affected in any way since they continue to register shares and names as non-scoped names.  
  * 
  * A scoped endpoint is created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportaddex">NetServerTransportAddEx</a> function with the <i>level</i> parameter set to 2 and the <i>bufptr</i> parameter pointed to a <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a> structure with the <b>SVTI2_SCOPED_NAME</b> bit value set in <b>svti2_flags</b> member. A scoped endpoint is also created by calling the <b>NetServerTransportAddEx</b> function with the <i>level</i> parameter set to 3 and the <i>bufptr</i> parameter pointed to a <b>SERVER_TRANSPORT_INFO_3</b> structure with the <b>SVTI2_SCOPED_NAME</b> bit value set in <b>svti3_flags</b> member. 
  * 
  * When the <b>SVTI2_SCOPED_NAME</b> bit value is set for a transport, then shares can be added with a corresponding server name (the <b>shi503_servername</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/ns-lmshare-share_info_503">SHARE_INFO_503</a> structure) in a scoped fashion using the <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netshareadd">NetShareAdd</a> function.  If there is no transport registered with the <b>SVTI2_SCOPED_NAME</b> bit value and the name provided in <b>shi503_servername</b> member, then the share add in a scoped fashion will not succeed.
  * 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netshareadd">NetShareAdd</a> function is used to add a scoped share on a remote server specified in the <i>servername</i> parameter. The remote server specified in the <b>shi503_servername</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/ns-lmshare-share_info_503">SHARE_INFO_503</a> passed in the <i>bufptr</i> parameter must have been bound to a transport protocol using the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportaddex">NetServerTransportAddEx</a> function as a scoped endpoint. The <b>SVTI2_SCOPED_NAME</b> flag must have been specified in the <b>shi503_servername</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/ns-lmserver-server_transport_info_2">SERVER_TRANSPORT_INFO_2</a> or <b>SERVER_TRANSPORT_INFO_3</b> structure for the transport protocol.  The <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharedelex">NetShareDelEx</a> function is used to delete a scoped share.  The <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharegetinfo">NetShareGetInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/lmshare/nf-lmshare-netsharesetinfo">NetShareSetInfo</a> functions are to used to get and set information on a scoped share.  
  * 
  * Scoped endpoints are generally used by the cluster namespace.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmserver/ns-lmserver-server_transport_info_3
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_TRANSPORT_INFO_3 extends Win32Struct
{
    static sizeof => 312

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of clients connected to the server that are using the transport protocol specified by the <b>svti3_transportname</b> member.
     * @type {Integer}
     */
    svti3_numberofvcs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a NULL-terminated character string that contains the name of a transport device; for example,
     * 
     * <pre class="syntax" xml:space="preserve"><code>\Device\NetBT_Tcpip_{2C9725F4-151A-11D3-AEEC-C3B211BD350B}
     * </code></pre>
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    svti3_transportname{
        get {
            if(!this.HasProp("__svti3_transportname"))
                this.__svti3_transportname := PWSTR(this.ptr + 8)
            return this.__svti3_transportname
        }
    }

    /**
     * Type: <b>LPBYTE</b>
     * 
     * A pointer to a variable that contains the address the server is using on the transport device specified by the <b>svti3_transportname</b> member.
     * 
     * This member is usually the NetBIOS name that the server is using. In these instances, the name must be 16 characters long, and the last character must be a blank character (0x20).
     * @type {Pointer<Byte>}
     */
    svti3_transportaddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    svti3_transportaddresslength {
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
     * @type {PWSTR}
     */
    svti3_networkaddress{
        get {
            if(!this.HasProp("__svti3_networkaddress"))
                this.__svti3_networkaddress := PWSTR(this.ptr + 32)
            return this.__svti3_networkaddress
        }
    }

    /**
     * Type: <b>LMSTR</b>
     * 
     * A pointer to a NULL-terminated character string that contains the name of the domain to which the server should announce its presence. (When you call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmserver/nf-lmserver-netservertransportenum">NetServerTransportEnum</a>, this member is the name of the domain to which the server is announcing its presence.)
     * 
     * This string is Unicode if  <b>_WIN32_WINNT</b> or <b>FORCE_UNICODE</b> are defined.
     * @type {PWSTR}
     */
    svti3_domain{
        get {
            if(!this.HasProp("__svti3_domain"))
                this.__svti3_domain := PWSTR(this.ptr + 40)
            return this.__svti3_domain
        }
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * This member can be a combination of the following bit values defined in the <i>Lmserver.h</i> header file. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SVTI2_REMAP_PIPE_NAMES"></a><a id="svti2_remap_pipe_names"></a><dl>
     * <dt><b>SVTI2_REMAP_PIPE_NAMES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this value is set for an endpoint, client requests arriving over the transport to open a named pipe are rerouted (remapped) to the following local pipe name:
     * 
     * <b>$$\ServerName\PipeName</b>
     * 
     * For more information on the use of this value, see the Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SVTI2_SCOPED_NAME"></a><a id="svti2_scoped_name"></a><dl>
     * <dt><b>SVTI2_SCOPED_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this value is set for an endpoint and there is an attempt to create a second transport with the same network address but a different transport name and conflicting settings for the SCOPED flag, this transport creation will fail.  Thus, every registered transport for a given network address must have the same scoped setting.
     * 
     * For more information on the use of this value, see the Remarks section.
     * 
     * This value is defined on Windows Server 2008  and Windows Vista with SP1.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    svti3_flags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of valid bytes in the <b>svti3_password</b> member.
     * @type {Integer}
     */
    svti3_passwordlength {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>BYTE[256]</b>
     * 
     * The credentials to use for the new transport address. If the <b>svti3_passwordlength</b> member is zero, the credentials for the server are used.
     * @type {Array<Byte>}
     */
    svti3_password{
        get {
            if(!this.HasProp("__svti3_passwordProxyArray"))
                this.__svti3_passwordProxyArray := Win32FixedArray(this.ptr + 56, 256, Primitive, "char")
            return this.__svti3_passwordProxyArray
        }
    }
}
