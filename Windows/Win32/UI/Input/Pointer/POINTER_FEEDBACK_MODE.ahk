#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the visual feedback behaviors available to CreateSyntheticPointerDevice.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-pointer_feedback_mode
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct POINTER_FEEDBACK_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Visual feedback might be suppressed by the user's pen (Settings -&gt; Devices -&gt; Pen &amp; Windows Ink) and touch (Settings -&gt; Ease of Access -&gt; Cursor &amp; pointer size) settings.
     * @type {Integer (Int32)}
     */
    static POINTER_FEEDBACK_DEFAULT => 1

    /**
     * Visual feedback overrides the user's pen and touch settings.
     * @type {Integer (Int32)}
     */
    static POINTER_FEEDBACK_INDIRECT => 2

    /**
     * Visual feedback is disabled.
     * @type {Integer (Int32)}
     */
    static POINTER_FEEDBACK_NONE => 3
}
