#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class BREAKRESUMEACTION extends Win32Enum {

    /**
     * Native name: BREAKRESUMEACTION_ABORT
     * @type {Integer (Int32)}
     */
    static ABORT => 0

    /**
     * Native name: BREAKRESUMEACTION_CONTINUE
     * @type {Integer (Int32)}
     */
    static CONTINUE => 1

    /**
     * Native name: BREAKRESUMEACTION_STEP_INTO
     * @type {Integer (Int32)}
     */
    static STEP_INTO => 2

    /**
     * Native name: BREAKRESUMEACTION_STEP_OVER
     * @type {Integer (Int32)}
     */
    static STEP_OVER => 3

    /**
     * Native name: BREAKRESUMEACTION_STEP_OUT
     * @type {Integer (Int32)}
     */
    static STEP_OUT => 4

    /**
     * Native name: BREAKRESUMEACTION_IGNORE
     * @type {Integer (Int32)}
     */
    static IGNORE => 5

    /**
     * Native name: BREAKRESUMEACTION_STEP_DOCUMENT
     * @type {Integer (Int32)}
     */
    static STEP_DOCUMENT => 6
}
