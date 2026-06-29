#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about an icon or a cursor.
 * @remarks
 * For monochrome icons, the <b>hbmMask</b> is twice the height of the icon (with the AND mask on top and the XOR mask on the bottom), and <b>hbmColor</b> is <b>NULL</b>. Also, in this case the height should be an even multiple of two.
 * 
 * For color icons, the <b>hbmMask</b> and <b>hbmColor</b> bitmaps are the same size, each of which is the size of the icon.
 * 
 * You can use a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getobject">GetObject</a> function to get contents of <b>hbmMask</b> and <b>hbmColor</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a> structure. The bitmap bits can be obtained with call to <a href="https://docs.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getdibits">GetDIBits</a> on the bitmaps in this structure.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-iconinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct ICONINFO {
    #StructPack 8

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies whether this structure defines an icon or a cursor. A value of <b>TRUE</b> specifies an icon; <b>FALSE</b> specifies a cursor.
     */
    fIcon : BOOL

    /**
     * Type: <b>DWORD</b>
     * 
     * The x-coordinate of a cursor's hot spot. If this structure defines an icon, the hot spot is always in the center of the icon, and this member is ignored.
     */
    xHotspot : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The y-coordinate of the cursor's hot spot. If this structure defines an icon, the hot spot is always in the center of the icon, and this member is ignored.
     */
    yHotspot : UInt32

    /**
     * Type: <b>HBITMAP</b>
     * 
     * A handle to the icon monochrome mask <a href="https://docs.microsoft.com/windows/win32/gdi/bitmaps">bitmap</a>.
     */
    hbmMask : HBITMAP

    /**
     * Type: <b>HBITMAP</b>
     * 
     * A handle to the icon color <a href="https://docs.microsoft.com/windows/win32/gdi/bitmaps">bitmap</a>.
     */
    hbmColor : HBITMAP

}
