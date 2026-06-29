#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * Contains status information for the application-switching (ALT+TAB) window.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-alttabinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct ALTTABINFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the structure. The caller must set this to <c>sizeof(ALTTABINFO)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>int</b>
     * 
     * The number of items in the window.
     */
    cItems : Int32

    /**
     * Type: <b>int</b>
     * 
     * The number of columns in the window.
     */
    cColumns : Int32

    /**
     * Type: <b>int</b>
     * 
     * The number of rows in the window.
     */
    cRows : Int32

    /**
     * Type: <b>int</b>
     * 
     * The column of the item that has the focus.
     */
    iColFocus : Int32

    /**
     * Type: <b>int</b>
     * 
     * The row of the item that has the focus.
     */
    iRowFocus : Int32

    /**
     * Type: <b>int</b>
     * 
     * The width of each icon in the application-switching window.
     */
    cxItem : Int32

    /**
     * Type: <b>int</b>
     * 
     * The height of each icon in the application-switching window.
     */
    cyItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The top-left corner of the first icon.
     */
    ptStart : POINT

}
