#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROPSHEETPAGEA_V3 extends Win32Struct
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
     * @type {PSTR}
     */
    pszTemplate{
        get {
            if(!this.HasProp("__pszTemplate"))
                this.__pszTemplate := PSTR(this.ptr + 16)
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
    pszTitle{
        get {
            if(!this.HasProp("__pszTitle"))
                this.__pszTitle := PSTR(this.ptr + 32)
            return this.__pszTitle
        }
    }

    /**
     * @type {Pointer<DLGPROC>}
     */
    pfnDlgProc {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 48)
            return this.__lParam
        }
    }

    /**
     * @type {Pointer<LPFNPSPCALLBACKA>}
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
     * @type {PSTR}
     */
    pszHeaderTitle{
        get {
            if(!this.HasProp("__pszHeaderTitle"))
                this.__pszHeaderTitle := PSTR(this.ptr + 72)
            return this.__pszHeaderTitle
        }
    }

    /**
     * @type {PSTR}
     */
    pszHeaderSubTitle{
        get {
            if(!this.HasProp("__pszHeaderSubTitle"))
                this.__pszHeaderSubTitle := PSTR(this.ptr + 80)
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
}
