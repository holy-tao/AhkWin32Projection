#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\WPARAM.ahk
#Include ..\..\Foundation\LPARAM.ahk

/**
 * Used by SendIMEMessageEx to specify the subfunction to be executed in the Input Method Editor (IME) message and its parameters. This structure is also used to receive return values from those subfunctions.
 * @see https://docs.microsoft.com/windows/win32/api//ime/ns-ime-imestruct
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class IMESTRUCT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    fnc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     * @type {WPARAM}
     */
    wParam{
        get {
            if(!this.HasProp("__wParam"))
                this.__wParam := WPARAM(this.ptr + 8)
            return this.__wParam
        }
    }

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     * @type {Integer}
     */
    wCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     * @type {Integer}
     */
    dchSource {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     * @type {Integer}
     */
    dchDest {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     * @type {LPARAM}
     */
    lParam1{
        get {
            if(!this.HasProp("__lParam1"))
                this.__lParam1 := LPARAM(this.ptr + 32)
            return this.__lParam1
        }
    }

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     * @type {LPARAM}
     */
    lParam2{
        get {
            if(!this.HasProp("__lParam2"))
                this.__lParam2 := LPARAM(this.ptr + 40)
            return this.__lParam2
        }
    }

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     * @type {LPARAM}
     */
    lParam3{
        get {
            if(!this.HasProp("__lParam3"))
                this.__lParam3 := LPARAM(this.ptr + 48)
            return this.__lParam3
        }
    }
}
