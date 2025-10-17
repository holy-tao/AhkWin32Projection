#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk

/**
 * Used to define a query page added to a form in the query dialog box with the CQAddPagesProc callback function.
 * @see https://docs.microsoft.com/windows/win32/api//cmnquery/ns-cmnquery-cqpage
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class CQPAGE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved. This member must be zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a query page callback function defined by the query form extension. This callback function is used to notify the extension of events in the page and takes  the form of the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nc-cmnquery-lpcqpageproc">CQPageProc</a> callback function.
     * @type {Pointer<LPCQPAGEPROC>}
     */
    pPageProc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains the instance handle of the module that contains the resources identified by the <b>idPageName</b> and <b>idPageTemplate</b> members.
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(16, this)
            return this.__hInstance
        }
    }

    /**
     * Contains the identifier of the string resource in <b>hInstance</b>  used for the page title.
     * @type {Integer}
     */
    idPageName {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Contains the identifier of the dialog resource in <b>hInstance</b>  used for the page dialog.
     * @type {Integer}
     */
    idPageTemplate {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Pointer to the dialog box procedure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nc-winuser-dlgproc">DialogProc</a>.
     * @type {Pointer<DLGPROC>}
     */
    pDlgProc {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * An extension-defined 32-bit value passed in the <b>lParam</b> member of the <b>CQPAGE</b> structure passed as the <i>pPage</i> parameter in  the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nc-cmnquery-lpcqpageproc">CQPageProc</a> callback function.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
