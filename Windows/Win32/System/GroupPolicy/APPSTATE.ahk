#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class APPSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ABSENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static ASSIGNED => 1

    /**
     * @type {Integer (Int32)}
     */
    static PUBLISHED => 2
}
