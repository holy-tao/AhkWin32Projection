#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class BREAKREASON extends Win32Enum {

    /**
     * Native name: BREAKREASON_STEP
     * @type {Integer (Int32)}
     */
    static STEP => 0

    /**
     * Native name: BREAKREASON_BREAKPOINT
     * @type {Integer (Int32)}
     */
    static BREAKPOINT => 1

    /**
     * Native name: BREAKREASON_DEBUGGER_BLOCK
     * @type {Integer (Int32)}
     */
    static DEBUGGER_BLOCK => 2

    /**
     * Native name: BREAKREASON_HOST_INITIATED
     * @type {Integer (Int32)}
     */
    static HOST_INITIATED => 3

    /**
     * Native name: BREAKREASON_LANGUAGE_INITIATED
     * @type {Integer (Int32)}
     */
    static LANGUAGE_INITIATED => 4

    /**
     * Native name: BREAKREASON_DEBUGGER_HALT
     * @type {Integer (Int32)}
     */
    static DEBUGGER_HALT => 5

    /**
     * Native name: BREAKREASON_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 6

    /**
     * Native name: BREAKREASON_JIT
     * @type {Integer (Int32)}
     */
    static JIT => 7

    /**
     * Native name: BREAKREASON_MUTATION_BREAKPOINT
     * @type {Integer (Int32)}
     */
    static MUTATION_BREAKPOINT => 8
}
