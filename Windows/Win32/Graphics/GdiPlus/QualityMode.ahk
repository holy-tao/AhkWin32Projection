#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class QualityMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static QualityModeInvalid => -1

    /**
     * @type {Integer (Int32)}
     */
    static QualityModeDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static QualityModeLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static QualityModeHigh => 2
}
