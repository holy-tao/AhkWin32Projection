#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class EXCEPTION_DISPOSITION{

    /**
     * @type {Integer (Int32)}
     */
    static ExceptionContinueExecution => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExceptionContinueSearch => 1

    /**
     * @type {Integer (Int32)}
     */
    static ExceptionNestedException => 2

    /**
     * @type {Integer (Int32)}
     */
    static ExceptionCollidedUnwind => 3
}
