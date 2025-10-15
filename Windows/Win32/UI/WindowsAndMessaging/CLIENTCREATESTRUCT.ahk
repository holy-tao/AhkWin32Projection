#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains information about the menu and first multiple-document interface (MDI) child window of an MDI client window.
 * @remarks
 * 
  * When the MDI client window is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-createwindowa">CreateWindow</a>, the system sends a <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-create">WM_CREATE</a> message to the window. The 
  * 				<i>lParam</i> parameter of <b>WM_CREATE</b> contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-createstructa">CREATESTRUCT</a> structure. The 
  * 				<b>lpCreateParams</b> member of this structure contains a pointer to a <b>CLIENTCREATESTRUCT</b> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-clientcreatestruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class CLIENTCREATESTRUCT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the MDI application's window menu. An MDI application can retrieve this handle from the menu of the MDI frame window by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsubmenu">GetSubMenu</a> function.
     * @type {HANDLE}
     */
    hWindowMenu{
        get {
            if(!this.HasProp("__hWindowMenu"))
                this.__hWindowMenu := HANDLE(this.ptr + 0)
            return this.__hWindowMenu
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The child window identifier of the first MDI child window created. The system increments the identifier for each additional MDI child window the application creates, and reassigns identifiers when the application destroys a window to keep the range of identifiers contiguous. These identifiers are used in <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-command">WM_COMMAND</a> messages sent to the application's MDI frame window when a child window is chosen from the window menu; they should not conflict with any other command identifiers.
     * @type {Integer}
     */
    idFirstChild {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
