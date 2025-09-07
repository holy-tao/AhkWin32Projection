#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a tablet system event.
 * @see https://learn.microsoft.com/windows/win32/api/tpcshrd/ns-tpcshrd-system_event_data
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class SYSTEM_EVENT_DATA extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Bit values for the modifiers. Possible values include SE_MODIFIER_CTRL (the Control key was pressed), SE_MODIFIER_ALT (the Alt key was pressed), and SE_MODIFIER_SHIFT (the Shift key was pressed).
     * @type {Integer}
     */
    bModifier {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Scan code for the keyboard character.
     * @type {Integer}
     */
    wKey {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * X position of the event.
     * @type {Integer}
     */
    xPos {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Y position of the event.
     * @type {Integer}
     */
    yPos {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The type of cursor that caused the event. Possible values include SE_NORMAL_CURSOR (the pen tip) and SE_ERASER_CURSOR (the eraser).
     * @type {Integer}
     */
    bCursorMode {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * State of the buttons at the time of the system event.
     * @type {Integer}
     */
    dwButtonState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
