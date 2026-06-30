#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RPC_VERSION.ahk
#Include .\RPC_HTTP_REDIRECTOR_STAGE.ahk
#Include .\RPC_SYNTAX_IDENTIFIER.ahk
#Include .\RPC_STATUS.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RDR_CALLOUT_STATE extends Win32Struct {
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {RPC_STATUS}
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
     * @type {RPC_HTTP_REDIRECTOR_STAGE}
     */
    LastCalledStage {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ServerName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ServerPort {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Integer>}
     */
    RemoteUser {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Integer>}
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
     * @type {Guid}
     */
    ResourceType {
        get {
            if(!this.HasProp("__ResourceType"))
                this.__ResourceType := Guid(60, this)
            return this.__ResourceType
        }
    }

    /**
     * @type {Guid}
     */
    SessionId {
        get {
            if(!this.HasProp("__SessionId"))
                this.__SessionId := Guid(76, this)
            return this.__SessionId
        }
    }

    /**
     * @type {RPC_SYNTAX_IDENTIFIER}
     */
    Interface {
        get {
            if(!this.HasProp("__Interface"))
                this.__Interface := RPC_SYNTAX_IDENTIFIER(92, this)
            return this.__Interface
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    CertContext {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
