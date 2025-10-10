#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the NTEVENTLOGPROPERTIES enumeration type enumerate what types of events should be logged in the NT Event Log.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-nteventlogproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class NTEVENTLOGPROPERTIES{

    /**
     * Specifies how the reporting of NPS Error events occurs in the Windows event log. In Windows XP, there is no UI element that corresponds to this property
     * @type {Integer (Int32)}
     */
    static PROPERTY_EVENTLOG_LOG_APPLICATION_EVENTS => 1026

    /**
     * Specifies whether discarded and rejected packets are logged.
     * @type {Integer (Int32)}
     */
    static PROPERTY_EVENTLOG_LOG_MALFORMED => 1027

    /**
     * Specifies whether successful authentications are logged.
     * @type {Integer (Int32)}
     */
    static PROPERTY_EVENTLOG_LOG_DEBUG => 1028
}
