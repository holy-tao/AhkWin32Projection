#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class MCI_OVLY_OPEN_PARMSW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wDeviceID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    lpstrDeviceType{
        get {
            if(!this.HasProp("__lpstrDeviceType"))
                this.__lpstrDeviceType := PWSTR(this.ptr + 16)
            return this.__lpstrDeviceType
        }
    }

    /**
     * @type {PWSTR}
     */
    lpstrElementName{
        get {
            if(!this.HasProp("__lpstrElementName"))
                this.__lpstrElementName := PWSTR(this.ptr + 24)
            return this.__lpstrElementName
        }
    }

    /**
     * @type {PWSTR}
     */
    lpstrAlias{
        get {
            if(!this.HasProp("__lpstrAlias"))
                this.__lpstrAlias := PWSTR(this.ptr + 32)
            return this.__lpstrAlias
        }
    }

    /**
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {HWND}
     */
    hWndParent{
        get {
            if(!this.HasProp("__hWndParent"))
                this.__hWndParent := HWND(this.ptr + 48)
            return this.__hWndParent
        }
    }
}
