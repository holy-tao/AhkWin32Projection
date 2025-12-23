#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the header for an extended menu template. This structure definition is for explanation only; it is not present in any standard header file.
 * @remarks
 * An extended menu template consists of a **MENUEX\_TEMPLATE\_HEADER** structure followed by one or more contiguous [**MENUEX\_TEMPLATE\_ITEM**](menuex-template-item.md) structures. The **MENUEX\_TEMPLATE\_ITEM** structures, which are variable in length, are aligned on **DWORD** boundaries. To create a menu from an extended menu template in memory, use the [**LoadMenuIndirect**](/windows/desktop/api/Winuser/nf-winuser-loadmenuindirecta) function.
 * @see https://learn.microsoft.com/windows/win32/menurc/menuex-template-header
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUEX_TEMPLATE_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **WORD**
     * 
     * 
     * The template version number. This member must be 1 for extended menu templates.
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: **WORD**
     * 
     * 
     * The offset to the first [**MENUEX\_TEMPLATE\_ITEM**](menuex-template-item.md) structure, relative to the end of this structure member. If the first item definition immediately follows the **dwHelpId** member, this member should be 4.
     * @type {Integer}
     */
    wOffset {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: **DWORD**
     * 
     * 
     * The help identifier of menu bar.
     * @type {Integer}
     */
    dwHelpId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
