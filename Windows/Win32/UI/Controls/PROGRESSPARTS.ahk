#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROGRESSPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PP_BAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static PP_BARVERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static PP_CHUNK => 3

    /**
     * @type {Integer (Int32)}
     */
    static PP_CHUNKVERT => 4

    /**
     * @type {Integer (Int32)}
     */
    static PP_FILL => 5

    /**
     * @type {Integer (Int32)}
     */
    static PP_FILLVERT => 6

    /**
     * @type {Integer (Int32)}
     */
    static PP_PULSEOVERLAY => 7

    /**
     * @type {Integer (Int32)}
     */
    static PP_MOVEOVERLAY => 8

    /**
     * @type {Integer (Int32)}
     */
    static PP_PULSEOVERLAYVERT => 9

    /**
     * @type {Integer (Int32)}
     */
    static PP_MOVEOVERLAYVERT => 10

    /**
     * @type {Integer (Int32)}
     */
    static PP_TRANSPARENTBAR => 11

    /**
     * @type {Integer (Int32)}
     */
    static PP_TRANSPARENTBARVERT => 12
}
