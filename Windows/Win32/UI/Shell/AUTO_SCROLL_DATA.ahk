#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * AUTO_SCROLL_DATA may be altered or unavailable.
 * @remarks
 * NUM_POINTS is currently set to <c>3</c>.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-auto_scroll_data
 * @namespace Windows.Win32.UI.Shell
 */
export default struct AUTO_SCROLL_DATA {
    #StructPack 4

    /**
     * Type: <b>int</b>
     * 
     * A value that indicates the number of times the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-dad_autoscroll">DAD_AutoScroll</a> function has stored data in the structure. The parameter is reset to <c>0</c> after it equals 2.
     */
    iNextSample : Int32

    /**
     * Type: <b>DWORD</b>
     * 
     * A <b>DWORD</b> that indicates the time of the last scroll. The scroll time is also stored in the <b>dwTimes</b> parameter indexed by the current value of <b>iNextSample</b>.
     */
    dwLastScroll : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that is used to determine whether the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-dad_autoscroll">DAD_AutoScroll</a> function should succeed. This parameter is set to <b>TRUE</b> when the <b>iNextSample</b> parameter is equal to NUM_POINTS.
     */
    bFull : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>[NUM_POINTS]</b>
     * 
     * A pointer to the current scroll coordinates. The index of this array is <b>iNextSample</b>.
     */
    pts : POINT[3]

    /**
     * Type: <b>DWORD[NUM_POINTS]</b>
     * 
     * A <b>DWORD</b> that indicates the current scroll time. The index of this array is <b>iNextSample</b>.
     */
    dwTimes : UInt32[3]

}
