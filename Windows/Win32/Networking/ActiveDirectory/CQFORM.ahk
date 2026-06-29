#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used to define a query form added to the query dialog box with the CQAddFormsProc callback function.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/ns-cmnquery-cqform
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct CQFORM {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the structure.
     */
    cbStruct : UInt32

    dwFlags : UInt32

    /**
     * Contains  the class identifier used to identify the query form.
     */
    clsid : Guid

    /**
     * Contains the  handle of the icon to be displayed with the query form.
     */
    hIcon : HICON

    /**
     * Pointer to a null-terminated Unicode string that contains the title of the query form.
     */
    pszTitle : PWSTR

}
