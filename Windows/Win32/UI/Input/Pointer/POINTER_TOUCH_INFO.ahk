#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POINTER_BUTTON_CHANGE_TYPE.ahk" { POINTER_BUTTON_CHANGE_TYPE }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\POINTER_INFO.ahk" { POINTER_INFO }
#Import "..\..\WindowsAndMessaging\POINTER_INPUT_TYPE.ahk" { POINTER_INPUT_TYPE }
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }
#Import ".\POINTER_FLAGS.ahk" { POINTER_FLAGS }

/**
 * Defines basic touch information common to all pointer types.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_touch_info
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct POINTER_TOUCH_INFO {
    #StructPack 8

    /**
     * Type: **[POINTER_INFO](ns-winuser-pointer_info.md)**
     * 
     * An embedded [POINTER_INFO](ns-winuser-pointer_info.md) header structure.
     */
    pointerInfo : POINTER_INFO

    /**
     * Type: **[Touch Flags](/windows/win32/inputmsg/touch-flags-constants)**
     * 
     * Currently none.
     */
    touchFlags : UInt32

    /**
     * Type: **[Touch Mask](/windows/win32/inputmsg/touch-mask-constants)**
     * 
     * Indicates which of the optional fields contain valid values. The member can be zero or any combination of the values from the [Touch Mask](/windows/win32/inputmsg/touch-mask-constants) constants.
     */
    touchMask : UInt32

    /**
     * Type: **RECT**
     * 
     * The predicted screen coordinates of the contact area, in pixels.
     * By default, if the device does not report a contact area, this field defaults to a 0-by-0 rectangle centered around the pointer location.
     * 
     * The predicted value is based on the pointer position reported by the digitizer and the motion of the pointer. This correction can compensate for visual lag due to inherent delays in sensing and processing the pointer location on the digitizer. This is applicable to  pointers of type [PT_TOUCH](ne-winuser-tagpointer_input_type.md).
     */
    rcContact : RECT

    /**
     * Type: **RECT**
     * 
     * The raw screen coordinates of the contact area, in pixels. For adjusted screen coordinates, see **rcContact**.
     */
    rcContactRaw : RECT

    /**
     * Type: **UINT32**
     * 
     * A pointer orientation, with a value between 0 and 359, where 0 indicates a touch pointer aligned with the x-axis and pointing from left to right; increasing values indicate degrees of rotation in the clockwise direction.
     * 
     * This field defaults to 0 if the device does not report orientation.
     * 
     * > [!NOTE]
     * > Some touchscreen devices that support orientation will only report half-range (0-180°) values, while other devices will only report full-range (0-359°) values.
     */
    orientation : UInt32

    /**
     * Type: **UINT32**
     * 
     *  A pen pressure normalized to a range between 0 and 1024. The default is 512.
     */
    pressure : UInt32

}
