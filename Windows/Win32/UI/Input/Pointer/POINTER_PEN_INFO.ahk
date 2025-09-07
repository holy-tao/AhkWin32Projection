#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include .\POINTER_INFO.ahk

/**
 * Defines basic pen information common to all pointer types.
 * @remarks
 * Applications can retrieve this information using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfo">GetPointerPenInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframepeninfo">GetPointerFramePenInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerpeninfohistory">GetPointerPenInfoHistory</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframepeninfohistory">GetPointerFramePenInfoHistory</a> API functions.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_pen_info
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_PEN_INFO extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Type: <b>POINTER_INFO</b>
     * 
     * An embedded <a href="https://docs.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_info">POINTER_INFO</a> structure.
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
     * Type: <b>PEN_FLAGS</b>
     * 
     * The pen flag. This member can be zero or any reasonable combination of the values from the <a href="https://docs.microsoft.com/windows/win32/inputmsg/pen-flags-constants">Pen Flags</a> constants.
     * @type {Integer}
     */
    penFlags {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b>PEN_MASK</b>
     * 
     * The pen mask. This member can be zero or any reasonable combination of the values from the <a href="https://docs.microsoft.com/windows/win32/inputmsg/pen-mask-constants">Pen Mask</a> constants.
     * @type {Integer}
     */
    penMask {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     *  A pen pressure normalized to a range between 0 and 1024. The default is 0 if the device does not report pressure.
     * @type {Integer}
     */
    pressure {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The clockwise rotation, or twist, of the pointer normalized in a range of 0 to 359.
     * The default is 0.
     * @type {Integer}
     */
    rotation {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b>INT32</b>
     * 
     * The angle of tilt of the pointer along the x-axis in a range of -90 to +90, with a positive value indicating a tilt to the right.
     * The default is 0.
     * @type {Integer}
     */
    tiltX {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Type: <b>INT32</b>
     * 
     * The angle of tilt of the pointer along the y-axis in a range of -90 to +90, with a positive value indicating a tilt toward the user. The default is 0.
     * @type {Integer}
     */
    tiltY {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }
}
