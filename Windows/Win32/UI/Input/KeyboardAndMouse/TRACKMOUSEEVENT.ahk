#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\TRACKMOUSEEVENT_FLAGS.ahk" { TRACKMOUSEEVENT_FLAGS }

/**
 * Used by the TrackMouseEvent function to track when the mouse pointer leaves a window or hovers over a window for a specified amount of time.
 * @remarks
 * The system default hover time-out is initially the menu drop-down time, which is 400 milliseconds. You can call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> and use <b>SPI_GETMOUSEHOVERTIME</b> to retrieve the default hover time-out.
 * 
 * The system default hover rectangle is the same as the double-click rectangle. You can call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> and use <b>SPI_GETMOUSEHOVERWIDTH</b> and <b>SPI_GETMOUSEHOVERHEIGHT</b> to retrieve the size of the rectangle within which the mouse pointer has to stay for <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-trackmouseevent">TrackMouseEvent</a> to generate a <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousehover">WM_MOUSEHOVER</a> message.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-trackmouseevent
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct TRACKMOUSEEVENT {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the <b>TRACKMOUSEEVENT</b> structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     */
    dwFlags : TRACKMOUSEEVENT_FLAGS

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window to track.
     */
    hwndTrack : HWND

    /**
     * Type: <b>DWORD</b>
     * 
     * The hover time-out (if <b>TME_HOVER</b> was specified in <b>dwFlags</b>), in milliseconds. Can be <b>HOVER_DEFAULT</b>, which means to use the system default hover time-out.
     */
    dwHoverTime : UInt32

}
