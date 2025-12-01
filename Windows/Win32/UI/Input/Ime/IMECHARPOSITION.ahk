#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include ..\..\..\Foundation\RECT.ahk

/**
 * The IMECHARPOSITION structure (immdev.h) contains information about the character position in the composition window.
 * @remarks
 * When an application uses IME to draw the composition string, the members of this structure are automatically filled. Applications that draw the composition string themselves, rather than relying on the IME, are responsible for filling all the fields defined in the structure.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-imecharposition
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMECHARPOSITION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Character offset in the composition string, in <b>TCHAR</b> values.
     * @type {Integer}
     */
    dwCharPos {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure containing the coordinate of the top left point of requested character in screen coordinates. The top left point is based on the character baseline in any text flow.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(8, this)
            return this.__pt
        }
    }

    /**
     * Height of a line that contains the requested character, in pixels.
     * @type {Integer}
     */
    cLineHeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the editable area for text, in screen coordinates, for the application.
     * @type {RECT}
     */
    rcDocument{
        get {
            if(!this.HasProp("__rcDocument"))
                this.__rcDocument := RECT(24, this)
            return this.__rcDocument
        }
    }
}
