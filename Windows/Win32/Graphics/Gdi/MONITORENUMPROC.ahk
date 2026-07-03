#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\HDC.ahk" { HDC }
#Import ".\HMONITOR.ahk" { HMONITOR }

/**
 * A MonitorEnumProc function is an application-defined callback function that is called by the EnumDisplayMonitors function.
 * @remarks
 * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> function to enumerate the set of display monitors that intersect the visible region of a specified device context and, optionally, a clipping rectangle. To do this, set the <i>hdc</i> parameter to a non-<b>NULL</b> value, and set the <i>lprcClip</i> parameter as needed.
 * 
 * You can also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> function to enumerate one or more of the display monitors on the desktop, without supplying a device context. To do this, set the <i>hdc</i> parameter of <b>EnumDisplayMonitors</b> to <b>NULL</b> and set the <i>lprcClip</i> parameter as needed.
 * 
 * In all cases, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> calls a specified <b>MonitorEnumProc</b> function once for each display monitor in the calculated enumeration set. The <b>MonitorEnumProc</b> function always receives a handle to the display monitor.
 * 
 * If the <i>hdc</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> is non-<b>NULL</b>, the <b>MonitorEnumProc</b> function also receives a handle to a device context whose color format is appropriate for the display monitor. You can then paint into the device context in a manner that is optimal for the display monitor.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-monitorenumproc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct MONITORENUMPROC {
    value : IntPtr

    __value {
        set {
            if (value is MONITORENUMPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HMONITOR} param0 A handle to the display monitor. This value will always be non-<b>NULL</b>.
     * @param {HDC} param1 A handle to a device context.
     * 
     * The device context has color attributes that are appropriate for the display monitor identified by <i>hMonitor</i>. The clipping area of the device context is set to the intersection of the visible region of the device context identified by the <i>hdc</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a>, the rectangle pointed to by the <i>lprcClip</i> parameter of <b>EnumDisplayMonitors</b>, and the display monitor rectangle.
     * 
     * This value is <b>NULL</b> if the <i>hdc</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> was <b>NULL</b>.
     * @param {Pointer<RECT>} param2 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure.
     * 
     * If <i>hdcMonitor</i> is non-<b>NULL</b>, this rectangle is the intersection of the clipping area of the device context identified by <i>hdcMonitor</i> and the display monitor rectangle. The rectangle coordinates are device-context coordinates.
     * 
     * If <i>hdcMonitor</i> is <b>NULL</b>, this rectangle is the display monitor rectangle. The rectangle coordinates are virtual-screen coordinates.
     * @param {LPARAM} param3 Application-defined data that <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> passes directly to the enumeration function.
     * @returns {BOOL} To continue the enumeration, return <b>TRUE</b>.
     * 
     * To stop the enumeration, return <b>FALSE</b>.
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, HMONITOR, param0, HDC, param1, RECT.Ptr, param2, LPARAM, param3, BOOL)
        return result
    }

    /**
     * A MONITORENUMPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends MONITORENUMPROC {
        /**
         * Creates a MONITORENUMPROC pointer that invokes the given AHK function when called.
         * @param {Func(HMONITOR, HDC, RECT, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HMONITOR, HDC, RECT.Ptr, LPARAM, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
