#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class BDCB_CLASSIFICATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BdCbClassificationUnknownImage => 0

    /**
     * @type {Integer (Int32)}
     */
    static BdCbClassificationKnownGoodImage => 1

    /**
     * @type {Integer (Int32)}
     */
    static BdCbClassificationKnownBadImage => 2

    /**
     * @type {Integer (Int32)}
     */
    static BdCbClassificationKnownBadImageBootCritical => 3

    /**
     * @type {Integer (Int32)}
     */
    static BdCbClassificationEnd => 4
}
