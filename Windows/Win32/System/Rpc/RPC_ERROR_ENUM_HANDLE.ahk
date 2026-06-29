#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RPC_ERROR_ENUM_HANDLE structure provides an enumeration handle used by RpcError* functions for processing extended error information.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ns-rpcasync-rpc_error_enum_handle
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_ERROR_ENUM_HANDLE {
    #StructPack 8

    Signature : UInt32

    CurrentPos : IntPtr

    Head : IntPtr

}
