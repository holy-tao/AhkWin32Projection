#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a simulated mouse event.
 * @remarks
 * 
  * If the mouse has moved, indicated by **MOUSEEVENTF_MOVE**, **dx** and **dy** specify information about that movement. The information is specified as absolute or relative integer values. 
  * 
  * If **MOUSEEVENTF_ABSOLUTE** value is specified, **dx** and **dy** contain normalized absolute coordinates between 0 and 65,535. The event procedure maps these coordinates onto the display surface. Coordinate (0,0) maps onto the upper-left corner of the display surface; coordinate (65535,65535) maps onto the lower-right corner. In a multimonitor system, the coordinates map to the primary monitor. 
  * 
  * If **MOUSEEVENTF_VIRTUALDESK** is specified, the coordinates map to the entire virtual desktop.
  * 
  * If the **MOUSEEVENTF_ABSOLUTE** value is not specified, **dx**and **dy** specify movement relative to the previous mouse event (the last reported position). Positive values mean the mouse moved right (or down); negative values mean the mouse moved left (or up). 
  * 
  * Relative mouse motion is subject to the effects of the mouse speed and the two-mouse threshold values. A user sets these three values with the **Pointer Speed** slider of the Control Panel's **Mouse Properties** sheet. You can obtain and set these values using the [SystemParametersInfo](/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa) function. 
  * 
  * The system applies two tests to the specified relative mouse movement. If the specified distance along either the x or y axis is greater than the first mouse threshold value, and the mouse speed is not zero, the system doubles the distance. If the specified distance along either the x or y axis is greater than the second mouse threshold value, and the mouse speed is equal to two, the system doubles the distance that resulted from applying the first threshold test. It is thus possible for the system to multiply specified relative mouse movement along the x or y axis by up to four times.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-mouseinput
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class MOUSEINPUT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **LONG**
     * 
     * The absolute position of the mouse, or the amount of motion since the last mouse event was generated, depending on the value of the **dwFlags** member. Absolute data is specified as the x coordinate of the mouse; relative data is specified as the number of pixels moved.
     * @type {Integer}
     */
    dx {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **LONG**
     * 
     * The absolute position of the mouse, or the amount of motion since the last mouse event was generated, depending on the value of the **dwFlags** member. Absolute data is specified as the y coordinate of the mouse; relative data is specified as the number of pixels moved.
     * @type {Integer}
     */
    dy {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **DWORD**
     * 
     * If **dwFlags** contains **MOUSEEVENTF_WHEEL**, then **mouseData** specifies the amount of wheel movement. A positive value indicates that the wheel was rotated forward, away from the user; a negative value indicates that the wheel was rotated backward, toward the user. One wheel click is defined as **WHEEL_DELTA**, which is 120.
     * 
     * **Windows Vista**: If *dwFlags* contains **MOUSEEVENTF_HWHEEL**, then *dwData* specifies the amount of wheel movement. A positive value indicates that the wheel was rotated to the right; a negative value indicates that the wheel was rotated to the left. One wheel click is defined as **WHEEL_DELTA**, which is 120.
     * 
     *  If **dwFlags** does not contain **MOUSEEVENTF_WHEEL**, **MOUSEEVENTF_XDOWN**, or **MOUSEEVENTF_XUP**, then **mouseData** should be zero.
     * 
     * If **dwFlags** contains **MOUSEEVENTF_XDOWN** or **MOUSEEVENTF_XUP**, then **mouseData** specifies which X buttons were pressed or released. This value may be any combination of the following flags.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **XBUTTON1**<br>0x0001 | Set if the first X button is pressed or released. |
     * | **XBUTTON2**<br>0x0002 | Set if the second X button is pressed or released. |
     * @type {Integer}
     */
    mouseData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **DWORD**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: **DWORD**
     * 
     * The time stamp for the event, in milliseconds. If this parameter is 0, the system will provide its own time stamp.
     * @type {Integer}
     */
    time {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **ULONG_PTR**
     * 
     * An additional value associated with the mouse event. An application calls [GetMessageExtraInfo](/windows/desktop/api/winuser/nf-winuser-getmessageextrainfo) to obtain this extra information.
     * @type {Pointer}
     */
    dwExtraInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
