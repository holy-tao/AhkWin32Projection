#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_EVENT_LOG_ENTRY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryTypeInformational => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryTypeWarning => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaEventLogEntryTypeError => 2
}
