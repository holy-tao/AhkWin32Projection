#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class EFaultRepRetVal{

    /**
     * @type {Integer (Int32)}
     */
    static frrvOk => 0

    /**
     * @type {Integer (Int32)}
     */
    static frrvOkManifest => 1

    /**
     * @type {Integer (Int32)}
     */
    static frrvOkQueued => 2

    /**
     * @type {Integer (Int32)}
     */
    static frrvErr => 3

    /**
     * @type {Integer (Int32)}
     */
    static frrvErrNoDW => 4

    /**
     * @type {Integer (Int32)}
     */
    static frrvErrTimeout => 5

    /**
     * @type {Integer (Int32)}
     */
    static frrvLaunchDebugger => 6

    /**
     * @type {Integer (Int32)}
     */
    static frrvOkHeadless => 7

    /**
     * @type {Integer (Int32)}
     */
    static frrvErrAnotherInstance => 8

    /**
     * @type {Integer (Int32)}
     */
    static frrvErrNoMemory => 9

    /**
     * @type {Integer (Int32)}
     */
    static frrvErrDoubleFault => 10
}
