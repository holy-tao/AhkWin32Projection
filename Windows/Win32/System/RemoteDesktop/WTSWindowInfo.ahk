#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTSWindowInfo extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {HWND}
     */
    Hwnd {
        get {
            if(!this.HasProp("__Hwnd"))
                this.__Hwnd := HWND(0, this)
            return this.__Hwnd
        }
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ViewWidth {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ViewHeight {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    ViewOffsetX {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ViewOffsetY {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Float}
     */
    Scale {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }
}
