#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a custom event.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ns-uiautomationcore-uiautomationeventinfo
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UIAutomationEventInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * The event identifier.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The programmatic name of the event (a non-localizable string).
     * @type {Pointer<Char>}
     */
    pProgrammaticName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
