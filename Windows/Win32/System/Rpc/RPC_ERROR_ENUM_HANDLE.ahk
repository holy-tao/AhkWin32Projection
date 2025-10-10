#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPC_ERROR_ENUM_HANDLE structure provides an enumeration handle used by RpcError* functions for processing extended error information.
 * @see https://docs.microsoft.com/windows/win32/api//rpcasync/ns-rpcasync-rpc_error_enum_handle
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_ERROR_ENUM_HANDLE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    CurrentPos {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    Head {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
