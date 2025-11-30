#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MM_SYSTEMSIZE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MmSmallSystem => 0

    /**
     * @type {Integer (Int32)}
     */
    static MmMediumSystem => 1

    /**
     * @type {Integer (Int32)}
     */
    static MmLargeSystem => 2
}
