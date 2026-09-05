#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class BOUND_CALLBACK_STATUS extends Win32Enum {

    /**
     * Native name: BoundExceptionContinueSearch
     * @type {Integer (Int32)}
     */
    static ExceptionContinueSearch => 0

    /**
     * Native name: BoundExceptionHandled
     * @type {Integer (Int32)}
     */
    static ExceptionHandled => 1

    /**
     * Native name: BoundExceptionError
     * @type {Integer (Int32)}
     */
    static ExceptionError => 2

    /**
     * Native name: BoundExceptionMaximum
     * @type {Integer (Int32)}
     */
    static ExceptionMaximum => 3
}
