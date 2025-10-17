#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\WindowsAndMessaging\HICON.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROPSHEETHEADERW_V1 extends Win32Struct
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
                this.__hwndParent := HWND(8, this)
            return this.__hwndParent
        }
    }

    /**
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(16, this)
            return this.__hInstance
        }
    }

    /**
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(24, this)
            return this.__hIcon
        }
    }

    /**
     * @type {PWSTR}
     */
    pszIcon {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    pszCaption {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
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
     * @type {PWSTR}
     */
    pStartPage {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PROPSHEETPAGEW>}
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
