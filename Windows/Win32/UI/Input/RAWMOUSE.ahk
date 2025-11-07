#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the state of the mouse.
 * @remarks
 * 
 * If the mouse has moved, indicated by **MOUSE_MOVE_RELATIVE** or **MOUSE_MOVE_ABSOLUTE**, **lLastX** and **lLastY** specify information about that movement. The information is specified as relative or absolute integer values.
 * 
 * If **MOUSE_MOVE_RELATIVE** value is specified, **lLastX** and **lLastY** specify movement relative to the previous mouse event (the last reported position). Positive values mean the mouse moved right (or down); negative values mean the mouse moved left (or up).
 * 
 * If **MOUSE_MOVE_ABSOLUTE** value is specified, **lLastX** and **lLastY** contain normalized absolute coordinates between 0 and 65,535. Coordinate (0,0) maps onto the upper-left corner of the display surface; coordinate (65535,65535) maps onto the lower-right corner. In a multimonitor system, the coordinates map to the primary monitor.
 * 
 * If **MOUSE_VIRTUAL_DESKTOP** is specified in addition to **MOUSE_MOVE_ABSOLUTE**, the coordinates map to the entire virtual desktop.
 * 
 * ```cpp
 * if ((rawMouse.usFlags & MOUSE_MOVE_ABSOLUTE) == MOUSE_MOVE_ABSOLUTE)
 * {
 *     bool isVirtualDesktop = (rawMouse.usFlags & MOUSE_VIRTUAL_DESKTOP) == MOUSE_VIRTUAL_DESKTOP;
 * 
 *     int width = GetSystemMetrics(isVirtualDesktop ? SM_CXVIRTUALSCREEN : SM_CXSCREEN);
 *     int height = GetSystemMetrics(isVirtualDesktop ? SM_CYVIRTUALSCREEN : SM_CYSCREEN);
 * 
 *     int absoluteX = int((rawMouse.lLastX / 65535.0f) * width);
 *     int absoluteY = int((rawMouse.lLastY / 65535.0f) * height);
 * }
 * else if (rawMouse.lLastX != 0 || rawMouse.lLastY != 0)
 * {
 *     int relativeX = rawMouse.lLastX;
 *     int relativeY = rawMouse.lLastY;
 * }
 * ```
 * 
 * In contrast to legacy [WM_MOUSEMOVE](/windows/win32/inputdev/wm-mousemove) window messages Raw Input mouse events is not subject to the effects of the mouse speed set in the Control Panel's **Mouse Properties** sheet. See [About Mouse Input](/windows/win32/inputdev/about-mouse-input) for details.
 * 
 * If mouse wheel is moved, indicated by **RI_MOUSE_WHEEL** or **RI_MOUSE_HWHEEL** in **usButtonFlags**, then **usButtonData** contains a signed **short** value that specifies the distance the wheel is rotated.
 * 
 * The wheel rotation will be a multiple of **WHEEL_DELTA**, which is set at 120. This is the threshold for action to be taken, and one such action (for example, scrolling one increment) should occur for each delta.
 * 
 * The delta was set to 120 to allow Microsoft or other vendors to build finer-resolution wheels (a freely-rotating wheel with no notches) to send more messages per rotation, but with a smaller value in each message. To use this feature, you can either add the incoming delta values until **WHEEL_DELTA** is reached (so for a delta-rotation you get the same response), or scroll partial lines in response to the more frequent messages. You can also choose your scroll granularity and accumulate deltas until it is reached.
 * 
 * The application could also retrieve the current lines-to-scroll and characters-to-scroll user setting by using the [SystemParametersInfo](nf-winuser-systemparametersinfoa.md) API with **SPI_GETWHEELSCROLLLINES** or **SPI_GETWHEELSCROLLCHARS** parameter.
 * 
 * Here is example of such wheel handling code:
 * 
 * ```cpp
 * if ((rawMouse.usButtonFlags & RI_MOUSE_WHEEL) == RI_MOUSE_WHEEL ||
 *     (rawMouse.usButtonFlags & RI_MOUSE_HWHEEL) == RI_MOUSE_HWHEEL)
 * {
 *     static const unsigned long defaultScrollLinesPerWheelDelta = 3;
 *     static const unsigned long defaultScrollCharsPerWheelDelta = 1;
 * 
 *     float wheelDelta = (float)(short)rawMouse.usButtonData;
 *     float numTicks = wheelDelta / WHEEL_DELTA;
 * 
 *     bool isHorizontalScroll = (rawMouse.usButtonFlags & RI_MOUSE_HWHEEL) == RI_MOUSE_HWHEEL;
 *     bool isScrollByPage = false;
 *     float scrollDelta = numTicks;
 * 
 *     if (isHorizontalScroll)
 *     {
 *         unsigned long scrollChars = defaultScrollCharsPerWheelDelta;
 *         SystemParametersInfo(SPI_GETWHEELSCROLLCHARS, 0, &scrollChars, 0);
 *         scrollDelta *= scrollChars;
 *     }
 *     else
 *     {
 *         unsigned long scrollLines = defaultScrollLinesPerWheelDelta;
 *         SystemParametersInfo(SPI_GETWHEELSCROLLLINES, 0, &scrollLines, 0);
 *         if (scrollLines == WHEEL_PAGESCROLL)
 *             isScrollByPage = true;
 *         else
 *             scrollDelta *= scrollLines;
 *     }
 * }
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-rawmouse
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RAWMOUSE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Type: **USHORT**
     * 
     * The mouse state. This member can be any reasonable combination of the following. 
     * 
     * | Value | Meaning |
     * |-------|---------|
     * | **MOUSE_MOVE_RELATIVE**</br>0x00 | Mouse movement data is relative to the last mouse position. For further information about mouse motion, see the following Remarks section. |
     * | **MOUSE_MOVE_ABSOLUTE**</br>0x01 | Mouse movement data is based on absolute position. For further information about mouse motion, see the following Remarks section. |
     * | **MOUSE_VIRTUAL_DESKTOP**</br>0x02 | Mouse coordinates are mapped to the virtual desktop (for a multiple monitor system). For further information about mouse motion, see the following Remarks section. |
     * | **MOUSE_ATTRIBUTES_CHANGED**</br>0x04 | Mouse attributes changed; application needs to query the mouse attributes. |
     * | **MOUSE_MOVE_NOCOALESCE**</br>0x08 | This mouse movement event was not coalesced. Mouse movement events can be coalescened by default.<br/>Windows XP/2000: This value is not supported. |
     * @type {Integer}
     */
    usFlags {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulButtons {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    usButtonFlags {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    usButtonData {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Type: **ULONG**
     * 
     * The raw state of the mouse buttons. The Win32 subsystem does not use this member.
     * @type {Integer}
     */
    ulRawButtons {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **LONG**
     * 
     * The motion in the X direction. This is signed relative motion or absolute motion, depending on the value of **usFlags**.
     * @type {Integer}
     */
    lLastX {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: **LONG**
     * 
     * The motion in the Y direction. This is signed relative motion or absolute motion, depending on the value of **usFlags**.
     * @type {Integer}
     */
    lLastY {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: **ULONG**
     * 
     * The device-specific additional information for the event.
     * @type {Integer}
     */
    ulExtraInformation {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
