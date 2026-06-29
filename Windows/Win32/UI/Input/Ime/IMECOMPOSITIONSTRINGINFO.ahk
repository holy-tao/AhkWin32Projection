#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information of IME's composition string in an app.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/ns-imepad-imecompositionstringinfo
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMECOMPOSITIONSTRINGINFO {
    #StructPack 4

    /**
     * Length (number of <b>WCHAR</b>s) of composition string.
     */
    iCompStrLen : Int32

    /**
     * Caret position of composition string.
     */
    iCaretPos : Int32

    /**
     * Position of composition string that is editable.
     */
    iEditStart : Int32

    /**
     * Length of composition string that is editable.
     */
    iEditLen : Int32

    /**
     * Start position of target phrase of composition string.
     */
    iTargetStart : Int32

    /**
     * Target phrase length of composition string.
     */
    iTargetLen : Int32

}
