#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KEY_EVENT_RECORD.ahk
#Include .\COORD.ahk
#Include .\MOUSE_EVENT_RECORD.ahk
#Include .\WINDOW_BUFFER_SIZE_RECORD.ahk

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
