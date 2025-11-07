#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk

/**
 * Used by the TrackMouseEvent function to track when the mouse pointer leaves a window or hovers over a window for a specified amount of time.
 * @remarks
 * 
 * The system default hover time-out is initially the menu drop-down time, which is 400 milliseconds. You can call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> and use <b>SPI_GETMOUSEHOVERTIME</b> to retrieve the default hover time-out.
 * 
 * The system default hover rectangle is the same as the double-click rectangle. You can call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> and use <b>SPI_GETMOUSEHOVERWIDTH</b> and <b>SPI_GETMOUSEHOVERHEIGHT</b> to retrieve the size of the rectangle within which the mouse pointer has to stay for <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-trackmouseevent">TrackMouseEvent</a> to generate a <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-mousehover">WM_MOUSEHOVER</a> message.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-trackmouseevent
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class TRACKMOUSEEVENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the <b>TRACKMOUSEEVENT</b> structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window to track.
     * @type {HWND}
     */
    hwndTrack{
        get {
            if(!this.HasProp("__hwndTrack"))
                this.__hwndTrack := HWND(8, this)
            return this.__hwndTrack
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The hover time-out (if <b>TME_HOVER</b> was specified in <b>dwFlags</b>), in milliseconds. Can be <b>HOVER_DEFAULT</b>, which means to use the system default hover time-out.
     * @type {Integer}
     */
    dwHoverTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
