#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RpcLocalAddressFormat.ahk" { RpcLocalAddressFormat }

/**
 * Contains information about the local address on which a call was made.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ns-rpcasync-rpc_call_local_address_v1
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_CALL_LOCAL_ADDRESS_V1 {
    #StructPack 8

    /**
     * Version of the <b>RPC_CALL_LOCAL_ADDRESS</b> structure. For this structure, this value must be set to 1.
     */
    Version : UInt32

    /**
     * Pointer to a user-supplied opaque data block that contains the local address.
     */
    Buffer : IntPtr

    /**
     * On input, this member contains the size of the buffer pointed to by the <b>Buffer</b> member, in bytes. On output, it contains the actual number of bytes written to buffer. For example, if the buffer is allocated a size of 8 bytes, but the local address written to it is 4, this parameter will specify 8 on input and contain 4 on output.
     */
    BufferSize : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ne-rpcasync-rpclocaladdressformat">RpcLocalAddressFormat</a> enumeration values that specifies the format of the local address written to <b>Buffer</b>. For this version of the structure, only IPv4 and IPv6 addresses  are supported; if another is specified, RPC_S_CANNOT_SUPPORT is returned.
     */
    AddressFormat : RpcLocalAddressFormat

}
