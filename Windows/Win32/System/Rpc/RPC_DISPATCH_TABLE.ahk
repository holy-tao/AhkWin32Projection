#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPC_DISPATCH_TABLE structure is part of the private interface between the run-time libraries and the stubs. Most distributed applications that use Microsoft RPC do not need this structure.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdcep/ns-rpcdcep-rpc_dispatch_table
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_DISPATCH_TABLE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DispatchTableCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<RPC_DISPATCH_FUNCTION>}
     */
    DispatchTable {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
