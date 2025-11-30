#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSPROPERTY_BDA_LNB_INFO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_LNB_LOF_LOW_BAND => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_LNB_LOF_HIGH_BAND => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_LNB_SWITCH_FREQUENCY => 2
}
