#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines gestures recognized by Direct Manipulation.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/ne-directmanipulation-directmanipulation_interaction_type
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_INTERACTION_TYPE{

    /**
     * Marks the beginning of an interaction.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INTERACTION_BEGIN => 0

    /**
     * A compound gesture that supports translation, rotation and scaling.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INTERACTION_TYPE_MANIPULATION => 1

    /**
     * A tap gesture.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_TAP => 2

    /**
     * A hold gesture.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_HOLD => 3

    /**
     * Select or move through slide or swipe gestures.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_CROSS_SLIDE => 4

    /**
     * A zoom gesture.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INTERACTION_TYPE_GESTURE_PINCH_ZOOM => 5

    /**
     * Marks the end of an interaction.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INTERACTION_END => 100
}
