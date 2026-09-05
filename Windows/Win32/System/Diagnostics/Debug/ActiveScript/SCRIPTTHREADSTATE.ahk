#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class SCRIPTTHREADSTATE extends Win32Enum {

    /**
     * Native name: SCRIPTTHREADSTATE_NOTINSCRIPT
     * @type {Integer (Int32)}
     */
    static NOTINSCRIPT => 0

    /**
     * Native name: SCRIPTTHREADSTATE_RUNNING
     * @type {Integer (Int32)}
     */
    static RUNNING => 1
}
