#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KEY_EVENT_RECORD.ahk
#Include .\COORD.ahk
#Include .\MOUSE_EVENT_RECORD.ahk
#Include .\WINDOW_BUFFER_SIZE_RECORD.ahk

/**
 * See reference information about the INPUT_RECORD structure, which describes an input event in the console input buffer.
 * @see https://learn.microsoft.com/windows/console/input-record-str
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class INPUT_RECORD extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A handle to the type of input event and the event record stored in the **Event** member.
     * 
     * This member can be one of the following values.
     * 
     * | Value | Meaning |
     * |-|-|
     * | **FOCUS_EVENT** 0x0010 | The **Event** member contains a **[FOCUS_EVENT_RECORD](focus-event-record-str.md)** structure. These events are used internally and should be ignored. |
     * | **KEY_EVENT** 0x0001 | The **Event** member contains a **[KEY_EVENT_RECORD](key-event-record-str.md)** structure with information about a keyboard event. |
     * | **MENU_EVENT** 0x0008 | The **Event** member contains a **[MENU_EVENT_RECORD](menu-event-record-str.md)** structure. These events are used internally and should be ignored. |
     * | **MOUSE_EVENT** 0x0002 | The **Event** member contains a **[MOUSE_EVENT_RECORD](mouse-event-record-str.md)** structure with information about a mouse movement or button press event. |
     * | **WINDOW_BUFFER_SIZE_EVENT** 0x0004 | The **Event** member contains a **[WINDOW_BUFFER_SIZE_RECORD](window-buffer-size-record-str.md)** structure with information about the new size of the console screen buffer. |
     * @type {Integer}
     */
    EventType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {KEY_EVENT_RECORD}
     */
    KeyEvent{
        get {
            if(!this.HasProp("__KeyEvent"))
                this.__KeyEvent := KEY_EVENT_RECORD(this.ptr + 8)
            return this.__KeyEvent
        }
    }

    /**
     * @type {MOUSE_EVENT_RECORD}
     */
    MouseEvent{
        get {
            if(!this.HasProp("__MouseEvent"))
                this.__MouseEvent := MOUSE_EVENT_RECORD(this.ptr + 8)
            return this.__MouseEvent
        }
    }

    /**
     * @type {WINDOW_BUFFER_SIZE_RECORD}
     */
    WindowBufferSizeEvent{
        get {
            if(!this.HasProp("__WindowBufferSizeEvent"))
                this.__WindowBufferSizeEvent := WINDOW_BUFFER_SIZE_RECORD(this.ptr + 8)
            return this.__WindowBufferSizeEvent
        }
    }

    /**
     * @type {Integer}
     */
    MenuEvent {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FocusEvent {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
