#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class STATUSPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SP_PANE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SP_GRIPPERPANE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SP_GRIPPER => 3
}
