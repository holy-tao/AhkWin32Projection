#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPC_MESSAGE structure contains information shared between NDR and the rest of the RPC or OLE runtime.
 * @see https://docs.microsoft.com/windows/win32/api//rpcdcep/ns-rpcdcep-rpc_message
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_MESSAGE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Reserved.
     * @type {Pointer<Void>}
     */
    Handle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Data representation of the network buffer as defined by the NDR specification.
     * @type {Integer}
     */
    DataRepresentation {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to the beginning of the network buffer.
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Size, in bytes, of <b>Buffer</b>.
     * @type {Integer}
     */
    BufferLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ProcNum {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved.
     * @type {Pointer<RPC_SYNTAX_IDENTIFIER>}
     */
    TransferSyntax {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved.
     * @type {Pointer<Void>}
     */
    RpcInterfaceInformation {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reserved.
     * @type {Pointer<Void>}
     */
    ReservedForRuntime {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Reserved.
     * @type {Pointer<Void>}
     */
    ManagerEpv {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Reserved.
     * @type {Pointer<Void>}
     */
    ImportContext {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    RpcFlags {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
