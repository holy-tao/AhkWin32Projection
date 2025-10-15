#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * Contains information about an unsupported Rich Text Format (RTF) keyword in a Microsoft Rich Edit control.
 * @remarks
 * 
  * This structure is used with the <a href="https://msdn.microsoft.com/3b18320b-ebc3-44f2-a93c-e967a028c522">EN_LOWFIRTF</a> message.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-enlowfirtf
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ENLOWFIRTF extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Specifies an <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure.
     * @type {NMHDR}
     */
    nmhdr{
        get {
            if(!this.HasProp("__nmhdr"))
                this.__nmhdr := NMHDR(this.ptr + 0)
            return this.__nmhdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">CHAR</a>*</b>
     * 
     * The unsupported RTF keyword.
     * @type {PSTR}
     */
    szControl{
        get {
            if(!this.HasProp("__szControl"))
                this.__szControl := PSTR(this.ptr + 24)
            return this.__szControl
        }
    }
}
