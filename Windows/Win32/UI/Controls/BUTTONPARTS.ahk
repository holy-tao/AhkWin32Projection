#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BUTTONPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BP_PUSHBUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static BP_RADIOBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static BP_CHECKBOX => 3

    /**
     * @type {Integer (Int32)}
     */
    static BP_GROUPBOX => 4

    /**
     * @type {Integer (Int32)}
     */
    static BP_USERBUTTON => 5

    /**
     * @type {Integer (Int32)}
     */
    static BP_COMMANDLINK => 6

    /**
     * @type {Integer (Int32)}
     */
    static BP_COMMANDLINKGLYPH => 7

    /**
     * @type {Integer (Int32)}
     */
    static BP_RADIOBUTTON_HCDISABLED => 8

    /**
     * @type {Integer (Int32)}
     */
    static BP_CHECKBOX_HCDISABLED => 9

    /**
     * @type {Integer (Int32)}
     */
    static BP_GROUPBOX_HCDISABLED => 10

    /**
     * @type {Integer (Int32)}
     */
    static BP_PUSHBUTTONDROPDOWN => 11
}
