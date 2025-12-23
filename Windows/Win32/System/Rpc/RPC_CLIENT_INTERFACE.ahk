#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RPC_VERSION.ahk
#Include .\RPC_SYNTAX_IDENTIFIER.ahk

/**
 * The RPC_CLIENT_INTERFACE structure is part of the private interface between the run-time libraries and the stubs. Most distributed applications that use Microsoft RPC do not need this structure.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdcep/ns-rpcdcep-rpc_client_interface
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_CLIENT_INTERFACE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {RPC_SYNTAX_IDENTIFIER}
     */
    InterfaceId{
        get {
            if(!this.HasProp("__InterfaceId"))
                this.__InterfaceId := RPC_SYNTAX_IDENTIFIER(8, this)
            return this.__InterfaceId
        }
    }

    /**
     * @type {RPC_SYNTAX_IDENTIFIER}
     */
    TransferSyntax{
        get {
            if(!this.HasProp("__TransferSyntax"))
                this.__TransferSyntax := RPC_SYNTAX_IDENTIFIER(24, this)
            return this.__TransferSyntax
        }
    }

    /**
     * @type {Pointer<RPC_DISPATCH_TABLE>}
     */
    DispatchTable {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    RpcProtseqEndpointCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<RPC_PROTSEQ_ENDPOINT>}
     */
    RpcProtseqEndpoint {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Void>}
     */
    InterpreterInfo {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
