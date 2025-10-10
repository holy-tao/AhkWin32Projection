#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the visual feedback associated with an event.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ne-winuser-feedback_type
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class FEEDBACK_TYPE{

    /**
     * Feedback for a touch contact event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_TOUCH_CONTACTVISUALIZATION => 1

    /**
     * Feedback for a pen barrel-button event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_PEN_BARRELVISUALIZATION => 2

    /**
     * Feedback for a pen tap event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_PEN_TAP => 3

    /**
     * Feedback for a pen double-tap event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_PEN_DOUBLETAP => 4

    /**
     * Feedback for a pen press-and-hold event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_PEN_PRESSANDHOLD => 5

    /**
     * Feedback for a pen right-tap event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_PEN_RIGHTTAP => 6

    /**
     * Feedback for a touch tap event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_TOUCH_TAP => 7

    /**
     * Feedback for a touch double-tap event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_TOUCH_DOUBLETAP => 8

    /**
     * Feedback for a touch press-and-hold event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_TOUCH_PRESSANDHOLD => 9

    /**
     * Feedback for a touch right-tap event.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_TOUCH_RIGHTTAP => 10

    /**
     * Feedback for a press-and-tap gesture.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_GESTURE_PRESSANDTAP => 11

    /**
     * Do not use.
     * @type {Integer (Int32)}
     */
    static FEEDBACK_MAX => -1
}
