#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the Direct Manipulation motion type.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/ne-directmanipulation-directmanipulation_motion_types
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_MOTION_TYPES extends Win32BitflagEnum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_NONE => 0

    /**
     * Translation in the horizontal axis.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_TRANSLATEX => 1

    /**
     * Translation in the vertical axis.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_TRANSLATEY => 2

    /**
     * Zoom.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_ZOOM => 4

    /**
     * The horizontal center of the manipulation.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_CENTERX => 16

    /**
     * The vertical center of the manipulation.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_CENTERY => 32

    /**
     * All manipulation motion.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_MOTION_ALL => 55
}
