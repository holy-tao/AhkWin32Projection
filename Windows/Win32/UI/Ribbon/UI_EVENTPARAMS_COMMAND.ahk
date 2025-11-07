#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Command associated with a event.
 * @remarks
 * 
 *  The Command identified by <b>CommandID</b> and <b>CommandName</b> depend upon which event has occurred:  for a <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventtype">UI_EVENTTYPE_TabActivated</a> event, they identify the tab; for a <b>UI_EVENTTYPE_MenuOpened</b> event, they identify the menu; for <b>UI_EVENTTYPE_CommandExecuted</b> events, they identify the command being executed; and for <b>UI_EVENTTYPE_TooltipShown</b> events, they identify the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> that owns that tooltip.
 * 
 * 
 * 
 * <b>ParentCommandID</b> and <b>ParentCommandName</b>  identify the parent command (if any) of the command associated with this event.  If there is no parent, then <b>ParentCommandID</b> is zero and <b>ParentCommandName</b> is an empty string.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ns-uiribbon-ui_eventparams_command
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_EVENTPARAMS_COMMAND extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The ID of the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> directly related to the event, which is specified in the markup resource file.
     * @type {Integer}
     */
    CommandID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> name that is associated with <b>CommandId</b>.
     * @type {PWSTR}
     */
    CommandName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The ID for the parent of the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a>, which is specified in the markup resource file.
     * @type {Integer}
     */
    ParentCommandID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-command">Command</a> name  of the parent that is associated with <b>CommandId</b>.
     * @type {PWSTR}
     */
    ParentCommandName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * <b>SelectionIndex</b> is used only when a <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventtype">UI_EVENTTYPE_CommandExecuted</a> has been fired in response to the user selecting an item within a <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-combobox">ComboBox</a> or item gallery.  In those cases, <b>SelectionIndex</b> contains the index of the selected item.  In all other cases, it is set to 0.
     * @type {Integer}
     */
    SelectionIndex {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * One of the values from <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_eventlocation">UI_EVENTLOCATION</a>.
     * @type {Integer}
     */
    Location {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
