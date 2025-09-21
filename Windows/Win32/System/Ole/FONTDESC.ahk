#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\CY.ahk

/**
 * Contains parameters used to create a font object through the OleCreateFontIndirect function.
 * @see https://learn.microsoft.com/windows/win32/api/olectl/ns-olectl-fontdesc
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class FONTDESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbSizeofstruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/nf-wtypesbase-olestr">OLESTR</a> that specifies the caller-owned string specifying the font name.
     * 
     * cySize
     * @type {Pointer<Char>}
     */
    lpstrName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Initial point size of the font. Use the <b>int64</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/wtypes/ns-wtypes-cy-r1">CY</a> structure and scale your font size (in points) by 10000.
     * @type {CY}
     */
    cySize{
        get {
            if(!this.HasProp("__cySize"))
                this.__cySize := CY(this.ptr + 16)
            return this.__cySize
        }
    }

    /**
     * Initial weight of the font. If the weight is below 550 (the average of FW_NORMAL, 400, and FW_BOLD, 700), then the <b>Bold</b> property is also initialized to <b>FALSE</b>. If the weight is above 550, the <b>Bold</b> property is set to <b>TRUE</b>.
     * @type {Integer}
     */
    sWeight {
        get => NumGet(this, 32, "short")
        set => NumPut("short", value, this, 32)
    }

    /**
     * Initial character set of the font.
     * @type {Integer}
     */
    sCharset {
        get => NumGet(this, 34, "short")
        set => NumPut("short", value, this, 34)
    }

    /**
     * Initial italic state of the font.
     * @type {Integer}
     */
    fItalic {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Initial underline state of the font.
     * @type {Integer}
     */
    fUnderline {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Initial strikethrough state of the font.
     * @type {Integer}
     */
    fStrikethrough {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
