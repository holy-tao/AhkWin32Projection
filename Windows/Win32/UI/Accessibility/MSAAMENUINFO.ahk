#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by server developers to expose the names of owner-drawn menu items.
 * @remarks
 * By associating the <b>MSAAMENUINFO</b> structure with owner-drawn menu item data, server developers can expose the menu items without having to implement <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>.
  * 
  * The <b>MSAAMENUINFO</b> structure is the first member of the application-specific structure (or class) that contains the data for an owner-drawn menu item, which is pointed to by the <b>dwItemData</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-menuiteminfoa">MENUITEMINFO</a> structure.
  * 
  * The <b>MSAAMENUINFO</b> structure cannot be a member in a class that contains virtual functions because the first member of the class is always a compiler-generated pointer to a table of the virtual functions. To work around this problem, you can implement a structure that contains the <b>MSAAMENUINFO</b> as the first member, and a pointer to the class with the virtual functions as a second member, which contains the owner-drawn item data.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/ns-oleacc-msaamenuinfo
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class MSAAMENUINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Must be MSAA_MENU_SIG, which is defined in oleacc.h.
     * @type {Integer}
     */
    dwMSAASignature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Length, in characters, of the text for the menu item, <b>not including</b> the Unicode null-terminated character.
     * @type {Integer}
     */
    cchWText {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * The text of the menu item, in Unicode, <b>including</b> the Unicode null-terminated character.
     * @type {Pointer<Ptr>}
     */
    pszWText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
