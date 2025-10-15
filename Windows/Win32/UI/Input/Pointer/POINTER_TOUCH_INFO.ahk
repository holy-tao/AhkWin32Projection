#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include .\POINTER_INFO.ahk
#Include ..\..\..\Foundation\RECT.ahk

/**
 * Defines basic touch information common to all pointer types.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-pointer_touch_info
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_TOUCH_INFO extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a></b>
     * 
     * An embedded <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> header structure.
     * @type {POINTER_INFO}
     */
    pointerInfo{
        get {
            if(!this.HasProp("__pointerInfo"))
                this.__pointerInfo := POINTER_INFO(this.ptr + 0)
            return this.__pointerInfo
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/touch-flags-constants">Touch Flags</a></b>
     * 
     * Currently none.
     * @type {Integer}
     */
    touchFlags {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/touch-mask-constants">Touch Mask</a></b>
     * 
     * Indicates which of the optional fields contain valid values. The member can be zero or any combination of the values from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/touch-mask-constants">Touch Mask</a> constants.
     * @type {Integer}
     */
    touchMask {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Type: <b>RECT</b>
     * 
     *  The predicted screen coordinates of the contact area, in pixels.
     * By default, if the device does not report a contact area, this field defaults to a 0-by-0 rectangle centered around the pointer location.
     * 
     * 
     * The predicted value is based on the pointer position reported by the digitizer and the motion of the pointer. This correction can compensate for visual lag due to inherent delays in sensing and processing the pointer location on the digitizer. This is applicable to  pointers of type <a href="https://docs.microsoft.com/windows/win32/api/winuser/ne-winuser-tagpointer_input_type">PT_TOUCH</a>.
     * @type {RECT}
     */
    rcContact{
        get {
            if(!this.HasProp("__rcContact"))
                this.__rcContact := RECT(this.ptr + 104)
            return this.__rcContact
        }
    }

    /**
     * Type: <b>RECT</b>
     * 
     * The raw screen coordinates of the contact area, in pixels. For adjusted screen coordinates, see <b>rcContact</b>.
     * @type {RECT}
     */
    rcContactRaw{
        get {
            if(!this.HasProp("__rcContactRaw"))
                this.__rcContactRaw := RECT(this.ptr + 120)
            return this.__rcContactRaw
        }
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * A pointer orientation, with a value between 0 and 359, where 0 indicates a touch pointer aligned with the x-axis and pointing from left to right; increasing values indicate degrees of rotation in the clockwise direction.
     * 
     * This field defaults to 0 if the device does not report orientation.
     * @type {Integer}
     */
    orientation {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     *  A pen pressure normalized to a range between 0 and 1024. The default is 0 if the device does not report pressure.
     * @type {Integer}
     */
    pressure {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }
}
