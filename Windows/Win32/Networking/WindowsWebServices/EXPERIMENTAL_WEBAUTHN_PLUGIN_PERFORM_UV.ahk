#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class EXPERIMENTAL_WEBAUTHN_PLUGIN_PERFORM_UV extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 0)
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
     * @type {Integer}
     */
    type {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pwszUsername{
        get {
            if(!this.HasProp("__pwszUsername"))
                this.__pwszUsername := PWSTR(this.ptr + 24)
            return this.__pwszUsername
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszContext{
        get {
            if(!this.HasProp("__pwszContext"))
                this.__pwszContext := PWSTR(this.ptr + 32)
            return this.__pwszContext
        }
    }
}
