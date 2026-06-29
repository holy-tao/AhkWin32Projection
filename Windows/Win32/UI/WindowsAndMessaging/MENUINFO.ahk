#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MENUINFO_MASK.ahk" { MENUINFO_MASK }
#Import ".\MENUINFO_STYLE.ahk" { MENUINFO_STYLE }
#Import "..\..\Graphics\Gdi\HBRUSH.ahk" { HBRUSH }

/**
 * Contains information about a menu.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-menuinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENUINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(MENUINFO)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     */
    fMask : MENUINFO_MASK

    /**
     * Type: <b>DWORD</b>
     */
    dwStyle : MENUINFO_STYLE

    /**
     * Type: <b>UINT</b>
     * 
     * The maximum height of the menu in pixels. When the menu items exceed the space available, scroll bars are automatically used. The default (0) is the screen height.
     */
    cyMax : UInt32

    /**
     * Type: <b>HBRUSH</b>
     * 
     * A handle to the brush to be used for the menu's background.
     */
    hbrBack : HBRUSH

    /**
     * Type: <b>DWORD</b>
     * 
     * The context help identifier. This is the same value used in 
     * 					the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmenucontexthelpid">GetMenuContextHelpId</a> and 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setmenucontexthelpid">SetMenuContextHelpId</a> functions.
     */
    dwContextHelpID : UInt32

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * An application-defined value.
     */
    dwMenuData : IntPtr

}
