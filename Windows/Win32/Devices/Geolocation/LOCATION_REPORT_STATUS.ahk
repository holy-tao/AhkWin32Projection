#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines possible status for new reports of a particular report type.
 * @remarks
 * These values represent status for new reports. The most recent reports remain available through <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-getreport">ILocation::GetReport</a>, regardless of the reported status. If the status is <b>REPORT_RUNNING</b>, the data in a report is new. Otherwise, <b>ILocation::GetReport</b> provides cached data if cached data is available.
 * @see https://learn.microsoft.com/windows/win32/api/locationapi/ne-locationapi-location_report_status
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class LOCATION_REPORT_STATUS{

    /**
     * The requested report type is not supported by the API. No location providers of the requested type are installed.
     * @type {Integer (Int32)}
     */
    static REPORT_NOT_SUPPORTED => 0

    /**
     * There was an error when creating the report, or location providers for the requested type are unable to provide any data. Location providers might be currently unavailable, or location providers cannot obtain any data. For example, this state may occur when a GPS sensor is indoors and no satellites are in view.
     * @type {Integer (Int32)}
     */
    static REPORT_ERROR => 1

    /**
     * No permissions have been granted to access this report type. Call <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-ilocation-requestpermissions">ILocation::RequestPermissions</a>.
     * @type {Integer (Int32)}
     */
    static REPORT_ACCESS_DENIED => 2

    /**
     * The report is being initialized.
     * @type {Integer (Int32)}
     */
    static REPORT_INITIALIZING => 3

    /**
     * The report is running. New location data for the requested report type is available.
     * @type {Integer (Int32)}
     */
    static REPORT_RUNNING => 4
}
