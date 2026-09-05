#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 */
class SCF_BUTTON_IDS extends Win32Enum {

    /**
     * Native name: SCF_BUTTON_MENU
     * @type {Integer (Int32)}
     */
    static MENU => 1

    /**
     * Native name: SCF_BUTTON_SELECT
     * @type {Integer (Int32)}
     */
    static SELECT => 2

    /**
     * Native name: SCF_BUTTON_UP
     * @type {Integer (Int32)}
     */
    static UP => 3

    /**
     * Native name: SCF_BUTTON_DOWN
     * @type {Integer (Int32)}
     */
    static DOWN => 4

    /**
     * Native name: SCF_BUTTON_LEFT
     * @type {Integer (Int32)}
     */
    static LEFT => 5

    /**
     * Native name: SCF_BUTTON_RIGHT
     * @type {Integer (Int32)}
     */
    static RIGHT => 6

    /**
     * Native name: SCF_BUTTON_PLAY
     * @type {Integer (Int32)}
     */
    static PLAY => 7

    /**
     * Native name: SCF_BUTTON_PAUSE
     * @type {Integer (Int32)}
     */
    static PAUSE => 8

    /**
     * Native name: SCF_BUTTON_FASTFORWARD
     * @type {Integer (Int32)}
     */
    static FASTFORWARD => 9

    /**
     * Native name: SCF_BUTTON_REWIND
     * @type {Integer (Int32)}
     */
    static REWIND => 10

    /**
     * Native name: SCF_BUTTON_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 11

    /**
     * Native name: SCF_BUTTON_BACK
     * @type {Integer (Int32)}
     */
    static BACK => 65280
}
