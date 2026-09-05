#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlComponent extends Win32Enum {

    /**
     * Native name: htmlComponentClient
     * @type {Integer (Int32)}
     */
    static Client => 0

    /**
     * Native name: htmlComponentSbLeft
     * @type {Integer (Int32)}
     */
    static SbLeft => 1

    /**
     * Native name: htmlComponentSbPageLeft
     * @type {Integer (Int32)}
     */
    static SbPageLeft => 2

    /**
     * Native name: htmlComponentSbHThumb
     * @type {Integer (Int32)}
     */
    static SbHThumb => 3

    /**
     * Native name: htmlComponentSbPageRight
     * @type {Integer (Int32)}
     */
    static SbPageRight => 4

    /**
     * Native name: htmlComponentSbRight
     * @type {Integer (Int32)}
     */
    static SbRight => 5

    /**
     * Native name: htmlComponentSbUp
     * @type {Integer (Int32)}
     */
    static SbUp => 6

    /**
     * Native name: htmlComponentSbPageUp
     * @type {Integer (Int32)}
     */
    static SbPageUp => 7

    /**
     * Native name: htmlComponentSbVThumb
     * @type {Integer (Int32)}
     */
    static SbVThumb => 8

    /**
     * Native name: htmlComponentSbPageDown
     * @type {Integer (Int32)}
     */
    static SbPageDown => 9

    /**
     * Native name: htmlComponentSbDown
     * @type {Integer (Int32)}
     */
    static SbDown => 10

    /**
     * Native name: htmlComponentSbLeft2
     * @type {Integer (Int32)}
     */
    static SbLeft2 => 11

    /**
     * Native name: htmlComponentSbPageLeft2
     * @type {Integer (Int32)}
     */
    static SbPageLeft2 => 12

    /**
     * Native name: htmlComponentSbRight2
     * @type {Integer (Int32)}
     */
    static SbRight2 => 13

    /**
     * Native name: htmlComponentSbPageRight2
     * @type {Integer (Int32)}
     */
    static SbPageRight2 => 14

    /**
     * Native name: htmlComponentSbUp2
     * @type {Integer (Int32)}
     */
    static SbUp2 => 15

    /**
     * Native name: htmlComponentSbPageUp2
     * @type {Integer (Int32)}
     */
    static SbPageUp2 => 16

    /**
     * Native name: htmlComponentSbDown2
     * @type {Integer (Int32)}
     */
    static SbDown2 => 17

    /**
     * Native name: htmlComponentSbPageDown2
     * @type {Integer (Int32)}
     */
    static SbPageDown2 => 18

    /**
     * Native name: htmlComponentSbTop
     * @type {Integer (Int32)}
     */
    static SbTop => 19

    /**
     * Native name: htmlComponentSbBottom
     * @type {Integer (Int32)}
     */
    static SbBottom => 20

    /**
     * Native name: htmlComponentOutside
     * @type {Integer (Int32)}
     */
    static Outside => 21

    /**
     * Native name: htmlComponentGHTopLeft
     * @type {Integer (Int32)}
     */
    static ComponentGHTopLeft => 22

    /**
     * Native name: htmlComponentGHLeft
     * @type {Integer (Int32)}
     */
    static ComponentGHLeft => 23

    /**
     * Native name: htmlComponentGHTop
     * @type {Integer (Int32)}
     */
    static ComponentGHTop => 24

    /**
     * Native name: htmlComponentGHBottomLeft
     * @type {Integer (Int32)}
     */
    static ComponentGHBottomLeft => 25

    /**
     * Native name: htmlComponentGHTopRight
     * @type {Integer (Int32)}
     */
    static ComponentGHTopRight => 26

    /**
     * Native name: htmlComponentGHBottom
     * @type {Integer (Int32)}
     */
    static ComponentGHBottom => 27

    /**
     * Native name: htmlComponentGHRight
     * @type {Integer (Int32)}
     */
    static ComponentGHRight => 28

    /**
     * Native name: htmlComponentGHBottomRight
     * @type {Integer (Int32)}
     */
    static ComponentGHBottomRight => 29

    /**
     * Native name: htmlComponent_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
