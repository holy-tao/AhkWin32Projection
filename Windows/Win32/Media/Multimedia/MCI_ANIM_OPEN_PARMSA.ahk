#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset ANSI
 */
class MCI_ANIM_OPEN_PARMSA extends Win32Struct
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
     * @type {PSTR}
     */
    lpstrDeviceType{
        get {
            if(!this.HasProp("__lpstrDeviceType"))
                this.__lpstrDeviceType := PSTR(this.ptr + 16)
            return this.__lpstrDeviceType
        }
    }

    /**
     * @type {PSTR}
     */
    lpstrElementName{
        get {
            if(!this.HasProp("__lpstrElementName"))
                this.__lpstrElementName := PSTR(this.ptr + 24)
            return this.__lpstrElementName
        }
    }

    /**
     * @type {PSTR}
     */
    lpstrAlias{
        get {
            if(!this.HasProp("__lpstrAlias"))
                this.__lpstrAlias := PSTR(this.ptr + 32)
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
