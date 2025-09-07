#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\COORD.ahk

/**
 * See reference information about the MOUSE_EVENT_RECORD structure, which describes a mouse input event in a console INPUT_RECORD structure.
 * @remarks
 * Mouse events are placed in the input buffer when the console is in mouse mode (**ENABLE\_MOUSE\_INPUT**).
  * 
  * Mouse events are generated whenever the user moves the mouse, or presses or releases one of the mouse buttons. Mouse events are placed in a console's input buffer only when the console group has the keyboard focus and the cursor is within the borders of the console's window.
 * @see https://learn.microsoft.com/windows/console/mouse-event-record-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class MOUSE_EVENT_RECORD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A [**COORD**](coord-str.md) structure that contains the location of the cursor, in terms of the console screen buffer's character-cell coordinates.
     * @type {COORD}
     */
    dwMousePosition{
        get {
            if(!this.HasProp("__dwMousePosition"))
                this.__dwMousePosition := COORD(this.ptr + 0)
            return this.__dwMousePosition
        }
    }

    /**
     * The status of the mouse buttons. The least significant bit corresponds to the leftmost mouse button. The next least significant bit corresponds to the rightmost mouse button. The next bit indicates the next-to-leftmost mouse button. The bits then correspond left to right to the mouse buttons. A bit is 1 if the button was pressed.
     * 
     * The following constants are defined for the first five mouse buttons.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **FROM_LEFT_1ST_BUTTON_PRESSED** 0x0001 | The leftmost mouse button. |
     * | **FROM_LEFT_2ND_BUTTON_PRESSED** 0x0004 | The second button fom the left. |
     * | **FROM_LEFT_3RD_BUTTON_PRESSED** 0x0008 | The third button from the left. |
     * | **FROM_LEFT_4TH_BUTTON_PRESSED** 0x0010 | The fourth button from the left. |
     * | **RIGHTMOST_BUTTON_PRESSED** 0x0002 | The rightmost mouse button. |
     * @type {Integer}
     */
    dwButtonState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The state of the control keys. This member can be one or more of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **CAPSLOCK_ON** 0x0080 | The CAPS LOCK light is on. |
     * | **ENHANCED_KEY** 0x0100 | The key is enhanced. See [remarks](key-event-record-str.md#remarks). |
     * | **LEFT_ALT_PRESSED** 0x0002 | The left ALT key is pressed. |
     * | **LEFT_CTRL_PRESSED** 0x0008 | The left CTRL key is pressed. |
     * | **NUMLOCK_ON** 0x0020 | The NUM LOCK light is on. |
     * | **RIGHT_ALT_PRESSED** 0x0001 | The right ALT key is pressed. |
     * | **RIGHT_CTRL_PRESSED** 0x0004 | The right CTRL key is pressed. |
     * | **SCROLLLOCK_ON** 0x0040 | The SCROLL LOCK light is on. |
     * | **SHIFT_PRESSED** 0x0010 | The SHIFT key is pressed. |
     * @type {Integer}
     */
    dwControlKeyState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The type of mouse event. If this value is zero, it indicates a mouse button being pressed or released. Otherwise, this member is one of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **DOUBLE_CLICK** 0x0002 | The second click (button press) of a double-click occurred. The first click is returned as a regular button-press event. |
     * | **MOUSE_HWHEELED** 0x0008 | The horizontal mouse wheel was moved.<br /><br />If the high word of the **dwButtonState** member contains a positive value, the wheel was rotated to the right. Otherwise, the wheel was rotated to the left. |
     * | **MOUSE_MOVED** 0x0001 | A change in mouse position occurred. |
     * | **MOUSE_WHEELED** 0x0004 | The vertical mouse wheel was moved.<br /><br />If the high word of the **dwButtonState** member contains a positive value, the wheel was rotated forward, away from the user. Otherwise, the wheel was rotated backward, toward the user. |
     * @type {Integer}
     */
    dwEventFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
