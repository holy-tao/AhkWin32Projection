#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\HINSTANCE.ahk
#Include ..\..\..\Foundation\PSTR.ahk
#Include ..\..\..\Foundation\LPARAM.ahk

/**
 * The OPENFILENAME_NT4 structure is identical to OPENFILENAME with _WIN32_WINNT set to 0x0400.
 * @remarks
 * 
  * > [!NOTE]
  * > The commdlg.h header defines OPENFILENAME_NT4 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commdlg/ns-commdlg-openfilename_nt4a
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset ANSI
 */
class OPENFILENAME_NT4A extends Win32Struct
{
    static sizeof => 136

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
     * @type {PSTR}
     */
    lpstrFilter{
        get {
            if(!this.HasProp("__lpstrFilter"))
                this.__lpstrFilter := PSTR(this.ptr + 24)
            return this.__lpstrFilter
        }
    }

    /**
     * @type {PSTR}
     */
    lpstrCustomFilter{
        get {
            if(!this.HasProp("__lpstrCustomFilter"))
                this.__lpstrCustomFilter := PSTR(this.ptr + 32)
            return this.__lpstrCustomFilter
        }
    }

    /**
     * @type {Integer}
     */
    nMaxCustFilter {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    nFilterIndex {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {PSTR}
     */
    lpstrFile{
        get {
            if(!this.HasProp("__lpstrFile"))
                this.__lpstrFile := PSTR(this.ptr + 48)
            return this.__lpstrFile
        }
    }

    /**
     * @type {Integer}
     */
    nMaxFile {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {PSTR}
     */
    lpstrFileTitle{
        get {
            if(!this.HasProp("__lpstrFileTitle"))
                this.__lpstrFileTitle := PSTR(this.ptr + 64)
            return this.__lpstrFileTitle
        }
    }

    /**
     * @type {Integer}
     */
    nMaxFileTitle {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {PSTR}
     */
    lpstrInitialDir{
        get {
            if(!this.HasProp("__lpstrInitialDir"))
                this.__lpstrInitialDir := PSTR(this.ptr + 80)
            return this.__lpstrInitialDir
        }
    }

    /**
     * @type {PSTR}
     */
    lpstrTitle{
        get {
            if(!this.HasProp("__lpstrTitle"))
                this.__lpstrTitle := PSTR(this.ptr + 88)
            return this.__lpstrTitle
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    nFileOffset {
        get => NumGet(this, 100, "ushort")
        set => NumPut("ushort", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    nFileExtension {
        get => NumGet(this, 102, "ushort")
        set => NumPut("ushort", value, this, 102)
    }

    /**
     * @type {PSTR}
     */
    lpstrDefExt{
        get {
            if(!this.HasProp("__lpstrDefExt"))
                this.__lpstrDefExt := PSTR(this.ptr + 104)
            return this.__lpstrDefExt
        }
    }

    /**
     * @type {LPARAM}
     */
    lCustData{
        get {
            if(!this.HasProp("__lCustData"))
                this.__lCustData := LPARAM(this.ptr + 112)
            return this.__lCustData
        }
    }

    /**
     * @type {Pointer<LPOFNHOOKPROC>}
     */
    lpfnHook {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {PSTR}
     */
    lpTemplateName{
        get {
            if(!this.HasProp("__lpTemplateName"))
                this.__lpTemplateName := PSTR(this.ptr + 128)
            return this.__lpTemplateName
        }
    }
}
