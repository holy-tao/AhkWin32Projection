#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The OPENFILENAME_NT4 structure is identical to OPENFILENAME with _WIN32_WINNT set to 0x0400. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilename_nt4a
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 * @charset ANSI
 */
class OPENFILENAME_NT4A extends Win32Struct
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
     * @type {Pointer<HWND>}
     */
    hwndOwner {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * 
     * @type {Pointer<HINSTANCE>}
     */
    hInstance {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrFilter {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrCustomFilter {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
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
     * @type {Pointer<PSTR>}
     */
    lpstrFile {
        get => NumGet(this, 44, "ptr")
        set => NumPut("ptr", value, this, 44)
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
     * @type {Pointer<PSTR>}
     */
    lpstrFileTitle {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
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
     * @type {Pointer<PSTR>}
     */
    lpstrInitialDir {
        get => NumGet(this, 68, "ptr")
        set => NumPut("ptr", value, this, 68)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrTitle {
        get => NumGet(this, 76, "ptr")
        set => NumPut("ptr", value, this, 76)
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
     * @type {Pointer<PSTR>}
     */
    lpstrDefExt {
        get => NumGet(this, 92, "ptr")
        set => NumPut("ptr", value, this, 92)
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
     * @type {Pointer<LPOFNHOOKPROC>}
     */
    lpfnHook {
        get => NumGet(this, 108, "ptr")
        set => NumPut("ptr", value, this, 108)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpTemplateName {
        get => NumGet(this, 116, "ptr")
        set => NumPut("ptr", value, this, 116)
    }
}
