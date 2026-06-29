#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains possible values for the CoalesceEvents property, which indicates whether an accessible technology client receives all events, or a subset where duplicate events are detected and filtered.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-coalesceeventsoptions
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct CoalesceEventsOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
