#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a cursor.
 * @remarks
 * When an application passes a cursor handle to the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-lockresource">LockResource</a> function, the function returns a pointer to a buffer containing information about the cursor. An application can use the <b>CURSORSHAPE</b> structure to access the information.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-cursorshape
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct CURSORSHAPE {
    #StructPack 4

    /**
     * Type: <b>int</b>
     * 
     * The horizontal position of the hot spot, relative to the upper-left corner of the cursor bitmap.
     */
    xHotSpot : Int32

    /**
     * Type: <b>int</b>
     * 
     * The vertical position of the hot spot, relative to the upper-left corner of the cursor bitmap.
     */
    yHotSpot : Int32

    /**
     * Type: <b>int</b>
     * 
     * The width, in pixels, of the cursor.
     */
    cx : Int32

    /**
     * Type: <b>int</b>
     * 
     * The height, in pixels, of the cursor.
     */
    cy : Int32

    /**
     * Type: <b>int</b>
     * 
     * The width, in bytes, of the cursor bitmap.
     */
    cbWidth : Int32

    /**
     * Type: <b>BYTE</b>
     * 
     * The number of color planes.
     */
    Planes : Int8

    /**
     * Type: <b>BYTE</b>
     * 
     * The number of bits used to indicate the color of a single pixel in the cursor.
     */
    BitsPixel : Int8

}
