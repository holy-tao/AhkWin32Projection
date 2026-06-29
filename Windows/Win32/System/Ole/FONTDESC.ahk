#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\CY.ahk" { CY }

/**
 * Contains parameters used to create a font object through the OleCreateFontIndirect function.
 * @see https://learn.microsoft.com/windows/win32/api/olectl/ns-olectl-fontdesc
 * @namespace Windows.Win32.System.Ole
 */
export default struct FONTDESC {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cbSizeofstruct : UInt32

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/nf-wtypesbase-olestr">OLESTR</a> that specifies the caller-owned string specifying the font name.
     * 
     * cySize
     */
    lpstrName : PWSTR

    /**
     * Initial point size of the font. Use the <b>int64</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/wtypes/ns-wtypes-cy-r1">CY</a> structure and scale your font size (in points) by 10000.
     */
    cySize : CY

    /**
     * Initial weight of the font. If the weight is below 550 (the average of FW_NORMAL, 400, and FW_BOLD, 700), then the <b>Bold</b> property is also initialized to <b>FALSE</b>. If the weight is above 550, the <b>Bold</b> property is set to <b>TRUE</b>.
     */
    sWeight : Int16

    /**
     * Initial character set of the font.
     */
    sCharset : Int16

    /**
     * Initial italic state of the font.
     */
    fItalic : BOOL

    /**
     * Initial underline state of the font.
     */
    fUnderline : BOOL

    /**
     * Initial strikethrough state of the font.
     */
    fStrikethrough : BOOL

}
