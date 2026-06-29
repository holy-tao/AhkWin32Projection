#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UI_EVENTPARAMS_COMMAND.ahk" { UI_EVENTPARAMS_COMMAND }
#Import ".\UI_EVENTLOCATION.ahk" { UI_EVENTLOCATION }
#Import ".\UI_EVENTTYPE.ahk" { UI_EVENTTYPE }

/**
 * Contains information about a Ribbon event.
 * @remarks
 * For top-level events (application menu opened/closed, ribbon minimized/expanded/pinned), <b>Modes</b> is present but set to zero (and can be ignored by the application).
 * 
 * 
 * 
 * For the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventtype">UI_EVENTTYPE_ApplicationModeSwitched</a> event,  <b>Modes</b> specifies which modes have been set.  (This is the same integer value that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-setmodes">SetModes</a> to switch modes in the first place.)
 * 
 * 
 * 
 * For all other events, <b>Params</b> contains additional data about the event.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ns-uiribbon-ui_eventparams
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_EVENTPARAMS {
    #StructPack 8

    /**
     * One of the values from <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventtype">UI_EVENTTYPE</a>.
     */
    EventType : UI_EVENTTYPE

    Modes : Int32

    static __New() {
        DefineProp(this.Prototype, 'Params', { type: UI_EVENTPARAMS_COMMAND, offset: 8 })
        this.DeleteProp("__New")
    }
}
