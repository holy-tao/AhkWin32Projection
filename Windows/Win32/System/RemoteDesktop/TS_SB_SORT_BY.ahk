#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies sort order. It is used as a parameter in the EnumerateTargets method.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/ne-sbtsv-ts_sb_sort_by
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class TS_SB_SORT_BY extends Win32Enum {

    /**
     * Do not sort.
     * Native name: TS_SB_SORT_BY_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Sort by target name.
     * Native name: TS_SB_SORT_BY_NAME
     * @type {Integer (Int32)}
     */
    static NAME => 1

    /**
     * Sort by a specified property.
     * Native name: TS_SB_SORT_BY_PROP
     * @type {Integer (Int32)}
     */
    static PROP => 2
}
