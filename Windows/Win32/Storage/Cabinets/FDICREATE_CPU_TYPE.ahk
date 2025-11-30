#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class FDICREATE_CPU_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static cpuUNKNOWN => -1

    /**
     * @type {Integer (Int32)}
     */
    static cpu80286 => 0

    /**
     * @type {Integer (Int32)}
     */
    static cpu80386 => 1
}
