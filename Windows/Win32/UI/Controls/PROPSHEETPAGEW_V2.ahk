#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include ..\..\Foundation\LPARAM.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROPSHEETPAGEW_V2 extends Win32Struct
{
    static sizeof => 88

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
     * @type {Pointer<LPFNPSPCALLBACKW>}
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
}
