#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains possible values for the CoalesceEvents property, which indicates whether an accessible technology client receives all events, or a subset where duplicate events are detected and filtered.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-coalesceeventsoptions
 * @namespace Windows.Win32.UI.Accessibility
 */
class CoalesceEventsOptions extends Win32Enum {

    /**
     * Event coalescing is disabled.
     * Native name: CoalesceEventsOptions_Disabled
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Event coalescing is enabled.
     * Native name: CoalesceEventsOptions_Enabled
     * @type {Integer (Int32)}
     */
    static Enabled => 1
}
