#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\Guid.ahk" { Guid }

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
 * @architecture X64, Arm64
 */
export default struct NOTIFYICONIDENTIFIER {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the parent window used by the notification's callback function. For more information, see the <i>hWnd</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/ns-shellapi-notifyicondataa">NOTIFYICONDATA</a> structure.
     */
    hWnd : HWND

    /**
     * Type: <b>UINT</b>
     * 
     * The application-defined identifier of the notification icon. Multiple icons can be associated with a single <i>hWnd</i>, each with their own <i>uID</i>.
     */
    uID : UInt32

    /**
     * Type: <b>GUID</b>
     * 
     * A registered GUID that identifies the icon. Use <b>GUID_NULL</b> if the icon is not identified by a GUID.
     */
    guidItem : Guid

}
