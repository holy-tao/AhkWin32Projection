#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about hyphenation in a Microsoft Rich Edit control.
 * @remarks
 * This structure is used with the <a href="https://msdn.microsoft.com/70ccb698-e440-493b-8f38-2bf7f32e4b26">EM_GETHYPHENATEINFO</a> and <a href="https://msdn.microsoft.com/67126cb8-ab50-49a9-b32f-2245debf2fe3">EM_SETHYPHENATEINFO</a> messages.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-hyphenateinfo
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class HYPHENATEINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Size of the <b>HYPHENATEINFO</b> structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Size, in TWIPS (one TWIP is 1/1440 inch), of the area near the margin that excludes hyphenation. If a space character is closer to the margin than this value, do not hyphenate the following word.
     * @type {Integer}
     */
    dxHyphenateZone {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * Type: <b>PFNHYPHENATEPROC</b>
     * 
     * The client-defined <a href="https://docs.microsoft.com/windows/win32/api/richedit/nf-richedit-hyphenateproc">HyphenateProc</a> callback function.
     * @type {Pointer}
     */
    pfnHyphenate {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
