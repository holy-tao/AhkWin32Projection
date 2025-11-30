#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class SCROLLBARPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SBP_ARROWBTN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SBP_THUMBBTNHORZ => 2

    /**
     * @type {Integer (Int32)}
     */
    static SBP_THUMBBTNVERT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SBP_LOWERTRACKHORZ => 4

    /**
     * @type {Integer (Int32)}
     */
    static SBP_UPPERTRACKHORZ => 5

    /**
     * @type {Integer (Int32)}
     */
    static SBP_LOWERTRACKVERT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SBP_UPPERTRACKVERT => 7

    /**
     * @type {Integer (Int32)}
     */
    static SBP_GRIPPERHORZ => 8

    /**
     * @type {Integer (Int32)}
     */
    static SBP_GRIPPERVERT => 9

    /**
     * @type {Integer (Int32)}
     */
    static SBP_SIZEBOX => 10

    /**
     * @type {Integer (Int32)}
     */
    static SBP_SIZEBOXBKGND => 11
}
