#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class EClrFailure extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_NonCriticalResource => 0

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_CriticalResource => 1

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_FatalRuntime => 2

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_OrphanedLock => 3

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_StackOverflow => 4

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_AccessViolation => 5

    /**
     * @type {Integer (Int32)}
     */
    static FAIL_CodeContract => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxClrFailure => 7
}
