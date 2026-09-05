#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_LNB_INFO extends Win32Enum {

    /**
     * Native name: KSPROPERTY_BDA_LNB_LOF_LOW_BAND
     * @type {Integer (Int32)}
     */
    static LOF_LOW_BAND => 0

    /**
     * Native name: KSPROPERTY_BDA_LNB_LOF_HIGH_BAND
     * @type {Integer (Int32)}
     */
    static LOF_HIGH_BAND => 1

    /**
     * Native name: KSPROPERTY_BDA_LNB_SWITCH_FREQUENCY
     * @type {Integer (Int32)}
     */
    static SWITCH_FREQUENCY => 2
}
