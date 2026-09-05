#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class CompositingQuality extends Win32Enum {

    /**
     * Native name: CompositingQualityInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => -1

    /**
     * Native name: CompositingQualityDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: CompositingQualityHighSpeed
     * @type {Integer (Int32)}
     */
    static HighSpeed => 1

    /**
     * Native name: CompositingQualityHighQuality
     * @type {Integer (Int32)}
     */
    static HighQuality => 2

    /**
     * Native name: CompositingQualityGammaCorrected
     * @type {Integer (Int32)}
     */
    static GammaCorrected => 3

    /**
     * Native name: CompositingQualityAssumeLinear
     * @type {Integer (Int32)}
     */
    static AssumeLinear => 4
}
