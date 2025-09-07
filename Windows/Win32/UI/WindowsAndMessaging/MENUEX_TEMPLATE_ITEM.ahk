#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a menu item in an extended menu template. This structure definition is for explanation only; it is not present in any standard header file.
 * @remarks
 * An extended menu template consists of a [**MENUEX\_TEMPLATE\_HEADER**](menuex-template-header.md) structure followed by one or more contiguous **MENUEX\_TEMPLATE\_ITEM** structures. The **MENUEX\_TEMPLATE\_ITEM** structures, which are variable in length, are aligned on **DWORD** boundaries. To create a menu from an extended menu template in memory, use the [**LoadMenuIndirect**](/windows/desktop/api/Winuser/nf-winuser-loadmenuindirecta) function.
 * @see https://learn.microsoft.com/windows/win32/menurc/menuex-template-item
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUEX_TEMPLATE_ITEM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: **DWORD**
     * 
     * 
     * The menu item type. This member can be a combination of the type (beginning with MFT) values listed with the [**MENUITEMINFO**](/windows/win32/api/winuser/ns-winuser-menuiteminfoa) structure.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The menu item state. This member can be a combination of the state (beginning with MFS) values listed with the [**MENUITEMINFO**](/windows/win32/api/winuser/ns-winuser-menuiteminfoa) structure.
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **UINT**
     * 
     * 
     * The menu item identifier. This is an application-defined value that identifies the menu item. In an extended menu resource, items that open drop-down menus or submenus as well as command items can have identifiers.
     * @type {Integer}
     */
    uId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **WORD**
     * 
     * 
     * Specifies whether the menu item is the last item in the menu bar, drop-down menu, submenu, or shortcut menu and whether it is an item that opens a drop-down menu or submenu. This member can be zero or more of these values. For 32-bit applications, this member is a word; for 16-bit applications, it is a byte.
     * 
     * 
     * 0x80
     * 
     * The structure defines the last menu item in the menu bar, drop-down menu, submenu, or shortcut menu.
     * 
     * 
     * 0x01
     * 
     * The structure defines a item that opens a drop-down menu or submenu. Subsequent structures define menu items in the corresponding drop-down menu or submenu.
     * @type {Integer}
     */
    wFlags {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Type: **WCHAR**
     * 
     * 
     * The menu item text. This member is a null-terminated Unicode string, aligned on a word boundary. The size of the menu item definition varies depending on the length of this string.
     * @type {String}
     */
    szText {
        get => StrGet(this.ptr + 14, 0, "UTF-16")
        set => StrPut(value, this.ptr + 14, 0, "UTF-16")
    }
}
