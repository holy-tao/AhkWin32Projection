#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncH263VProfile extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_Base => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_CompatibilityV2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_CompatibilityV1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_WirelessV2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_WirelessV3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_HighCompression => 5

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_Internet => 6

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_Interlace => 7

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncH263VProfile_HighLatency => 8
}
