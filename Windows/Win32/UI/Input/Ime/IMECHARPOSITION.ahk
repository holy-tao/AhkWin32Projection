#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }

/**
 * The IMECHARPOSITION structure (immdev.h) contains information about the character position in the composition window.
 * @remarks
 * When an application uses IME to draw the composition string, the members of this structure are automatically filled. Applications that draw the composition string themselves, rather than relying on the IME, are responsible for filling all the fields defined in the structure.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-imecharposition
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMECHARPOSITION {
    #StructPack 4

    /**
     * Size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Character offset in the composition string, in <b>TCHAR</b> values.
     */
    dwCharPos : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure containing the coordinate of the top left point of requested character in screen coordinates. The top left point is based on the character baseline in any text flow.
     */
    pt : POINT

    /**
     * Height of a line that contains the requested character, in pixels.
     */
    cLineHeight : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the editable area for text, in screen coordinates, for the application.
     */
    rcDocument : RECT

}
