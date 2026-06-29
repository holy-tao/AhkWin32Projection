#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TBINSERTMARK_FLAGS.ahk" { TBINSERTMARK_FLAGS }

/**
 * Contains information on the insertion mark in a toolbar control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tbinsertmark
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TBINSERTMARK {
    #StructPack 4

    /**
     * Type: <b>int</b>
     * 
     * Zero-based index of the insertion mark. If this member is -1, there is no insertion mark.
     */
    iButton : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Defines where the insertion mark is in relation to
     */
    dwFlags : TBINSERTMARK_FLAGS

}
