#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the menu that the mouse cursor is on.
 * @remarks
 * The <b>MENUGETOBJECTINFO</b> structure is used only in drag-and-drop menus. When the 
  * 				<a href="https://docs.microsoft.com/windows/desktop/menurc/wm-menugetobject">WM_MENUGETOBJECT</a>  message is sent, 
  * 				<i>lParam</i> is a pointer to this structure. 
  * 
  * To create a drag-and-drop menu, call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setmenuinfo">SetMenuInfo</a> with <b>MNS_DRAGDROP</b> set.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-menugetobjectinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUGETOBJECTINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The position of the mouse cursor with respect to the item indicated by
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The position of the item the mouse cursor is on.
     * @type {Integer}
     */
    uPos {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu the mouse cursor is on.
     * @type {Pointer<Ptr>}
     */
    hmenu {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>PVOID</b>
     * 
     * The identifier of the requested interface. Currently it can only be <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a>.
     * @type {Pointer<Void>}
     */
    riid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>PVOID</b>
     * 
     * A pointer to the interface corresponding to the 
     * 					<b>riid</b> member. This pointer is to be returned by the application when processing the message.
     * @type {Pointer<Void>}
     */
    pvObj {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
