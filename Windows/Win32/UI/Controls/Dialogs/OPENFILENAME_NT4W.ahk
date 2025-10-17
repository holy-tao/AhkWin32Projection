#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\HINSTANCE.ahk

/**
 * The OPENFILENAME_NT4 structure is identical to OPENFILENAME with _WIN32_WINNT set to 0x0400.
 * @remarks
 * 
  * > [!NOTE]
  * > The commdlg.h header defines OPENFILENAME_NT4 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//commdlg/ns-commdlg-openfilename_nt4w
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset Unicode
 */
class OPENFILENAME_NT4W extends Win32Struct
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
                this.__hwndOwner := HWND(8, this)
            return this.__hwndOwner
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
     * @type {PWSTR}
     */
    lpstrFilter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    lpstrCustomFilter {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
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
     * @type {PWSTR}
     */
    lpstrFile {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    nMaxFile {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {PWSTR}
     */
    lpstrFileTitle {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    nMaxFileTitle {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {PWSTR}
     */
    lpstrInitialDir {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {PWSTR}
     */
    lpstrTitle {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
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
     * @type {PWSTR}
     */
    lpstrDefExt {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {LPARAM}
     */
    lCustData {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<LPOFNHOOKPROC>}
     */
    lpfnHook {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {PWSTR}
     */
    lpTemplateName {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
