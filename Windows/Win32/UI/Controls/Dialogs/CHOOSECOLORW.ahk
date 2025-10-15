#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\COLORREF.ahk
#Include ..\..\..\Foundation\LPARAM.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset Unicode
 */
class CHOOSECOLORW extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    lStructSize {
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
     * @type {HWND}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HWND(this.ptr + 16)
            return this.__hInstance
        }
    }

    /**
     * @type {COLORREF}
     */
    rgbResult{
        get {
            if(!this.HasProp("__rgbResult"))
                this.__rgbResult := COLORREF(this.ptr + 24)
            return this.__rgbResult
        }
    }

    /**
     * @type {Pointer<COLORREF>}
     */
    lpCustColors {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {LPARAM}
     */
    lCustData{
        get {
            if(!this.HasProp("__lCustData"))
                this.__lCustData := LPARAM(this.ptr + 48)
            return this.__lCustData
        }
    }

    /**
     * @type {Pointer<LPCCHOOKPROC>}
     */
    lpfnHook {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {PWSTR}
     */
    lpTemplateName{
        get {
            if(!this.HasProp("__lpTemplateName"))
                this.__lpTemplateName := PWSTR(this.ptr + 64)
            return this.__lpTemplateName
        }
    }
}
