#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSPROPERTY_BDA_PIDFILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_PIDFILTER_MAP_PIDS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_PIDFILTER_UNMAP_PIDS => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_PIDFILTER_LIST_PIDS => 2
}
