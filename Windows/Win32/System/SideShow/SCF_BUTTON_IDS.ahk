#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class SCF_BUTTON_IDS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_MENU => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_SELECT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_UP => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_DOWN => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_LEFT => 5

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_RIGHT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_PLAY => 7

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_PAUSE => 8

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_FASTFORWARD => 9

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_REWIND => 10

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_STOP => 11

    /**
     * @type {Integer (Int32)}
     */
    static SCF_BUTTON_BACK => 65280
}
