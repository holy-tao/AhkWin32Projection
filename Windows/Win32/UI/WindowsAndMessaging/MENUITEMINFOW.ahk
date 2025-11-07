#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HMENU.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * Contains information about a menu item.
 * @remarks
 * 
 * The <b>MENUITEMINFO</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmenuiteminfoa">GetMenuItemInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-insertmenuitema">InsertMenuItem</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setmenuiteminfoa">SetMenuItemInfo</a> functions.
 * 
 * The menu can display items using text, bitmaps, or both.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines MENUITEMINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-menuiteminfow
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset Unicode
 */
class MENUITEMINFOW extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(MENUITEMINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    fType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The menu item state. This member can be one or more of these values. Set 
     * 					<b>fMask</b> to <b>MIIM_STATE</b> to use 
     * 					<b>fState</b>. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFS_CHECKED"></a><a id="mfs_checked"></a><dl>
     * <dt><b>MFS_CHECKED</b></dt>
     * <dt>0x00000008L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Checks the menu item. For more information about selected menu items, see the 
     * 						<b>hbmpChecked</b>  member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFS_DEFAULT"></a><a id="mfs_default"></a><dl>
     * <dt><b>MFS_DEFAULT</b></dt>
     * <dt>0x00001000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the menu item is the default. A menu can contain only one default menu item, which is displayed in bold.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFS_DISABLED"></a><a id="mfs_disabled"></a><dl>
     * <dt><b>MFS_DISABLED</b></dt>
     * <dt>0x00000003L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables the menu item and grays it so that it cannot be selected. This is equivalent to <b>MFS_GRAYED</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFS_ENABLED"></a><a id="mfs_enabled"></a><dl>
     * <dt><b>MFS_ENABLED</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the menu item so that it can be selected. This is the default state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFS_GRAYED"></a><a id="mfs_grayed"></a><dl>
     * <dt><b>MFS_GRAYED</b></dt>
     * <dt>0x00000003L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables the menu item and grays it so that it cannot be selected. This is equivalent to <b>MFS_DISABLED</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFS_HILITE"></a><a id="mfs_hilite"></a><dl>
     * <dt><b>MFS_HILITE</b></dt>
     * <dt>0x00000080L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Highlights the menu item.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFS_UNCHECKED"></a><a id="mfs_unchecked"></a><dl>
     * <dt><b>MFS_UNCHECKED</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unchecks the menu item. For more information about clear menu items, see the 
     * 						<b>hbmpChecked</b>  member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFS_UNHILITE"></a><a id="mfs_unhilite"></a><dl>
     * <dt><b>MFS_UNHILITE</b></dt>
     * <dt>0x00000000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Removes the highlight from the menu item. This is the default state.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fState {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * An application-defined value that identifies the menu item. Set 
     * 					<b>fMask</b>  to <b>MIIM_ID</b>  to use 
     * 					<b>wID</b>.
     * @type {Integer}
     */
    wID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>HMENU</b>
     * 
     * A handle to the drop-down menu or submenu associated with the menu item. If the menu item is not an item that opens a drop-down menu or submenu, this member is <b>NULL</b>. Set 
     * 					<b>fMask</b>  to <b>MIIM_SUBMENU</b>  to use 
     * 					<b>hSubMenu</b>.
     * @type {HMENU}
     */
    hSubMenu{
        get {
            if(!this.HasProp("__hSubMenu"))
                this.__hSubMenu := HMENU(24, this)
            return this.__hSubMenu
        }
    }

    /**
     * Type: <b>HBITMAP</b>
     * 
     * A handle to the bitmap to display next to the item if it is selected. If this member is <b>NULL</b>, a default bitmap is used. If the <b>MFT_RADIOCHECK</b> type value is specified, the default bitmap is a bullet. Otherwise, it is a check mark. Set 
     * 					<b>fMask</b> to <b>MIIM_CHECKMARKS</b> to use 
     * 					<b>hbmpChecked</b>.
     * @type {HBITMAP}
     */
    hbmpChecked{
        get {
            if(!this.HasProp("__hbmpChecked"))
                this.__hbmpChecked := HBITMAP(32, this)
            return this.__hbmpChecked
        }
    }

    /**
     * Type: <b>HBITMAP</b>
     * 
     * A handle to the bitmap to display next to the item if it is not selected. If this member is <b>NULL</b>, no bitmap is used. Set 
     * 					<b>fMask</b> to <b>MIIM_CHECKMARKS</b> to use 
     * 					<b>hbmpUnchecked</b>.
     * @type {HBITMAP}
     */
    hbmpUnchecked{
        get {
            if(!this.HasProp("__hbmpUnchecked"))
                this.__hbmpUnchecked := HBITMAP(40, this)
            return this.__hbmpUnchecked
        }
    }

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * An application-defined value associated with the menu item. Set 
     * 					<b>fMask</b> to <b>MIIM_DATA</b> to use 
     * 					<b>dwItemData</b>.
     * @type {Pointer}
     */
    dwItemData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * The contents of the menu item. The meaning of this member depends on the value of 
     * 					<b>fType</b> and is used only if the <b>MIIM_TYPE</b> flag is set in the 
     * 					<b>fMask</b> member.
     * 
     * To retrieve a menu item of type <b>MFT_STRING</b>, first find the size of the string by setting the 
     * 						<b>dwTypeData</b> member of <b>MENUITEMINFO</b>  to <b>NULL</b> and then calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmenuiteminfoa">GetMenuItemInfo</a>. The value of 
     * 						<b>cch</b>+1 is the size needed. Then allocate a buffer of this size, place the pointer to the buffer in 
     * 						<b>dwTypeData</b>, increment <b>cch</b>, and call <b>GetMenuItemInfo</b> once again to fill the buffer with the string. If the retrieved menu item is of some other type, then <b>GetMenuItemInfo</b> sets the 
     * 						<b>dwTypeData</b> member to a value whose type is specified by the 
     * 						<b>fType</b> member.
     * 
     * When using with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setmenuiteminfoa">SetMenuItemInfo</a> function, this member should contain a value whose type is specified by the 
     * 						<b>fType</b> member.
     * 
     * <b>dwTypeData</b> is used only if the <b>MIIM_STRING</b> flag is set in the 
     * 						<b>fMask</b> member
     * @type {PWSTR}
     */
    dwTypeData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The length of the menu item text, in 
     * 					characters, when information is received about a menu item of the <b>MFT_STRING</b> type. However, <b>cch</b> is used only if the <b>MIIM_TYPE</b> flag is set in the 
     * 					<b>fMask</b> member and is zero otherwise. Also, <b>cch</b> is ignored when the content of a menu item is set by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setmenuiteminfoa">SetMenuItemInfo</a>.
     * 
     * Note that, before calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmenuiteminfoa">GetMenuItemInfo</a>, the application must set <b>cch</b> to the length of the buffer pointed to by the 
     * 						<b>dwTypeData</b> member. If the retrieved menu item is of type <b>MFT_STRING</b> (as indicated by the 
     * 						<b>fType</b> member), then <b>GetMenuItemInfo</b> changes 
     * 						<b>cch</b> to the length of the menu item text. If the retrieved menu item is of some other type, <b>GetMenuItemInfo</b> sets the 
     * 						<b>cch</b> field to zero. 
     * 
     * The 
     * 						<b>cch</b> member is used when the <b>MIIM_STRING</b> flag is set in the 
     * 						<b>fMask</b> member.
     * @type {Integer}
     */
    cch {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>HBITMAP</b>
     * 
     * A 
     * 					handle to the bitmap to be displayed, or it can be one of the values in the following table. It is used when the <b>MIIM_BITMAP</b> flag is set in the 
     * 					<b>fMask</b> member. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_CALLBACK"></a><a id="hbmmenu_callback"></a><dl>
     * <dt><b>HBMMENU_CALLBACK</b></dt>
     * <dt>((HBITMAP) -1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A bitmap that is drawn by the window that owns the menu. The application must process the <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-measureitem">WM_MEASUREITEM</a> and <a href="https://docs.microsoft.com/windows/desktop/Controls/wm-drawitem">WM_DRAWITEM</a> messages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_MBAR_CLOSE"></a><a id="hbmmenu_mbar_close"></a><dl>
     * <dt><b>HBMMENU_MBAR_CLOSE</b></dt>
     * <dt>((HBITMAP)  5)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Close button for the menu bar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_MBAR_CLOSE_D"></a><a id="hbmmenu_mbar_close_d"></a><dl>
     * <dt><b>HBMMENU_MBAR_CLOSE_D</b></dt>
     * <dt>((HBITMAP)  6)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disabled close button for the menu bar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_MBAR_MINIMIZE"></a><a id="hbmmenu_mbar_minimize"></a><dl>
     * <dt><b>HBMMENU_MBAR_MINIMIZE</b></dt>
     * <dt>((HBITMAP)  3)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Minimize button for the menu bar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_MBAR_MINIMIZE_D"></a><a id="hbmmenu_mbar_minimize_d"></a><dl>
     * <dt><b>HBMMENU_MBAR_MINIMIZE_D</b></dt>
     * <dt>((HBITMAP)  7)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disabled minimize button for the menu bar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_MBAR_RESTORE"></a><a id="hbmmenu_mbar_restore"></a><dl>
     * <dt><b>HBMMENU_MBAR_RESTORE</b></dt>
     * <dt>((HBITMAP)  2)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Restore button for the menu bar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_POPUP_CLOSE"></a><a id="hbmmenu_popup_close"></a><dl>
     * <dt><b>HBMMENU_POPUP_CLOSE</b></dt>
     * <dt>((HBITMAP)  8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Close button for the submenu.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_POPUP_MAXIMIZE"></a><a id="hbmmenu_popup_maximize"></a><dl>
     * <dt><b>HBMMENU_POPUP_MAXIMIZE</b></dt>
     * <dt>((HBITMAP) 10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Maximize button for the submenu.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_POPUP_MINIMIZE"></a><a id="hbmmenu_popup_minimize"></a><dl>
     * <dt><b>HBMMENU_POPUP_MINIMIZE</b></dt>
     * <dt>((HBITMAP) 11)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Minimize button for the submenu.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_POPUP_RESTORE"></a><a id="hbmmenu_popup_restore"></a><dl>
     * <dt><b>HBMMENU_POPUP_RESTORE</b></dt>
     * <dt>((HBITMAP)  9)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Restore button for the submenu.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HBMMENU_SYSTEM"></a><a id="hbmmenu_system"></a><dl>
     * <dt><b>HBMMENU_SYSTEM</b></dt>
     * <dt>((HBITMAP)  1)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows icon or the icon of the window specified in 
     * 						<b>dwItemData</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {HBITMAP}
     */
    hbmpItem{
        get {
            if(!this.HasProp("__hbmpItem"))
                this.__hbmpItem := HBITMAP(72, this)
            return this.__hbmpItem
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 80
    }
}
