#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class KE_PROCESSOR_CHANGE_NOTIFY_STATE extends Win32Enum {

    /**
     * Native name: KeProcessorAddStartNotify
     * @type {Integer (Int32)}
     */
    static AddStartNotify => 0

    /**
     * Native name: KeProcessorAddCompleteNotify
     * @type {Integer (Int32)}
     */
    static AddCompleteNotify => 1

    /**
     * Native name: KeProcessorAddFailureNotify
     * @type {Integer (Int32)}
     */
    static AddFailureNotify => 2
}
