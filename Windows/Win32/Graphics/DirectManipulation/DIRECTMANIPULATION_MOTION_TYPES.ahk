#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the Direct Manipulation motion type.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_motion_types
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
class DIRECTMANIPULATION_MOTION_TYPES extends Win32BitflagEnum {

    /**
     * None.
     * Native name: DIRECTMANIPULATION_MOTION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Translation in the horizontal axis.
     * Native name: DIRECTMANIPULATION_MOTION_TRANSLATEX
     * @type {Integer (Int32)}
     */
    static TRANSLATEX => 1

    /**
     * Translation in the vertical axis.
     * Native name: DIRECTMANIPULATION_MOTION_TRANSLATEY
     * @type {Integer (Int32)}
     */
    static TRANSLATEY => 2

    /**
     * Zoom.
     * Native name: DIRECTMANIPULATION_MOTION_ZOOM
     * @type {Integer (Int32)}
     */
    static ZOOM => 4

    /**
     * The horizontal center of the manipulation.
     * Native name: DIRECTMANIPULATION_MOTION_CENTERX
     * @type {Integer (Int32)}
     */
    static CENTERX => 16

    /**
     * The vertical center of the manipulation.
     * Native name: DIRECTMANIPULATION_MOTION_CENTERY
     * @type {Integer (Int32)}
     */
    static CENTERY => 32

    /**
     * All manipulation motion.
     * Native name: DIRECTMANIPULATION_MOTION_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 55
}
