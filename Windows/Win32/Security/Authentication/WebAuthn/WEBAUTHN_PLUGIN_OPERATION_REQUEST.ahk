#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\WEBAUTHN_PLUGIN_REQUEST_TYPE.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class WEBAUTHN_PLUGIN_OPERATION_REQUEST extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hWnd {
        get {
            if(!this.HasProp("__hWnd"))
                this.__hWnd := HWND(0, this)
            return this.__hWnd
        }
    }

    /**
     * @type {Guid}
     */
    transactionId {
        get {
            if(!this.HasProp("__transactionId"))
                this.__transactionId := Guid(8, this)
            return this.__transactionId
        }
    }

    /**
     * @type {Integer}
     */
    cbRequestSignature {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbRequestSignature {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {WEBAUTHN_PLUGIN_REQUEST_TYPE}
     */
    requestType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    cbEncodedRequest {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbEncodedRequest {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
