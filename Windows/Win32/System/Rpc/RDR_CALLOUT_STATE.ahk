#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RPC_VERSION.ahk
#Include .\RPC_SYNTAX_IDENTIFIER.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RDR_CALLOUT_STATE extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    LastError {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    LastEEInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    LastCalledStage {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    ServerName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    ServerPort {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    RemoteUser {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<UInt16>}
     */
    AuthType {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ResourceTypePresent {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    SessionIdPresent {
        get => NumGet(this, 57, "char")
        set => NumPut("char", value, this, 57)
    }

    /**
     * @type {Integer}
     */
    InterfacePresent {
        get => NumGet(this, 58, "char")
        set => NumPut("char", value, this, 58)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ResourceType {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Guid>}
     */
    SessionId {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {RPC_SYNTAX_IDENTIFIER}
     */
    Interface{
        get {
            if(!this.HasProp("__Interface"))
                this.__Interface := RPC_SYNTAX_IDENTIFIER(80, this)
            return this.__Interface
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    CertContext {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
