#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset Unicode
 */
class RASENTRYDLGW extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(this.ptr + 8)
            return this.__hwndOwner
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    xDlg {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    yDlg {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {String}
     */
    szEntry {
        get => StrGet(this.ptr + 28, 256, "UTF-16")
        set => StrPut(value, this.ptr + 28, 256, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * @type {Pointer}
     */
    reserved {
        get => NumGet(this, 552, "ptr")
        set => NumPut("ptr", value, this, 552)
    }

    /**
     * @type {Pointer}
     */
    reserved2 {
        get => NumGet(this, 560, "ptr")
        set => NumPut("ptr", value, this, 560)
    }
}
