#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }

/**
 * The CANDIDATEFORM structure (immdev.h) contains position information for the candidate window.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-candidateform
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct CANDIDATEFORM {
    #StructPack 4

    /**
     * Candidate list identifier. It is 0 for the first list, 1 for the second, and so on. The maximum index is 3.
     */
    dwIndex : UInt32

    dwStyle : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure containing the coordinates of the upper left corner of the candidate window or the caret position, depending on the value of <b>dwStyle</b>.
     */
    ptCurrentPos : POINT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the coordinates of the upper left and lower right corners of the exclusion area.
     */
    rcArea : RECT

}
