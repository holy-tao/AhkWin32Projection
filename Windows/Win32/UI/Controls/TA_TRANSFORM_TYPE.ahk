#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TA_TRANSFORM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TATT_TRANSLATE_2D => 0

    /**
     * @type {Integer (Int32)}
     */
    static TATT_SCALE_2D => 1

    /**
     * @type {Integer (Int32)}
     */
    static TATT_OPACITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static TATT_CLIP => 3
}
