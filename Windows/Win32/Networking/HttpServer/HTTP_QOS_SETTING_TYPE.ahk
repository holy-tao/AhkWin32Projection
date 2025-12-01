#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of a QOS setting contained in a HTTP_QOS_SETTING_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_qos_setting_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_QOS_SETTING_TYPE extends Win32Enum{

    /**
     * The setting is a bandwidth limit represented by a <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_bandwidth_limit_info">HTTP_BANDWIDTH_LIMIT_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static HttpQosSettingTypeBandwidth => 0

    /**
     * The setting is a connection limit represented by a <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_connection_limit_info">HTTP_CONNECTION_LIMIT_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static HttpQosSettingTypeConnectionLimit => 1

    /**
     * A flow rate represented by <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_flowrate_info">HTTP_FLOWRATE_INFO</a>.
     * 
     * <div class="alert"><b>Note</b>  Windows Server 2008 R2 and Windows 7 only.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static HttpQosSettingTypeFlowRate => 2
}
