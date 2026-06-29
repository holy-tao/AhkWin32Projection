#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POINTER_BUTTON_CHANGE_TYPE.ahk" { POINTER_BUTTON_CHANGE_TYPE }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\POINTER_INFO.ahk" { POINTER_INFO }
#Import "..\..\WindowsAndMessaging\POINTER_INPUT_TYPE.ahk" { POINTER_INPUT_TYPE }
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\POINTER_FLAGS.ahk" { POINTER_FLAGS }

/**
 * Defines basic pen information common to all pointer types.
 * @remarks
 * Applications can retrieve this information using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfo">GetPointerPenInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframepeninfo">GetPointerFramePenInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfohistory">GetPointerPenInfoHistory</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframepeninfohistory">GetPointerFramePenInfoHistory</a> API functions.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_pen_info
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct POINTER_PEN_INFO {
    #StructPack 8

    /**
     * Type: <b>POINTER_INFO</b>
     * 
     * An embedded <a href="https://docs.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure.
     */
    pointerInfo : POINTER_INFO

    /**
     * Type: <b>PEN_FLAGS</b>
     * 
     * The pen flag. This member can be zero or any reasonable combination of the values from the <a href="https://docs.microsoft.com/windows/win32/inputmsg/pen-flags-constants">Pen Flags</a> constants.
     */
    penFlags : UInt32

    /**
     * Type: <b>PEN_MASK</b>
     * 
     * The pen mask. This member can be zero or any reasonable combination of the values from the <a href="https://docs.microsoft.com/windows/win32/inputmsg/pen-mask-constants">Pen Mask</a> constants.
     */
    penMask : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     *  A pen pressure normalized to a range between 0 and 1024. The default is 0 if the device does not report pressure.
     */
    pressure : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The clockwise rotation, or twist, of the pointer normalized in a range of 0 to 359.
     * The default is 0.
     */
    rotation : UInt32

    /**
     * Type: <b>INT32</b>
     * 
     * The angle of tilt of the pointer along the x-axis in a range of -90 to +90, with a positive value indicating a tilt to the right.
     * The default is 0.
     */
    tiltX : Int32

    /**
     * Type: <b>INT32</b>
     * 
     * The angle of tilt of the pointer along the y-axis in a range of -90 to +90, with a positive value indicating a tilt toward the user. The default is 0.
     */
    tiltY : Int32

}
