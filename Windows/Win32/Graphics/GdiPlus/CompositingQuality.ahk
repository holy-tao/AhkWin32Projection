#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class CompositingQuality extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CompositingQualityInvalid => -1

    /**
     * @type {Integer (Int32)}
     */
    static CompositingQualityDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static CompositingQualityHighSpeed => 1

    /**
     * @type {Integer (Int32)}
     */
    static CompositingQualityHighQuality => 2

    /**
     * @type {Integer (Int32)}
     */
    static CompositingQualityGammaCorrected => 3

    /**
     * @type {Integer (Int32)}
     */
    static CompositingQualityAssumeLinear => 4
}
