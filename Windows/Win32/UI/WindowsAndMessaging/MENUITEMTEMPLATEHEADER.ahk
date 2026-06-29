#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the header for a menu template. A complete menu template consists of a header and one or more menu item lists.
 * @remarks
 * One or more <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-menuitemtemplate">MENUITEMTEMPLATE</a> structures are combined to form the menu item list.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-menuitemtemplateheader
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENUITEMTEMPLATEHEADER {
    #StructPack 2

    /**
     * Type: <b>WORD</b>
     * 
     * The version number. This member must be zero.
     */
    versionNumber : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * The offset, in bytes, from the end of the header. The menu item list begins at this offset. Usually, this member is zero, and the menu item list follows immediately after the header.
     */
    offset : UInt16

}
