#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains address information for a service. The structure can accommodate many types of interprocess communications (IPC) mechanisms and their address forms, including remote procedure calls (RPC), named pipes, and sockets.
 * @see https://learn.microsoft.com/windows/win32/api/nspapi/ns-nspapi-service_address
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SERVICE_ADDRESS {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The address family to which the socket address pointed to by <b>lpAddress</b> member belongs.
     */
    dwAddressType : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * A set of bit flags that specify properties of the address. The following bit flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ADDRESS_FLAG_RPC_CN"></a><a id="service_address_flag_rpc_cn"></a><dl>
     * <dt><b>SERVICE_ADDRESS_FLAG_RPC_CN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this bit flag is set, the service supports connection-oriented RPC over this transport protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ADDRESS_FLAG_RPC_DG"></a><a id="service_address_flag_rpc_dg"></a><dl>
     * <dt><b>SERVICE_ADDRESS_FLAG_RPC_DG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this bit flag is set, the service supports datagram-oriented RPC over this transport protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_ADDRESS_FLAG_RPC_NB"></a><a id="service_address_flag_rpc_nb"></a><dl>
     * <dt><b>SERVICE_ADDRESS_FLAG_RPC_NB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this bit flag is set, the service supports NetBIOS RPC over this transport protocol.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwAddressFlags : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the address.
     */
    dwAddressLength : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved for future use. Must be zero.
     */
    dwPrincipalLength : UInt32

    /**
     * Type: <b>BYTE*</b>
     * 
     * A pointer to a socket address of the appropriate type.
     */
    lpAddress : IntPtr

    /**
     * Type: <b>BYTE*</b>
     * 
     * Reserved for future use. Must be <b>NULL</b>.
     */
    lpPrincipal : IntPtr

}
