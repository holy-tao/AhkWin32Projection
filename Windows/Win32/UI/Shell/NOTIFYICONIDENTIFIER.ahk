#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains information used by Shell_NotifyIconGetRect to identify the icon for which to retrieve the bounding rectangle.
 * @remarks
 * The icon can be identified to <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shell_notifyicongetrect">Shell_NotifyIconGetRect</a> through this structure in two ways:
  *             
  *                 
  * 
  * <ul>
  * <li><i>guidItem</i> alone (recommended)</li>
  * <li><i>hWnd</i> plus <i>uID</i></li>
  * </ul>
  * If <i>guidItem</i> is not <b>GUID_NULL</b>, <i>hWnd</i> and <i>uID</i> are ignored.
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-notifyiconidentifier
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NOTIFYICONIDENTIFIER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the parent window used by the notification's callback function. For more information, see the <i>hWnd</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/ns-shellapi-notifyicondataa">NOTIFYICONDATA</a> structure.
     * @type {HWND}
     */
    hWnd{
        get {
            if(!this.HasProp("__hWnd"))
                this.__hWnd := HWND(this.ptr + 4)
            return this.__hWnd
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The application-defined identifier of the notification icon. Multiple icons can be associated with a single <i>hWnd</i>, each with their own <i>uID</i>.
     * @type {Integer}
     */
    uID {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * A registered GUID that identifies the icon. Use <b>GUID_NULL</b> if the icon is not identified by a GUID.
     * @type {Pointer<Guid>}
     */
    guidItem {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
