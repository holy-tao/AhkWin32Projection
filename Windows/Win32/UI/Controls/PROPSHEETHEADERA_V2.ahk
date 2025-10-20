#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\Graphics\Gdi\HPALETTE.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/prsht/ns-prsht-propsheetheadera_v2
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROPSHEETHEADERA_V2 extends Win32Struct
{
    static sizeof => 96

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
     * @type {PSTR}
     */
    pszIcon {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PSTR}
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
     * @type {PSTR}
     */
    pStartPage {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
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

    /**
     * @type {HBITMAP}
     */
    hbmWatermark{
        get {
            if(!this.HasProp("__hbmWatermark"))
                this.__hbmWatermark := HBITMAP(72, this)
            return this.__hbmWatermark
        }
    }

    /**
     * @type {PSTR}
     */
    pszbmWatermark {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {HPALETTE}
     */
    hplWatermark{
        get {
            if(!this.HasProp("__hplWatermark"))
                this.__hplWatermark := HPALETTE(80, this)
            return this.__hplWatermark
        }
    }

    /**
     * @type {HBITMAP}
     */
    hbmHeader{
        get {
            if(!this.HasProp("__hbmHeader"))
                this.__hbmHeader := HBITMAP(88, this)
            return this.__hbmHeader
        }
    }

    /**
     * @type {PSTR}
     */
    pszbmHeader {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
