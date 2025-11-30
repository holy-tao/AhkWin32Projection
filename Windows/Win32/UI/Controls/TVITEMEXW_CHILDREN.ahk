#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TVITEMEXW_CHILDREN extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static I_ZERO => 0

    /**
     * @type {Integer (Int32)}
     */
    static I_ONE_OR_MORE => 1

    /**
     * @type {Integer (Int32)}
     */
    static I_CHILDRENCALLBACK => -1

    /**
     * @type {Integer (Int32)}
     */
    static I_CHILDRENAUTO => -2
}
