#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FOCUS_EVENT_RECORD.ahk" { FOCUS_EVENT_RECORD }
#Import ".\WINDOW_BUFFER_SIZE_RECORD.ahk" { WINDOW_BUFFER_SIZE_RECORD }
#Import ".\KEY_EVENT_RECORD.ahk" { KEY_EVENT_RECORD }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import ".\COORD.ahk" { COORD }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MENU_EVENT_RECORD.ahk" { MENU_EVENT_RECORD }
#Import ".\MOUSE_EVENT_RECORD.ahk" { MOUSE_EVENT_RECORD }

/**
 * See reference information about the INPUT_RECORD structure, which describes an input event in the console input buffer.
 * @see https://learn.microsoft.com/windows/console/input-record-str
 * @namespace Windows.Win32.System.Console
 */
export default struct INPUT_RECORD {
    #StructPack 4


    struct _Event {
        KeyEvent : KEY_EVENT_RECORD

        static __New() {
            DefineProp(this.Prototype, 'MouseEvent', { type: MOUSE_EVENT_RECORD, offset: 0 })
            DefineProp(this.Prototype, 'WindowBufferSizeEvent', { type: WINDOW_BUFFER_SIZE_RECORD, offset: 0 })
            DefineProp(this.Prototype, 'MenuEvent', { type: MENU_EVENT_RECORD, offset: 0 })
            DefineProp(this.Prototype, 'FocusEvent', { type: FOCUS_EVENT_RECORD, offset: 0 })
            this.DeleteProp("__New")
        }
    }

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
     */
    EventType : UInt16

    /**
     * The event information. The format of this member depends on the event type specified by the **EventType** member.
     */
    Event : INPUT_RECORD._Event

}
