#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * These flags are associated with certain PROPVARIANT structure comparisons.
 * @see https://docs.microsoft.com/windows/win32/api//propvarutil/ne-propvarutil-propvar_compare_unit
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class PROPVAR_COMPARE_UNIT extends Win32Enum{

    /**
     * The default unit.
     * @type {Integer (Int32)}
     */
    static PVCU_DEFAULT => 0

    /**
     * The second comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_SECOND => 1

    /**
     * The minute comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_MINUTE => 2

    /**
     * The hour comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_HOUR => 3

    /**
     * The day comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_DAY => 4

    /**
     * The month comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_MONTH => 5

    /**
     * The year comparison unit.
     * @type {Integer (Int32)}
     */
    static PVCU_YEAR => 6
}
