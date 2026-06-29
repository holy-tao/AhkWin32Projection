#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\HCURSOR.ahk" { HCURSOR }
#Import ".\CURSORINFO_FLAGS.ahk" { CURSORINFO_FLAGS }

/**
 * Contains global cursor information.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-cursorinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct CURSORINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(CURSORINFO)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     */
    flags : CURSORINFO_FLAGS

    /**
     * Type: <b>HCURSOR</b>
     * 
     * A handle to the cursor.
     */
    hCursor : HCURSOR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * A   structure that receives the screen coordinates of the cursor.
     */
    ptScreenPos : POINT

}
