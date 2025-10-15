#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROPSHEETHEADERA_V1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {HWND}
     */
    hwndParent{
        get {
            if(!this.HasProp("__hwndParent"))
                this.__hwndParent := HWND(this.ptr + 8)
            return this.__hwndParent
        }
    }

    /**
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(this.ptr + 16)
            return this.__hInstance
        }
    }

    /**
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(this.ptr + 24)
            return this.__hIcon
        }
    }

    /**
     * @type {PSTR}
     */
    pszIcon{
        get {
            if(!this.HasProp("__pszIcon"))
                this.__pszIcon := PSTR(this.ptr + 24)
            return this.__pszIcon
        }
    }

    /**
     * @type {PSTR}
     */
    pszCaption{
        get {
            if(!this.HasProp("__pszCaption"))
                this.__pszCaption := PSTR(this.ptr + 32)
            return this.__pszCaption
        }
    }

    /**
     * @type {Integer}
     */
    nPages {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    nStartPage {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {PSTR}
     */
    pStartPage{
        get {
            if(!this.HasProp("__pStartPage"))
                this.__pStartPage := PSTR(this.ptr + 48)
            return this.__pStartPage
        }
    }

    /**
     * @type {Pointer<PROPSHEETPAGEA>}
     */
    ppsp {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<HPROPSHEETPAGE>}
     */
    phpage {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PFNPROPSHEETCALLBACK>}
     */
    pfnCallback {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
