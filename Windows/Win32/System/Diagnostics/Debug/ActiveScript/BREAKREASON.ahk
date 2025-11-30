#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class BREAKREASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_STEP => 0

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_BREAKPOINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_DEBUGGER_BLOCK => 2

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_HOST_INITIATED => 3

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_LANGUAGE_INITIATED => 4

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_DEBUGGER_HALT => 5

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_ERROR => 6

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_JIT => 7

    /**
     * @type {Integer (Int32)}
     */
    static BREAKREASON_MUTATION_BREAKPOINT => 8
}
