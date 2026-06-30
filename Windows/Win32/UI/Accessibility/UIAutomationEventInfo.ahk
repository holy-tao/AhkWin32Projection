#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a custom event.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiautomationeventinfo
 * @namespace Windows.Win32.UI.Accessibility
 */
class UIAutomationEventInfo extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * The event identifier.
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(0, this)
            return this.__guid
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The programmatic name of the event (a non-localizable string).
     * @type {PWSTR}
     */
    pProgrammaticName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
