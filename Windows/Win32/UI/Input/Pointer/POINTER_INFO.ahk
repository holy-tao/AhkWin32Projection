#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\POINT.ahk

/**
 * Contains basic pointer information common to all pointer types. Applications can retrieve this information using the GetPointerInfo, GetPointerFrameInfo, GetPointerInfoHistory and GetPointerFrameInfoHistory functions.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_info
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">POINTER_INPUT_TYPE</a> enumeration that specifies the pointer type.
     * @type {Integer}
     */
    pointerType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * An identifier that uniquely identifies a pointer during its lifetime. A pointer comes into existence when it is first detected and ends its existence when it goes out of detection range. Note that if a physical entity (finger or pen) goes out of detection range and then returns to be detected again, it is treated as a new pointer and may be assigned a new pointer identifier.
     * @type {Integer}
     */
    pointerId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * An identifier common to multiple pointers for which the source device reported an update in a single input frame. For example, a parallel-mode multi-touch digitizer may report the positions of multiple touch contacts in a single update to the system.
     * 
     * Note that frame identifier is assigned as input is reported to the system for all pointers across all devices. Therefore, this field may not contain strictly sequential values in a single series of messages that a window receives. However, this field will contain the same numerical value for all input updates that were reported in the same input frame by a single device.
     * @type {Integer}
     */
    frameId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAGS</a></b>
     * 
     * May be any reasonable combination of flags from the <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">Pointer Flags</a> constants.
     * @type {Integer}
     */
    pointerFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * Handle to the source device that can be used in calls to the raw input device API and the digitizer device API.
     * @type {HANDLE}
     */
    sourceDevice{
        get {
            if(!this.HasProp("__sourceDevice"))
                this.__sourceDevice := HANDLE(this.ptr + 16)
            return this.__sourceDevice
        }
    }

    /**
     * Type: <b>HWND</b>
     * 
     * Window to which this message was targeted. If the pointer is captured, either implicitly by virtue of having made contact over this window or explicitly using the pointer capture API, this is the capture window. If the pointer is uncaptured, this is the window over which the pointer was when this message was generated.
     * @type {HWND}
     */
    hwndTarget{
        get {
            if(!this.HasProp("__hwndTarget"))
                this.__hwndTarget := HWND(this.ptr + 24)
            return this.__hwndTarget
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The predicted screen coordinates of the pointer, in pixels. 
     * 
     * The predicted value is based on the pointer position reported by the digitizer and the motion of the pointer. This correction can compensate for visual lag due to inherent delays in sensing and processing the pointer location on the digitizer. This is applicable to  pointers of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>. For other pointer types, the predicted value will be the same as the non-predicted value (see <b>ptPixelLocationRaw</b>).
     * @type {POINT}
     */
    ptPixelLocation{
        get {
            if(!this.HasProp("__ptPixelLocation"))
                this.__ptPixelLocation := POINT(this.ptr + 32)
            return this.__ptPixelLocation
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The predicted screen coordinates of the pointer, in HIMETRIC units. 
     * 
     * The predicted value is based on the pointer position reported by the digitizer and the motion of the pointer. This correction can compensate for visual lag due to inherent delays in sensing and processing the pointer location on the digitizer. This is applicable to  pointers of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>. For other pointer types, the predicted value will be the same as the non-predicted value (see <b>ptHimetricLocationRaw</b>).
     * @type {POINT}
     */
    ptHimetricLocation{
        get {
            if(!this.HasProp("__ptHimetricLocation"))
                this.__ptHimetricLocation := POINT(this.ptr + 40)
            return this.__ptHimetricLocation
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The screen coordinates of the pointer, in pixels. For adjusted screen coordinates, see <b>ptPixelLocation</b>.
     * @type {POINT}
     */
    ptPixelLocationRaw{
        get {
            if(!this.HasProp("__ptPixelLocationRaw"))
                this.__ptPixelLocationRaw := POINT(this.ptr + 48)
            return this.__ptPixelLocationRaw
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The screen coordinates of the pointer, in HIMETRIC units. For adjusted screen coordinates, see <b>ptHimetricLocation</b>.
     * @type {POINT}
     */
    ptHimetricLocationRaw{
        get {
            if(!this.HasProp("__ptHimetricLocationRaw"))
                this.__ptHimetricLocationRaw := POINT(this.ptr + 56)
            return this.__ptHimetricLocationRaw
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * 0 or the time stamp of the message, based on the system tick count when the message was received. 
     * 
     * The application can specify the input time stamp in either <b>dwTime</b> or <b>PerformanceCount</b>. The value cannot be more recent than the current tick count or <b>QueryPerformanceCount (QPC)</b> value of the injection thread. Once a frame is injected with a time stamp, all subsequent frames must include a timestamp until all contacts in the frame go to an <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-pointer_button_change_type">UP</a> state. The custom timestamp value must also be provided for the first element in the contacts array. The time stamp values after the first element are ignored. The custom timestamp value must increment in every injection frame.
     * 
     * 
     * 
     * When <b>PerformanceCount</b> is specified, the time stamp will be converted to the current time in .1 millisecond resolution upon actual injection. If a custom <b>PerformanceCount</b> resulted in the same .1 millisecond window from the previous injection, <b>ERROR_NOT_READY</b> is returned and injection will not occur. While injection will not be invalidated immediately by the error, the next successful injection must have a <b>PerformanceCount</b> value that is at least 0.1 millisecond from the previously successful injection. This is also true if <b>dwTime</b> is used.
     * 
     * If both <b>dwTime</b> and <b>PerformanceCount</b> are specified in <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-injecttouchinput">InjectTouchInput</a>, ERROR_INVALID_PARAMETER is returned. 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-injecttouchinput">InjectTouchInput</a> cannot switch between <b>dwTime</b> and <b>PerformanceCount</b> once injection has started.
     * 
     * 
     * 
     * If neither <b>dwTime</b> and <b>PerformanceCount</b> are specified, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-injecttouchinput">InjectTouchInput</a> allocates the timestamp based on the timing of the call. If <b>InjectTouchInput</b> calls are  repeatedly less than 0.1 millisecond apart, ERROR_NOT_READY might be returned. The error will not invalidate the input immediately, but the injection application needs to retry the same frame again for injection to succeed.
     * @type {Integer}
     */
    dwTime {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Count of inputs that were coalesced into this message. This count matches the total count of entries that can be returned by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerinfohistory">GetPointerInfoHistory</a>. If no coalescing occurred, this count is 1 for the single input represented by the message.
     * @type {Integer}
     */
    historyCount {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * 
     * @type {Integer}
     */
    InputData {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwKeyStates {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Type: <b>UINT64</b>
     * 
     * The value of the high-resolution performance counter when the pointer message was received (high-precision, 64 bit alternative to <b>dwTime</b>). The value can be calibrated when the touch digitizer hardware supports the scan timestamp information in its input report.
     * @type {Integer}
     */
    PerformanceCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>POINTER_BUTTON_CHANGE_TYPE</b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-pointer_button_change_type">POINTER_BUTTON_CHANGE_TYPE</a> enumeration that specifies the change in button state between this input and the previous input.
     * @type {Integer}
     */
    ButtonChangeType {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }
}
