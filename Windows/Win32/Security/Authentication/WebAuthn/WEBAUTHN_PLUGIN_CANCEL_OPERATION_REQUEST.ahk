#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class WEBAUTHN_PLUGIN_CANCEL_OPERATION_REQUEST extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Guid}
     */
    transactionId {
        get {
            if(!this.HasProp("__transactionId"))
                this.__transactionId := Guid(0, this)
            return this.__transactionId
        }
    }

    /**
     * @type {Integer}
     */
    cbRequestSignature {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbRequestSignature {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
