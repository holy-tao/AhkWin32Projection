#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_DISEQC_COMMAND extends Win32Enum {

    /**
     * Native name: KSPROPERTY_BDA_DISEQC_ENABLE
     * @type {Integer (Int32)}
     */
    static ENABLE => 0

    /**
     * Native name: KSPROPERTY_BDA_DISEQC_LNB_SOURCE
     * @type {Integer (Int32)}
     */
    static LNB_SOURCE => 1

    /**
     * Native name: KSPROPERTY_BDA_DISEQC_USETONEBURST
     * @type {Integer (Int32)}
     */
    static USETONEBURST => 2

    /**
     * Native name: KSPROPERTY_BDA_DISEQC_REPEATS
     * @type {Integer (Int32)}
     */
    static REPEATS => 3

    /**
     * Native name: KSPROPERTY_BDA_DISEQC_SEND
     * @type {Integer (Int32)}
     */
    static SEND => 4

    /**
     * Native name: KSPROPERTY_BDA_DISEQC_RESPONSE
     * @type {Integer (Int32)}
     */
    static RESPONSE => 5
}
