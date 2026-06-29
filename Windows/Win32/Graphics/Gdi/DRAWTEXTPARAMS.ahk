#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRAWTEXTPARAMS structure contains extended formatting options for the DrawTextEx function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-drawtextparams
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct DRAWTEXTPARAMS {
    #StructPack 4

    /**
     * The structure size, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * The size of each tab stop, in units equal to the average character width.
     */
    iTabLength : Int32

    /**
     * The left margin, in units equal to the average character width.
     */
    iLeftMargin : Int32

    /**
     * The right margin, in units equal to the average character width.
     */
    iRightMargin : Int32

    /**
     * Receives the number of characters processed by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-drawtextexa">DrawTextEx</a>, including white-space characters. The number can be the <a href="https://docs.microsoft.com/windows/desktop/gdi/specifying-length-of-text-output-string">length of the string</a> or the index of the first line that falls below the drawing area. Note that <b>DrawTextEx</b> always processes the entire string if the DT_NOCLIP formatting flag is specified.
     */
    uiLengthDrawn : UInt32

}
