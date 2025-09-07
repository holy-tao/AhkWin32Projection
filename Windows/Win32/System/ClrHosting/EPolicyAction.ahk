#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class EPolicyAction{

    /**
     * @type {Integer (Int32)}
     */
    static eNoAction => 0

    /**
     * @type {Integer (Int32)}
     */
    static eThrowException => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAbortThread => 2

    /**
     * @type {Integer (Int32)}
     */
    static eRudeAbortThread => 3

    /**
     * @type {Integer (Int32)}
     */
    static eUnloadAppDomain => 4

    /**
     * @type {Integer (Int32)}
     */
    static eRudeUnloadAppDomain => 5

    /**
     * @type {Integer (Int32)}
     */
    static eExitProcess => 6

    /**
     * @type {Integer (Int32)}
     */
    static eFastExitProcess => 7

    /**
     * @type {Integer (Int32)}
     */
    static eRudeExitProcess => 8

    /**
     * @type {Integer (Int32)}
     */
    static eDisableRuntime => 9

    /**
     * @type {Integer (Int32)}
     */
    static MaxPolicyAction => 10
}
