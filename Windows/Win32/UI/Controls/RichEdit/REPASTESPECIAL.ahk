#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information identifying whether the display aspect of a pasted object should be based on the content of the object or the icon that represent the object.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-repastespecial
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class REPASTESPECIAL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwAspect {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Aspect data. If <b>dwAspect</b> is DVASPECT_ICON, this member contains the handle to the metafile with the icon view of the object.
     * @type {Pointer}
     */
    dwParam {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
