#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MENUGETOBJECTINFO_FLAGS.ahk" { MENUGETOBJECTINFO_FLAGS }
#Import ".\HMENU.ahk" { HMENU }

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
 */
export default struct MENUGETOBJECTINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The position of the mouse cursor with respect to the item indicated by
     */
    dwFlags : MENUGETOBJECTINFO_FLAGS

    /**
     * Type: <b>UINT</b>
     * 
     * The position of the item the mouse cursor is on.
     */
    uPos : UInt32

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the menu the mouse cursor is on.
     */
    hmenu : HMENU

    /**
     * Type: <b>PVOID</b>
     * 
     * The identifier of the requested interface. Currently it can only be <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-idroptarget">IDropTarget</a>.
     */
    riid : IntPtr

    /**
     * Type: <b>PVOID</b>
     * 
     * A pointer to the interface corresponding to the 
     * 					<b>riid</b> member. This pointer is to be returned by the application when processing the message.
     */
    pvObj : IntPtr

}
