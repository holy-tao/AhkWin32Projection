#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that the system needs to display notifications in the notification area. Used by Shell_NotifyIcon. (ANSI)
 * @remarks
 * See "Notifications" in the Windows User Experience Interaction Guidelines for more information on notification UI and content best practices.
  * 
  * If you set the <b>NIF_INFO</b> flag in the <b>uFlags</b> member, the balloon-style notification is used. For more discussion of these notifications, see <a href="https://docs.microsoft.com/windows/desktop/Controls/using-tooltip-contro">Balloon tooltips</a>.
  * 
  * No more than one balloon notification at a time can be displayed for the taskbar. If an application attempts to display a notification when one is already being displayed, the new notification is queued and displayed when the older notification goes away. In versions of Windows before Windows Vista, the new notification would not appear until the existing notification has been visible for at least the system minimum timeout length, regardless of the original notification's <b>uTimeout</b> value. If the user does not appear to be using the computer, the system does not count this time toward the timeout.
  * 
  * Several members of this structure are only supported for Windows 2000 and later. To enable these members, include one of the following lines in your header:
  * 
  * 
  * ```cpp
  * // Windows Vista and later:
 * @see https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-notifyicondataa
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class NOTIFYICONDATAA extends Win32Struct
{
    static sizeof => 520

    static packingSize => 8

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
     * A handle to the window that receives notifications associated with an icon in the notification area.
     * @type {Pointer<HWND>}
     */
    hWnd {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The application-defined identifier of the taskbar icon. The Shell uses either (<b>hWnd</b> plus <b>uID</b>) or <b>guidItem</b> to identify which icon to operate on when <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shell_notifyicona">Shell_NotifyIcon</a> is invoked. You can have multiple icons associated with a single <b>hWnd</b> by assigning each a different <b>uID</b>. If <b>guidItem</b> is specified, <b>uID</b> is ignored.
     * @type {Integer}
     */
    uID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * An application-defined message identifier. The system uses this identifier to send notification messages to the window identified in <b>hWnd</b>. These notification messages are sent when a mouse event or hover occurs in the bounding rectangle of the icon, when the icon is selected or activated with the keyboard, or when those actions occur in the balloon notification.
     * 
     * 
     * 
     * When the <b>uVersion</b> member is either 0 or NOTIFYICON_VERSION, the <i>wParam</i> parameter of the message contains the identifier of the taskbar icon in which the event occurred. This identifier can be 32 bits in length. The <i>lParam</i> parameter holds the mouse or keyboard message associated with the event. For example, when the pointer moves over a taskbar icon, <i>lParam</i> is set to <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousemove">WM_MOUSEMOVE</a>.
     * 
     * When the <b>uVersion</b> member is NOTIFYICON_VERSION_4, applications continue to receive notification events in the form of application-defined messages through the <b>uCallbackMessage</b> member, but the interpretation of the <i>lParam</i> and <i>wParam</i> parameters of that message is changed as follows:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms632659(v=vs.85)">LOWORD(lParam)</a> contains notification events, such as NIN_BALLOONSHOW, NIN_POPUPOPEN, or WM_CONTEXTMENU.</li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms632657(v=vs.85)">HIWORD(lParam)</a> contains the icon ID. Icon IDs are restricted to a length of 16 bits.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/windowsx/nf-windowsx-get_x_lparam">GET_X_LPARAM(wParam)</a> returns the X anchor coordinate for notification events NIN_POPUPOPEN, NIN_SELECT, NIN_KEYSELECT, and all mouse messages between WM_MOUSEFIRST and WM_MOUSELAST. If any of those messages are generated by the keyboard, <i>wParam</i> is set to the upper-left corner of the target icon. For all other messages, <i>wParam</i> is undefined.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/windowsx/nf-windowsx-get_y_lparam">GET_Y_LPARAM(wParam)</a> returns the Y anchor coordinate for notification events and messages as defined for the X anchor.</li>
     * </ul>
     * @type {Integer}
     */
    uCallbackMessage {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>HICON</b>
     * 
     * A handle to the icon to be added, modified, or deleted. Windows XP and later support icons of up to 32 BPP.
     * 
     * If only a 16x16 pixel icon is provided, it is scaled to a larger size in a system set to a high dpi value. This can lead to an unattractive result. It is recommended that you provide both a 16x16 pixel icon and a 32x32 icon in your resource file. Use <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-loadiconmetric">LoadIconMetric</a> to ensure that the correct icon is loaded and scaled appropriately. See Remarks for a code example.
     * @type {Pointer<HICON>}
     */
    hIcon {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>TCHAR[64]</b>
     * 
     * A null-terminated string that specifies the text for a standard tooltip. It can have a maximum of 64 characters, including the terminating null character.
     * 
     * 
     * 
     * For Windows 2000 and later, <b>szTip</b> can have a maximum of 128 characters, including the terminating null character.
     * @type {String}
     */
    szTip {
        get => StrGet(this.ptr + 40, 127, "UTF-8")
        set => StrPut(value, this.ptr + 40, 127, "UTF-8")
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * <b>Windows 2000 and later</b>. A value that specifies which bits of the <b>dwState</b> member are retrieved or modified. The possible values are the same as those for <b>dwState</b>. For example, setting this member to <b>NIS_HIDDEN</b> causes only the item's hidden state to be modified while the icon sharing bit is ignored regardless of its value.
     * @type {Integer}
     */
    dwStateMask {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * Type: <b>TCHAR[256]</b>
     * 
     * <b>Windows 2000 and later</b>. A null-terminated string that specifies the text to display in a balloon notification. It can have a maximum of 256 characters, including the terminating null character, but should be restricted to 200 characters in English to accommodate localization. To remove the balloon notification from the UI, either delete the icon (with <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shell_notifyicona">NIM_DELETE</a>) or set the <b>NIF_INFO</b> flag in <b>uFlags</b> and set <b>szInfo</b> to an empty string.
     * @type {String}
     */
    szInfo {
        get => StrGet(this.ptr + 176, 255, "UTF-8")
        set => StrPut(value, this.ptr + 176, 255, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    uTimeout {
        get => NumGet(this, 432, "uint")
        set => NumPut("uint", value, this, 432)
    }

    /**
     * @type {Integer}
     */
    uVersion {
        get => NumGet(this, 432, "uint")
        set => NumPut("uint", value, this, 432)
    }

    /**
     * Type: <b>TCHAR[64]</b>
     * 
     * <b>Windows 2000 and later</b>. A null-terminated string that specifies a title for a balloon notification. This title appears in a larger font immediately above the text. It can have a maximum of 64 characters, including the terminating null character, but should be restricted to 48 characters in English to accommodate localization.
     * @type {String}
     */
    szInfoTitle {
        get => StrGet(this.ptr + 436, 63, "UTF-8")
        set => StrPut(value, this.ptr + 436, 63, "UTF-8")
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * <b>Windows 2000 and later</b>. Flags that can be set to modify the behavior and appearance of a balloon notification. The icon is placed to the left of the title. If the <b>szInfoTitle</b> member is zero-length, the icon is not shown.
     * @type {Integer}
     */
    dwInfoFlags {
        get => NumGet(this, 500, "uint")
        set => NumPut("uint", value, this, 500)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * <b>Windows XP and later</b>.
     *                     
     *                         
     * 
     * <ul>
     * <li><b>Windows 7 and later</b>: A registered GUID that identifies the icon. This value overrides <b>uID</b> and is the recommended method of identifying the icon. The NIF_GUID flag must be set in the <b>uFlags</b> member.</li>
     * <li><b>Windows XP and Windows Vista</b>: Reserved; must be set to 0.</li>
     * </ul>
     * If your application is intended to run on both Windows Vista and Windows 7, it is imperative that you check the version of Windows and only specify a nonzero <b>guidItem</b> if on Windows 7 or later.
     * 
     * If you identify the notification icon with a GUID in one call to <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shell_notifyicona">Shell_NotifyIcon</a>, you must use that same GUID to identify the icon in any subsequent <b>Shell_NotifyIcon</b> calls that deal with that same icon.
     * 
     * To generate a GUID for use in this member, use a GUID-generating tool such as Guidgen.exe.
     * @type {Pointer<Guid>}
     */
    guidItem {
        get => NumGet(this, 504, "ptr")
        set => NumPut("ptr", value, this, 504)
    }

    /**
     * Type: <b>HICON</b>
     * 
     * <b>Windows Vista and later</b>. The handle of a customized notification icon provided by the application that should be used independently of the notification area icon. If this member is non-NULL and the NIIF_USER flag is set in the <b>dwInfoFlags</b> member, this icon is used as the notification icon. If this member is <b>NULL</b>, the legacy behavior is carried out.
     * @type {Pointer<HICON>}
     */
    hBalloonIcon {
        get => NumGet(this, 512, "ptr")
        set => NumPut("ptr", value, this, 512)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 520
    }
}
