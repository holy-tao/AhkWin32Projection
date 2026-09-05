#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class QualityMode extends Win32Enum {

    /**
     * Native name: QualityModeInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => -1

    /**
     * Native name: QualityModeDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: QualityModeLow
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * Native name: QualityModeHigh
     * @type {Integer (Int32)}
     */
    static High => 2
}
