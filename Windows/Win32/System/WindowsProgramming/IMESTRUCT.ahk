#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by SendIMEMessageEx to specify the subfunction to be executed in the Input Method Editor (IME) message and its parameters. This structure is also used to receive return values from those subfunctions.
 * @see https://learn.microsoft.com/windows/win32/api/ime/ns-ime-imestruct
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
     * @type {Pointer}
     */
    wParam {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
     * @type {Pointer}
     */
    lParam1 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     * @type {Pointer}
     */
    lParam2 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Usage depends on the subfunction specified in <b>fnc</b>.
     * @type {Pointer}
     */
    lParam3 {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
