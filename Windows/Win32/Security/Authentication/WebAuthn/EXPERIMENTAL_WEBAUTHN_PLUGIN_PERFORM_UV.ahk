#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hwnd {
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(0, this)
            return this.__hwnd
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    transactionId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV_OPERATION_TYPE}
     */
    type {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pwszUsername {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    pwszContext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
