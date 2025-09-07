#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains possible values for the CoalesceEvents property, which indicates whether an accessible technology client receives all events, or a subset where duplicate events are detected and filtered.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-coalesceeventsoptions
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class CoalesceEventsOptions{

    /**
     * Event coalescing is disabled.
     * @type {Integer (Int32)}
     */
    static CoalesceEventsOptions_Disabled => 0

    /**
     * Event coalescing is enabled.
     * @type {Integer (Int32)}
     */
    static CoalesceEventsOptions_Enabled => 1
}
