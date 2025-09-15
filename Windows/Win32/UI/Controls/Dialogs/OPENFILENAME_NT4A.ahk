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
    static sizeof => 136

    static packingSize => 8

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
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Pointer<HINSTANCE>}
     */
    hInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrFilter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrCustomFilter {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    nMaxCustFilter {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    nFilterIndex {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrFile {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    nMaxFile {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrFileTitle {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * 
     * @type {Integer}
     */
    nMaxFileTitle {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrInitialDir {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrTitle {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * 
     * @type {Integer}
     */
    nFileOffset {
        get => NumGet(this, 100, "ushort")
        set => NumPut("ushort", value, this, 100)
    }

    /**
     * 
     * @type {Integer}
     */
    nFileExtension {
        get => NumGet(this, 102, "ushort")
        set => NumPut("ushort", value, this, 102)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpstrDefExt {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * 
     * @type {Pointer}
     */
    lCustData {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * 
     * @type {Pointer<LPOFNHOOKPROC>}
     */
    lpfnHook {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * 
     * @type {Pointer<PSTR>}
     */
    lpTemplateName {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
