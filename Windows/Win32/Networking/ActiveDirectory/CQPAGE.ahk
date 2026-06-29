#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * Used to define a query page added to a form in the query dialog box with the CQAddPagesProc callback function.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/ns-cmnquery-cqpage
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct CQPAGE {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the structure.
     */
    cbStruct : UInt32

    /**
     * Reserved. This member must be zero.
     */
    dwFlags : UInt32

    /**
     * Pointer to a query page callback function defined by the query form extension. This callback function is used to notify the extension of events in the page and takes  the form of the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nc-cmnquery-lpcqpageproc">CQPageProc</a> callback function.
     */
    pPageProc : IntPtr

    /**
     * Contains the instance handle of the module that contains the resources identified by the <b>idPageName</b> and <b>idPageTemplate</b> members.
     */
    hInstance : HINSTANCE

    /**
     * Contains the identifier of the string resource in <b>hInstance</b>  used for the page title.
     */
    idPageName : Int32

    /**
     * Contains the identifier of the dialog resource in <b>hInstance</b>  used for the page dialog.
     */
    idPageTemplate : Int32

    /**
     * Pointer to the dialog box procedure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-dlgproc">DialogProc</a>.
     */
    pDlgProc : IntPtr

    /**
     * An extension-defined 32-bit value passed in the <b>lParam</b> member of the <b>CQPAGE</b> structure passed as the <i>pPage</i> parameter in  the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nc-cmnquery-lpcqpageproc">CQPageProc</a> callback function.
     */
    lParam : LPARAM

}
