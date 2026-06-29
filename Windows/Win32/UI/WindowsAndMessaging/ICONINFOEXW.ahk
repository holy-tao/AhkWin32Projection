#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about an icon or a cursor. Extends ICONINFO. Used by GetIconInfoEx. (Unicode)
 * @remarks
 * For monochrome icons, the <b>hbmMask</b> is twice the height of the icon (with the AND mask on top and the XOR mask on the bottom), and <b>hbmColor</b> is <b>NULL</b>. Also, in this case the height should be an even multiple of two.
 * 
 * For color icons, the <b>hbmMask</b> and <b>hbmColor</b> bitmaps are the same size, each of which is the size of the icon.
 * 
 * You can use a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getobject">GetObject</a> function to get contents of <b>hbmMask</b> and <b>hbmColor</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmap">BITMAP</a> structure. The bitmap bits can be obtained with call to <a href="https://docs.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getdibits">GetDIBits</a> on the bitmaps in this structure.
 * 
 * > [!NOTE]
 * > The winuser.h header defines ICONINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-iconinfoexw
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset Unicode
 */
export default struct ICONINFOEXW {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

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

    /**
     * Type: <b>WORD</b>
     * 
     * The icon or cursor resource bits. These bits are typically loaded by calls to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-lookupiconidfromdirectoryex">LookupIconIdFromDirectoryEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadresource">LoadResource</a> functions.
     */
    wResID : UInt16

    /**
     * Type: <b>TCHAR[MAX_PATH]</b>
     * 
     * The fully qualified path of the module.
     */
    szModName : WCHAR[260]

    /**
     * Type: <b>TCHAR[MAX_PATH]</b>
     * 
     * The fully qualified path of the resource.
     */
    szResName : WCHAR[260]

}
