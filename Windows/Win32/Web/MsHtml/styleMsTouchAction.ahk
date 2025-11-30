#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleMsTouchAction extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionNotSet => -1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionManipulation => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionDoubleTapZoom => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionPanX => 8

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionPanY => 16

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionPinchZoom => 32

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionCrossSlideX => 64

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchActionCrossSlideY => 128

    /**
     * @type {Integer (Int32)}
     */
    static styleMsTouchAction_Max => 2147483647
}
