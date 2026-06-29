#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the orientation of a control.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-orientationtype
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct OrientationType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The control has no orientation.
     * @type {Integer (Int32)}
     */
    static OrientationType_None => 0

    /**
     * The control has horizontal orientation.
     * @type {Integer (Int32)}
     */
    static OrientationType_Horizontal => 1

    /**
     * The control has vertical orientation.
     * @type {Integer (Int32)}
     */
    static OrientationType_Vertical => 2
}
