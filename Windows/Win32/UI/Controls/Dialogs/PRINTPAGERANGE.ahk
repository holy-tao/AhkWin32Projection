#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a range of pages in a print job. A print job can have more than one page range. This information is supplied in the PRINTDLGEX structure when calling the PrintDlgEx function.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-printpagerange
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class PRINTPAGERANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The first page of the range.
     * @type {Integer}
     */
    nFromPage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The last page of the range.
     * @type {Integer}
     */
    nToPage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
