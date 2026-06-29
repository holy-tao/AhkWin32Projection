#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * Carries information required to process the MCN_GETDAYSTATE notification code. All members of this structure are for input, except prgDayState, which the receiving application must set when processing MCN_GETDAYSTATE.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmdaystate
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMDAYSTATE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the starting date.
     */
    stStart : SYSTEMTIME

    /**
     * Type: <b>int</b>
     * 
     * INT value specifying the total number of elements that must be in the array at 
     * 					<b>prgDayState</b>.
     */
    cDayState : Int32

    /**
     * Type: <b>LPMONTHDAYSTATE</b>
     * 
     * Address of an array of <a href="https://docs.microsoft.com/windows/desktop/Controls/monthdaystate">MONTHDAYSTATE</a> values. The buffer at this address must be large enough to contain at least 
     * 					<b>cDayState</b> elements. The first element in the array corresponds to the date in 
     * 					<b>stStart</b>.
     */
    prgDayState : IntPtr

}
