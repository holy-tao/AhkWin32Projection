#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the type of synchronized input.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct SynchronizedInputType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A key has been released.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_KeyUp => 1

    /**
     * A key has been pressed.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_KeyDown => 2

    /**
     * The left mouse button has been released.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_LeftMouseUp => 4

    /**
     * The left mouse button has been pressed.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_LeftMouseDown => 8

    /**
     * The right mouse button has been released.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_RightMouseUp => 16

    /**
     * The right mouse button has been pressed.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_RightMouseDown => 32
}
