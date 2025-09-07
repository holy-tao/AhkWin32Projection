#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\HINSTANCE.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * The OPENFILENAME_NT4 structure is identical to OPENFILENAME with _WIN32_WINNT set to 0x0400. (Unicode)
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilename_nt4w
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset Unicode
 */
class OPENFILENAME_NT4W extends Win32Struct
{
    static sizeof => 124

    static packingSize => 1

    /**
     * 
     * @type {Integer}
     */
    lStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {HWND}
     */
    hwndOwner{
        get {
            if(!this.HasProp("__hwndOwner"))
                this.__hwndOwner := HWND(this.ptr + 4)
            return this.__hwndOwner
        }
    }

    /**
     * 
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(this.ptr + 12)
            return this.__hInstance
        }
    }

    /**
     * 
     * @type {PWSTR}
     */
    lpstrFilter{
        get {
            if(!this.HasProp("__lpstrFilter"))
                this.__lpstrFilter := PWSTR(this.ptr + 20)
            return this.__lpstrFilter
        }
    }

    /**
     * 
     * @type {PWSTR}
     */
    lpstrCustomFilter{
        get {
            if(!this.HasProp("__lpstrCustomFilter"))
                this.__lpstrCustomFilter := PWSTR(this.ptr + 28)
            return this.__lpstrCustomFilter
        }
    }

    /**
     * 
     * @type {Integer}
     */
    nMaxCustFilter {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * 
     * @type {Integer}
     */
    nFilterIndex {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * 
     * @type {PWSTR}
     */
    lpstrFile{
        get {
            if(!this.HasProp("__lpstrFile"))
                this.__lpstrFile := PWSTR(this.ptr + 44)
            return this.__lpstrFile
        }
    }

    /**
     * 
     * @type {Integer}
     */
    nMaxFile {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * 
     * @type {PWSTR}
     */
    lpstrFileTitle{
        get {
            if(!this.HasProp("__lpstrFileTitle"))
                this.__lpstrFileTitle := PWSTR(this.ptr + 56)
            return this.__lpstrFileTitle
        }
    }

    /**
     * 
     * @type {Integer}
     */
    nMaxFileTitle {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * 
     * @type {PWSTR}
     */
    lpstrInitialDir{
        get {
            if(!this.HasProp("__lpstrInitialDir"))
                this.__lpstrInitialDir := PWSTR(this.ptr + 68)
            return this.__lpstrInitialDir
        }
    }

    /**
     * 
     * @type {PWSTR}
     */
    lpstrTitle{
        get {
            if(!this.HasProp("__lpstrTitle"))
                this.__lpstrTitle := PWSTR(this.ptr + 76)
            return this.__lpstrTitle
        }
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * 
     * @type {Integer}
     */
    nFileOffset {
        get => NumGet(this, 88, "ushort")
        set => NumPut("ushort", value, this, 88)
    }

    /**
     * 
     * @type {Integer}
     */
    nFileExtension {
        get => NumGet(this, 90, "ushort")
        set => NumPut("ushort", value, this, 90)
    }

    /**
     * 
     * @type {PWSTR}
     */
    lpstrDefExt{
        get {
            if(!this.HasProp("__lpstrDefExt"))
                this.__lpstrDefExt := PWSTR(this.ptr + 92)
            return this.__lpstrDefExt
        }
    }

    /**
     * 
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 100, "ptr")
        set => NumPut("ptr", value, this, 100)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    lpfnHook {
        get => NumGet(this, 108, "ptr")
        set => NumPut("ptr", value, this, 108)
    }

    /**
     * 
     * @type {PWSTR}
     */
    lpTemplateName{
        get {
            if(!this.HasProp("__lpTemplateName"))
                this.__lpTemplateName := PWSTR(this.ptr + 116)
            return this.__lpTemplateName
        }
    }
}
