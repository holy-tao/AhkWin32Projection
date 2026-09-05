#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

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
class DIRECTMANIPULATION_GESTURE_CONFIGURATION extends Win32BitflagEnum {

    /**
     * No gestures are defined.
     * Native name: DIRECTMANIPULATION_GESTURE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Only default gestures are supported. This is the default value.
     * Native name: DIRECTMANIPULATION_GESTURE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Vertical slide and swipe gestures are supported through the cross-slide interaction. For more information, see <a href="https://docs.microsoft.com/windows/uwp/input-and-devices/guidelines-for-cross-slide">Guidelines for cross-slide</a>.
     * Native name: DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_VERTICAL
     * @type {Integer (Int32)}
     */
    static CROSS_SLIDE_VERTICAL => 8

    /**
     * Horizontal slide and swipe gestures are supported through the cross-slide interaction. For more information, see <a href="https://docs.microsoft.com/windows/uwp/input-and-devices/guidelines-for-cross-slide">Guidelines for cross-slide</a>.
     * Native name: DIRECTMANIPULATION_GESTURE_CROSS_SLIDE_HORIZONTAL
     * @type {Integer (Int32)}
     */
    static CROSS_SLIDE_HORIZONTAL => 16

    /**
     * Pinch and stretch gestures for zooming.
     * Native name: DIRECTMANIPULATION_GESTURE_PINCH_ZOOM
     * @type {Integer (Int32)}
     */
    static PINCH_ZOOM => 32
}
