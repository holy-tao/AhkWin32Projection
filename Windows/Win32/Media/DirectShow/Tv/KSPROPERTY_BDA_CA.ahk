#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_CA extends Win32Enum {

    /**
     * Native name: KSPROPERTY_BDA_ECM_MAP_STATUS
     * @type {Integer (Int32)}
     */
    static ECM_MAP_STATUS => 0

    /**
     * Native name: KSPROPERTY_BDA_CA_MODULE_STATUS
     * @type {Integer (Int32)}
     */
    static MODULE_STATUS => 1

    /**
     * Native name: KSPROPERTY_BDA_CA_SMART_CARD_STATUS
     * @type {Integer (Int32)}
     */
    static SMART_CARD_STATUS => 2

    /**
     * Native name: KSPROPERTY_BDA_CA_MODULE_UI
     * @type {Integer (Int32)}
     */
    static MODULE_UI => 3

    /**
     * Native name: KSPROPERTY_BDA_CA_SET_PROGRAM_PIDS
     * @type {Integer (Int32)}
     */
    static SET_PROGRAM_PIDS => 4

    /**
     * Native name: KSPROPERTY_BDA_CA_REMOVE_PROGRAM
     * @type {Integer (Int32)}
     */
    static REMOVE_PROGRAM => 5
}
