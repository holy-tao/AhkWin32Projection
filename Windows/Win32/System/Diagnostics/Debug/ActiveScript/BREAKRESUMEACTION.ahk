#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class BREAKRESUMEACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_ABORT => 0

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_CONTINUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_STEP_INTO => 2

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_STEP_OVER => 3

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_STEP_OUT => 4

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_IGNORE => 5

    /**
     * @type {Integer (Int32)}
     */
    static BREAKRESUMEACTION_STEP_DOCUMENT => 6
}
