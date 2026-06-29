#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about a custom event.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiautomationeventinfo
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UIAutomationEventInfo {
    #StructPack 8

    /**
     * Type: <b>GUID</b>
     * 
     * The event identifier.
     */
    guid : Guid

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The programmatic name of the event (a non-localizable string).
     */
    pProgrammaticName : PWSTR

}
