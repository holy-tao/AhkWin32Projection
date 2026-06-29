#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\UI_EVENTLOCATION.ahk" { UI_EVENTLOCATION }

/**
 * Contains information about a Command associated with a event.
 * @remarks
 * The Command identified by <b>CommandID</b> and <b>CommandName</b> depend upon which event has occurred:  for a <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventtype">UI_EVENTTYPE_TabActivated</a> event, they identify the tab; for a <b>UI_EVENTTYPE_MenuOpened</b> event, they identify the menu; for <b>UI_EVENTTYPE_CommandExecuted</b> events, they identify the command being executed; and for <b>UI_EVENTTYPE_TooltipShown</b> events, they identify the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> that owns that tooltip.
 * 
 * 
 * 
 * <b>ParentCommandID</b> and <b>ParentCommandName</b>  identify the parent command (if any) of the command associated with this event.  If there is no parent, then <b>ParentCommandID</b> is zero and <b>ParentCommandName</b> is an empty string.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/ns-uiribbon-ui_eventparams_command
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct UI_EVENTPARAMS_COMMAND {
    #StructPack 8

    /**
     * The ID of the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> directly related to the event, which is specified in the markup resource file.
     */
    CommandID : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> name that is associated with <b>CommandId</b>.
     */
    CommandName : PWSTR

    /**
     * The ID for the parent of the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a>, which is specified in the markup resource file.
     */
    ParentCommandID : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> name  of the parent that is associated with <b>CommandId</b>.
     */
    ParentCommandName : PWSTR

    /**
     * <b>SelectionIndex</b> is used only when a <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventtype">UI_EVENTTYPE_CommandExecuted</a> has been fired in response to the user selecting an item within a <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-combobox">ComboBox</a> or item gallery.  In those cases, <b>SelectionIndex</b> contains the index of the selected item.  In all other cases, it is set to 0.
     */
    SelectionIndex : UInt32

    /**
     * One of the values from <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventlocation">UI_EVENTLOCATION</a>.
     */
    Location : UI_EVENTLOCATION

}
