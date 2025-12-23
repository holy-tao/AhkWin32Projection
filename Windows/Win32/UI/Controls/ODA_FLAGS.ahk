#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class ODA_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ODA_DRAWENTIRE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ODA_SELECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ODA_FOCUS => 4
}
