#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the mouse's location in screen coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-mousemovepoint
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct MOUSEMOVEPOINT {
    #StructPack 8

    /**
     * Type: <b>int</b>
     * 
     * The x-coordinate of the mouse.
     */
    x : Int32

    /**
     * Type: <b>int</b>
     * 
     * The y-coordinate of the mouse.
     */
    y : Int32

    /**
     * Type: <b>DWORD</b>
     * 
     * The time stamp of the mouse coordinate.
     */
    time : UInt32

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional information associated with this coordinate.
     */
    dwExtraInfo : IntPtr

}
