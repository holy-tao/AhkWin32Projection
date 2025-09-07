#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class PROPSHEETPAGEW extends Win32Struct
{
    static sizeof => 104

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
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(this.ptr + 8)
            return this.__hInstance
        }
    }

    /**
     * @type {PWSTR}
     */
    pszTemplate{
        get {
            if(!this.HasProp("__pszTemplate"))
                this.__pszTemplate := PWSTR(this.ptr + 16)
            return this.__pszTemplate
        }
    }

    /**
     * @type {Pointer<DLGTEMPLATE>}
     */
    pResource {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
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
     * @type {PWSTR}
     */
    pszIcon{
        get {
            if(!this.HasProp("__pszIcon"))
                this.__pszIcon := PWSTR(this.ptr + 24)
            return this.__pszIcon
        }
    }

    /**
     * @type {PWSTR}
     */
    pszTitle{
        get {
            if(!this.HasProp("__pszTitle"))
                this.__pszTitle := PWSTR(this.ptr + 32)
            return this.__pszTitle
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnDlgProc {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pcRefParent {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {PWSTR}
     */
    pszHeaderTitle{
        get {
            if(!this.HasProp("__pszHeaderTitle"))
                this.__pszHeaderTitle := PWSTR(this.ptr + 72)
            return this.__pszHeaderTitle
        }
    }

    /**
     * @type {PWSTR}
     */
    pszHeaderSubTitle{
        get {
            if(!this.HasProp("__pszHeaderSubTitle"))
                this.__pszHeaderSubTitle := PWSTR(this.ptr + 80)
            return this.__pszHeaderSubTitle
        }
    }

    /**
     * @type {HANDLE}
     */
    hActCtx{
        get {
            if(!this.HasProp("__hActCtx"))
                this.__hActCtx := HANDLE(this.ptr + 88)
            return this.__hActCtx
        }
    }

    /**
     * @type {HBITMAP}
     */
    hbmHeader{
        get {
            if(!this.HasProp("__hbmHeader"))
                this.__hbmHeader := HBITMAP(this.ptr + 96)
            return this.__hbmHeader
        }
    }

    /**
     * @type {PWSTR}
     */
    pszbmHeader{
        get {
            if(!this.HasProp("__pszbmHeader"))
                this.__pszbmHeader := PWSTR(this.ptr + 96)
            return this.__pszbmHeader
        }
    }
}
