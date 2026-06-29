#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the gestures that can be passed to SetManualGesture.
 * @remarks
 * By default, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> always reassigns tap and press-and-hold gestures to the application. 
 * 
 * 
 * Use <b>DIRECTMANIPULATION_GESTURE_PINCH_ZOOM</b> to zoom instead of scale.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_gesture_configuration
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct DIRECTMANIPULATION_GESTURE_CONFIGURATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No gestures are defined.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_GESTURE_NONE => 0

    /**
     * Only default gestures are supported. This is the default value.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_GESTURE_DEFAULT => 0

    /**
     * Vertical slide and swipe gestures are supported through the cross-slide interaction. For more information, see <a href="https://docs.microsoft.com/windows/uwp/input-and-devices/guidelines-for-cross-slide">Guidelines for cross-slide</a>.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_VERTICAL => 8

    /**
     * Horizontal slide and swipe gestures are supported through the cross-slide interaction. For more information, see <a href="https://docs.microsoft.com/windows/uwp/input-and-devices/guidelines-for-cross-slide">Guidelines for cross-slide</a>.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_HORIZONTAL => 16

    /**
     * Pinch and stretch gestures for zooming.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_GESTURE_PINCH_ZOOM => 32
}
