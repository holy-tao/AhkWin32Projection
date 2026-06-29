#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IAddrBook.ahk" { IAddrBook }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Do not use. Structure passed to Import that gives information about importing .wab files.
 * @see https://learn.microsoft.com/windows/win32/api/wabapi/ns-wabapi-wabimportparam
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct WABIMPORTPARAM {
    #StructPack 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies the size of the structure in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface that specifies the address book object to import to.
     */
    lpAdrBook : IAddrBook

    hWnd : HWND

    /**
     * Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies flags affecting behavior.
     */
    ulFlags : UInt32

    /**
     * Type: <b>LPSTR</b>
     * 
     * Value of type <b>LPSTR</b> that specifies the filename to import, or <b>NULL</b> to cause a FileOpen dialog box to open.
     */
    lpszFileName : PSTR

}
