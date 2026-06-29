#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a tablet system event.
 * @see https://learn.microsoft.com/windows/win32/api/tpcshrd/ns-tpcshrd-system_event_data
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct SYSTEM_EVENT_DATA {
    #StructPack 4

    /**
     * Bit values for the modifiers. Possible values include SE_MODIFIER_CTRL (the Control key was pressed), SE_MODIFIER_ALT (the Alt key was pressed), and SE_MODIFIER_SHIFT (the Shift key was pressed).
     */
    bModifier : Int8

    /**
     * Scan code for the keyboard character.
     */
    wKey : Int8

    /**
     * X position of the event.
     */
    xPos : Int32

    /**
     * Y position of the event.
     */
    yPos : Int32

    /**
     * The type of cursor that caused the event. Possible values include SE_NORMAL_CURSOR (the pen tip) and SE_ERASER_CURSOR (the eraser).
     */
    bCursorMode : Int8

    /**
     * State of the buttons at the time of the system event.
     */
    dwButtonState : UInt32

}
