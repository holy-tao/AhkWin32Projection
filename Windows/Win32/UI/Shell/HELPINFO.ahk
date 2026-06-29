#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\HELP_INFO_TYPE.ahk" { HELP_INFO_TYPE }

/**
 * Contains information about an item for which context-sensitive help has been requested.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-helpinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HELPINFO {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure size, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>int</b>
     */
    iContextType : HELP_INFO_TYPE

    /**
     * Type: <b>int</b>
     * 
     * The identifier of the window or control if <b>iContextType</b> is <b>HELPINFO_WINDOW</b>, or identifier of the menu item if <b>iContextType</b> is <b>HELPINFO_MENUITEM</b>.
     */
    iCtrlId : Int32

    /**
     * Type: <b>HANDLE</b>
     * 
     * The identifier of the child window or control if <b>iContextType</b> is <b>HELPINFO_WINDOW</b>, or identifier of the associated menu if <b>iContextType</b> is <b>HELPINFO_MENUITEM</b>.
     */
    hItemHandle : HANDLE

    /**
     * Type: <b>DWORD</b>
     * 
     * The help context identifier of the window or control.
     */
    dwContextId : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the screen coordinates of the mouse cursor. This is useful for providing help based on the position of the mouse cursor.
     */
    MousePos : POINT

}
