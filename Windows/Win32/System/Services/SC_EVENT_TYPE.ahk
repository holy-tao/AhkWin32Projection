#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates a type of service status change for monitoring and reporting.
 * @see https://learn.microsoft.com/windows/win32/Services/sc-event-type
 * @namespace Windows.Win32.System.Services
 */
class SC_EVENT_TYPE extends Win32Enum {

    /**
     * Native name: SC_EVENT_DATABASE_CHANGE
     * @type {Integer (Int32)}
     */
    static DATABASE_CHANGE => 0

    /**
     * Native name: SC_EVENT_PROPERTY_CHANGE
     * @type {Integer (Int32)}
     */
    static PROPERTY_CHANGE => 1

    /**
     * Native name: SC_EVENT_STATUS_CHANGE
     * @type {Integer (Int32)}
     */
    static STATUS_CHANGE => 2
}
