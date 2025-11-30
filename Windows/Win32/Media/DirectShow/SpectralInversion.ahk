#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class SpectralInversion extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_AUTOMATIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_NORMAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_INVERTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_SPECTRAL_INVERSION_MAX => 4
}
