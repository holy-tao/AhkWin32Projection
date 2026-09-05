#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSPROPERTY_BDA_PIDFILTER extends Win32Enum {

    /**
     * Native name: KSPROPERTY_BDA_PIDFILTER_MAP_PIDS
     * @type {Integer (Int32)}
     */
    static MAP_PIDS => 0

    /**
     * Native name: KSPROPERTY_BDA_PIDFILTER_UNMAP_PIDS
     * @type {Integer (Int32)}
     */
    static UNMAP_PIDS => 1

    /**
     * Native name: KSPROPERTY_BDA_PIDFILTER_LIST_PIDS
     * @type {Integer (Int32)}
     */
    static LIST_PIDS => 2
}
