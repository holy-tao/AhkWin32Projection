#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class CONSTRAINT_CONFLICT_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CCR_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static CCR_COLLISION => 1

    /**
     * @type {Integer (Int32)}
     */
    static CCR_NOPARENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CCR_IDENTITY => 3
}
