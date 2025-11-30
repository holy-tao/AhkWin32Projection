#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KDPC_IMPORTANCE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LowImportance => 0

    /**
     * @type {Integer (Int32)}
     */
    static MediumImportance => 1

    /**
     * @type {Integer (Int32)}
     */
    static HighImportance => 2

    /**
     * @type {Integer (Int32)}
     */
    static MediumHighImportance => 3
}
