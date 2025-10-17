#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRAWTEXTPARAMS structure contains extended formatting options for the DrawTextEx function.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-drawtextparams
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DRAWTEXTPARAMS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The structure size, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of each tab stop, in units equal to the average character width.
     * @type {Integer}
     */
    iTabLength {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The left margin, in units equal to the average character width.
     * @type {Integer}
     */
    iLeftMargin {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The right margin, in units equal to the average character width.
     * @type {Integer}
     */
    iRightMargin {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Receives the number of characters processed by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawtextexa">DrawTextEx</a>, including white-space characters. The number can be the <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> or the index of the first line that falls below the drawing area. Note that <b>DrawTextEx</b> always processes the entire string if the DT_NOCLIP formatting flag is specified.
     * @type {Integer}
     */
    uiLengthDrawn {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 20
    }
}
