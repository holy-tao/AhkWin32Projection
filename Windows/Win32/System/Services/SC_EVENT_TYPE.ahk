#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/Services/sc-event-type
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SC_EVENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SC_EVENT_DATABASE_CHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SC_EVENT_PROPERTY_CHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SC_EVENT_STATUS_CHANGE => 2
}
