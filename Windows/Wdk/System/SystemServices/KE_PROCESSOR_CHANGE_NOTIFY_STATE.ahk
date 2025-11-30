#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KE_PROCESSOR_CHANGE_NOTIFY_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KeProcessorAddStartNotify => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeProcessorAddCompleteNotify => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeProcessorAddFailureNotify => 2
}
