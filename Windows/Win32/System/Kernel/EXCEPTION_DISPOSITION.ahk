#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 */
class EXCEPTION_DISPOSITION extends Win32Enum {

    /**
     * Native name: ExceptionContinueExecution
     * @type {Integer (Int32)}
     */
    static ContinueExecution => 0

    /**
     * Native name: ExceptionContinueSearch
     * @type {Integer (Int32)}
     */
    static ContinueSearch => 1

    /**
     * Native name: ExceptionNestedException
     * @type {Integer (Int32)}
     */
    static NestedException => 2

    /**
     * Native name: ExceptionCollidedUnwind
     * @type {Integer (Int32)}
     */
    static CollidedUnwind => 3
}
