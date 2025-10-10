#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UI_EVENTPARAMS_COMMAND.ahk

/**
 * Contains information about a Ribbon event.
 * @remarks
 * 
  * For top-level events (application menu opened/closed, ribbon minimized/expanded/pinned), <b>Modes</b> is present but set to zero (and can be ignored by the application).
  * 
  * 
  * 
  * For the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventtype">UI_EVENTTYPE_ApplicationModeSwitched</a> event,  <b>Modes</b> specifies which modes have been set.  (This is the same integer value that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-setmodes">SetModes</a> to switch modes in the first place.)
  * 
  * 
  * 
  * For all other events, <b>Params</b> contains additional data about the event.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ns-uiribbon-ui_eventparams
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_EVENTPARAMS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * One of the values from <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventtype">UI_EVENTTYPE</a>.
     * @type {Integer}
     */
    EventType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Modes {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {UI_EVENTPARAMS_COMMAND}
     */
    Params{
        get {
            if(!this.HasProp("__Params"))
                this.__Params := UI_EVENTPARAMS_COMMAND(this.ptr + 8)
            return this.__Params
        }
    }
}
