#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_ADVISE_GPA_RANGE_CODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvAdviseGpaRangeCodePopulate => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvAdviseGpaRangeCodePin => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvAdviseGpaRangeCodeUnpin => 2
}
