#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class MM_SYSTEMSIZE extends Win32Enum {

    /**
     * Native name: MmSmallSystem
     * @type {Integer (Int32)}
     */
    static SmallSystem => 0

    /**
     * Native name: MmMediumSystem
     * @type {Integer (Int32)}
     */
    static MediumSystem => 1

    /**
     * Native name: MmLargeSystem
     * @type {Integer (Int32)}
     */
    static LargeSystem => 2
}
