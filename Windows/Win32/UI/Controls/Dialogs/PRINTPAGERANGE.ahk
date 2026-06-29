#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a range of pages in a print job. A print job can have more than one page range. This information is supplied in the PRINTDLGEX structure when calling the PrintDlgEx function.
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-printpagerange
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @architecture X64, Arm64
 */
export default struct PRINTPAGERANGE {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The first page of the range.
     */
    nFromPage : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The last page of the range.
     */
    nToPage : UInt32

}
