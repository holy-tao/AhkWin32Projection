#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the visual feedback associated with an event.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-feedback_type
 * @namespace Windows.Win32.UI.Controls
 */
class FEEDBACK_TYPE extends Win32Enum {

    /**
     * Feedback for a touch contact event.
     * Native name: FEEDBACK_TOUCH_CONTACTVISUALIZATION
     * @type {Integer (Int32)}
     */
    static TOUCH_CONTACTVISUALIZATION => 1

    /**
     * Feedback for a pen barrel-button event.
     * Native name: FEEDBACK_PEN_BARRELVISUALIZATION
     * @type {Integer (Int32)}
     */
    static PEN_BARRELVISUALIZATION => 2

    /**
     * Feedback for a pen tap event.
     * Native name: FEEDBACK_PEN_TAP
     * @type {Integer (Int32)}
     */
    static PEN_TAP => 3

    /**
     * Feedback for a pen double-tap event.
     * Native name: FEEDBACK_PEN_DOUBLETAP
     * @type {Integer (Int32)}
     */
    static PEN_DOUBLETAP => 4

    /**
     * Feedback for a pen press-and-hold event.
     * Native name: FEEDBACK_PEN_PRESSANDHOLD
     * @type {Integer (Int32)}
     */
    static PEN_PRESSANDHOLD => 5

    /**
     * Feedback for a pen right-tap event.
     * Native name: FEEDBACK_PEN_RIGHTTAP
     * @type {Integer (Int32)}
     */
    static PEN_RIGHTTAP => 6

    /**
     * Feedback for a touch tap event.
     * Native name: FEEDBACK_TOUCH_TAP
     * @type {Integer (Int32)}
     */
    static TOUCH_TAP => 7

    /**
     * Feedback for a touch double-tap event.
     * Native name: FEEDBACK_TOUCH_DOUBLETAP
     * @type {Integer (Int32)}
     */
    static TOUCH_DOUBLETAP => 8

    /**
     * Feedback for a touch press-and-hold event.
     * Native name: FEEDBACK_TOUCH_PRESSANDHOLD
     * @type {Integer (Int32)}
     */
    static TOUCH_PRESSANDHOLD => 9

    /**
     * Feedback for a touch right-tap event.
     * Native name: FEEDBACK_TOUCH_RIGHTTAP
     * @type {Integer (Int32)}
     */
    static TOUCH_RIGHTTAP => 10

    /**
     * Feedback for a press-and-tap gesture.
     * Native name: FEEDBACK_GESTURE_PRESSANDTAP
     * @type {Integer (Int32)}
     */
    static GESTURE_PRESSANDTAP => 11

    /**
     * Do not use.
     * Native name: FEEDBACK_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}
