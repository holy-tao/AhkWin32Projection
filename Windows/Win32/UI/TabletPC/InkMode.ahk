#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the collection mode for drawn ink-whether ink collection is disabled, ink is collected, or ink and gestures are collected.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-inkmode
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct InkMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Ink collection is disabled. No strokes are created when in this mode.
     * @type {Integer (Int32)}
     */
    static IEM_Disabled => 0

    /**
     * Ink only is collected, creating a stroke.
     * @type {Integer (Int32)}
     */
    static IEM_Ink => 1

    /**
     * Default. Ink is collected and single-stroke gestures are accepted.
     * @type {Integer (Int32)}
     */
    static IEM_InkAndGesture => 2
}
