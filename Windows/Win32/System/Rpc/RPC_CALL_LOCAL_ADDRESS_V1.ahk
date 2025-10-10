#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the local address on which a call was made.
 * @see https://docs.microsoft.com/windows/win32/api//rpcasync/ns-rpcasync-rpc_call_local_address_v1
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_CALL_LOCAL_ADDRESS_V1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Version of the <b>RPC_CALL_LOCAL_ADDRESS</b> structure. For this structure, this value must be set to 1.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a user-supplied opaque data block that contains the local address.
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * On input, this member contains the size of the buffer pointed to by the <b>Buffer</b> member, in bytes. On output, it contains the actual number of bytes written to buffer. For example, if the buffer is allocated a size of 8 bytes, but the local address written to it is 4, this parameter will specify 8 on input and contain 4 on output.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ne-rpcasync-rpclocaladdressformat">RpcLocalAddressFormat</a> enumeration values that specifies the format of the local address written to <b>Buffer</b>. For this version of the structure, only IPv4 and IPv6 addresses  are supported; if another is specified, RPC_S_CANNOT_SUPPORT is returned.
     * @type {Integer}
     */
    AddressFormat {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
