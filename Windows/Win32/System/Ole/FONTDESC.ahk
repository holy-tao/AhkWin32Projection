#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains parameters used to create a font object through the OleCreateFontIndirect function.
 * @see https://docs.microsoft.com/windows/win32/api//olectl/ns-olectl-fontdesc
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
     * @type {PWSTR}
     */
    lpstrName{
        get {
            if(!this.HasProp("__lpstrName"))
                this.__lpstrName := PWSTR(this.ptr + 8)
            return this.__lpstrName
        }
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
     * @type {BOOL}
     */
    fItalic{
        get {
            if(!this.HasProp("__fItalic"))
                this.__fItalic := BOOL(this.ptr + 36)
            return this.__fItalic
        }
    }

    /**
     * Initial underline state of the font.
     * @type {BOOL}
     */
    fUnderline{
        get {
            if(!this.HasProp("__fUnderline"))
                this.__fUnderline := BOOL(this.ptr + 40)
            return this.__fUnderline
        }
    }

    /**
     * Initial strikethrough state of the font.
     * @type {BOOL}
     */
    fStrikethrough{
        get {
            if(!this.HasProp("__fStrikethrough"))
                this.__fStrikethrough := BOOL(this.ptr + 44)
            return this.__fStrikethrough
        }
    }
}
