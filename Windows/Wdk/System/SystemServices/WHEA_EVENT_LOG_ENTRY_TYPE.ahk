#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_EVENT_LOG_ENTRY_TYPE extends Win32Enum {

    /**
     * Native name: WheaEventLogEntryTypeInformational
     * @type {Integer (Int32)}
     */
    static Informational => 0

    /**
     * Native name: WheaEventLogEntryTypeWarning
     * @type {Integer (Int32)}
     */
    static Warning => 1

    /**
     * Native name: WheaEventLogEntryTypeError
     * @type {Integer (Int32)}
     */
    static Error => 2
}
