#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EPolicyAction extends Win32Enum {

    /**
     * Native name: eNoAction
     * @type {Integer (Int32)}
     */
    static NoAction => 0

    /**
     * Native name: eThrowException
     * @type {Integer (Int32)}
     */
    static ThrowException => 1

    /**
     * Native name: eAbortThread
     * @type {Integer (Int32)}
     */
    static AbortThread => 2

    /**
     * Native name: eRudeAbortThread
     * @type {Integer (Int32)}
     */
    static RudeAbortThread => 3

    /**
     * Native name: eUnloadAppDomain
     * @type {Integer (Int32)}
     */
    static UnloadAppDomain => 4

    /**
     * Native name: eRudeUnloadAppDomain
     * @type {Integer (Int32)}
     */
    static RudeUnloadAppDomain => 5

    /**
     * Native name: eExitProcess
     * @type {Integer (Int32)}
     */
    static ExitProcess => 6

    /**
     * Native name: eFastExitProcess
     * @type {Integer (Int32)}
     */
    static FastExitProcess => 7

    /**
     * Native name: eRudeExitProcess
     * @type {Integer (Int32)}
     */
    static RudeExitProcess => 8

    /**
     * Native name: eDisableRuntime
     * @type {Integer (Int32)}
     */
    static DisableRuntime => 9

    /**
     * @type {Integer (Int32)}
     */
    static MaxPolicyAction => 10
}
