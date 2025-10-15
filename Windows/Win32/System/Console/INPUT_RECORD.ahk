#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\CHAR.ahk
#Include .\KEY_EVENT_RECORD.ahk
#Include .\COORD.ahk
#Include .\MOUSE_EVENT_RECORD.ahk
#Include .\WINDOW_BUFFER_SIZE_RECORD.ahk
#Include .\MENU_EVENT_RECORD.ahk
#Include .\FOCUS_EVENT_RECORD.ahk

/**
 * @namespace Windows.Win32.System.Console
 * @version v4.0.30319
 */
class INPUT_RECORD extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
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
     * @type {MENU_EVENT_RECORD}
     */
    MenuEvent{
        get {
            if(!this.HasProp("__MenuEvent"))
                this.__MenuEvent := MENU_EVENT_RECORD(this.ptr + 8)
            return this.__MenuEvent
        }
    }

    /**
     * @type {FOCUS_EVENT_RECORD}
     */
    FocusEvent{
        get {
            if(!this.HasProp("__FocusEvent"))
                this.__FocusEvent := FOCUS_EVENT_RECORD(this.ptr + 8)
            return this.__FocusEvent
        }
    }
}
