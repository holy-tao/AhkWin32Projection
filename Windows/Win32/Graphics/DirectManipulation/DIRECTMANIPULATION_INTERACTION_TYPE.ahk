#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines gestures recognized by Direct Manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_interaction_type
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
class DIRECTMANIPULATION_INTERACTION_TYPE extends Win32Enum {

    /**
     * Marks the beginning of an interaction.
     * Native name: DIRECTMANIPULATION_INTERACTION_BEGIN
     * @type {Integer (Int32)}
     */
    static BEGIN => 0

    /**
     * A compound gesture that supports translation, rotation and scaling.
     * Native name: DIRECTMANIPULATION_INTERACTION_TYPE_MANIPULATION
     * @type {Integer (Int32)}
     */
    static MANIPULATION => 1

    /**
     * A tap gesture.
     * Native name: DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_TAP
     * @type {Integer (Int32)}
     */
    static GESTURE_TAP => 2

    /**
     * A hold gesture.
     * Native name: DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_HOLD
     * @type {Integer (Int32)}
     */
    static GESTURE_HOLD => 3

    /**
     * Select or move through slide or swipe gestures.
     * Native name: DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_CROSS_SLIDE
     * @type {Integer (Int32)}
     */
    static GESTURE_CROSS_SLIDE => 4

    /**
     * A zoom gesture.
     * Native name: DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_PINCH_ZOOM
     * @type {Integer (Int32)}
     */
    static GESTURE_PINCH_ZOOM => 5

    /**
     * Marks the end of an interaction.
     * Native name: DIRECTMANIPULATION_INTERACTION_END
     * @type {Integer (Int32)}
     */
    static END => 100
}
