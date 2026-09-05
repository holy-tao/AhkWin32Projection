#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsTouchAction extends Win32Enum {

    /**
     * Native name: styleMsTouchActionNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => -1

    /**
     * Native name: styleMsTouchActionNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: styleMsTouchActionAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleMsTouchActionManipulation
     * @type {Integer (Int32)}
     */
    static Manipulation => 2

    /**
     * Native name: styleMsTouchActionDoubleTapZoom
     * @type {Integer (Int32)}
     */
    static DoubleTapZoom => 4

    /**
     * Native name: styleMsTouchActionPanX
     * @type {Integer (Int32)}
     */
    static PanX => 8

    /**
     * Native name: styleMsTouchActionPanY
     * @type {Integer (Int32)}
     */
    static PanY => 16

    /**
     * Native name: styleMsTouchActionPinchZoom
     * @type {Integer (Int32)}
     */
    static PinchZoom => 32

    /**
     * Native name: styleMsTouchActionCrossSlideX
     * @type {Integer (Int32)}
     */
    static CrossSlideX => 64

    /**
     * Native name: styleMsTouchActionCrossSlideY
     * @type {Integer (Int32)}
     */
    static CrossSlideY => 128

    /**
     * Native name: styleMsTouchAction_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
