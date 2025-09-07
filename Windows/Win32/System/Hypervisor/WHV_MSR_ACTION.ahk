#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_MSR_ACTION{

    /**
     * @type {Integer (Int32)}
     */
    static WHvMsrActionArchitectureDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvMsrActionIgnoreWriteReadZero => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvMsrActionExit => 2
}
