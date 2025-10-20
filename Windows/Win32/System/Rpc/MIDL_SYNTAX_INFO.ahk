#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RPC_VERSION.ahk
#Include .\RPC_SYNTAX_IDENTIFIER.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class MIDL_SYNTAX_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {RPC_SYNTAX_IDENTIFIER}
     */
    TransferSyntax{
        get {
            if(!this.HasProp("__TransferSyntax"))
                this.__TransferSyntax := RPC_SYNTAX_IDENTIFIER(0, this)
            return this.__TransferSyntax
        }
    }

    /**
     * @type {Pointer<RPC_DISPATCH_TABLE>}
     */
    DispatchTable {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ProcString {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Integer>}
     */
    FmtStringOffset {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Integer>}
     */
    TypeString {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    aUserMarshalQuadruple {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<MIDL_INTERFACE_METHOD_PROPERTIES>}
     */
    pMethodProperties {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    pReserved2 {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
