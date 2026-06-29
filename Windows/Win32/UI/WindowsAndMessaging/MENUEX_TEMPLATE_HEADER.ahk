#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the header for an extended menu template. This structure definition is for explanation only; it is not present in any standard header file.
 * @remarks
 * An extended menu template consists of a **MENUEX\_TEMPLATE\_HEADER** structure followed by one or more contiguous [**MENUEX\_TEMPLATE\_ITEM**](menuex-template-item.md) structures. The **MENUEX\_TEMPLATE\_ITEM** structures, which are variable in length, are aligned on **DWORD** boundaries. To create a menu from an extended menu template in memory, use the [**LoadMenuIndirect**](/windows/desktop/api/Winuser/nf-winuser-loadmenuindirecta) function.
 * @see https://learn.microsoft.com/windows/win32/menurc/menuex-template-header
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENUEX_TEMPLATE_HEADER {
    #StructPack 4

    /**
     * Type: **WORD**
     * 
     * 
     * The template version number. This member must be 1 for extended menu templates.
     */
    wVersion : UInt16

    /**
     * Type: **WORD**
     * 
     * 
     * The offset to the first [**MENUEX\_TEMPLATE\_ITEM**](menuex-template-item.md) structure, relative to the end of this structure member. If the first item definition immediately follows the **dwHelpId** member, this member should be 4.
     */
    wOffset : UInt16

    /**
     * Type: **DWORD**
     * 
     * 
     * The help identifier of menu bar.
     */
    dwHelpId : UInt32

}
