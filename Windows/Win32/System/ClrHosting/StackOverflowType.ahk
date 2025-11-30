#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class StackOverflowType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SO_Managed => 0

    /**
     * @type {Integer (Int32)}
     */
    static SO_ClrEngine => 1

    /**
     * @type {Integer (Int32)}
     */
    static SO_Other => 2
}
