#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the SERVICE_TYPE enumeration type specify the type of service administered from the SDO API.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-service_type
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class SERVICE_TYPE{

    /**
     * The service is Internet Authentication Service (IAS) or Network Policy Server (NPS).
 * 
 * <div class="alert"><b>Note</b>  Internet Authentication Service was renamed Network Policy Server starting with Windows Server 2008.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static SERVICE_TYPE_IAS => 0

    /**
     * The service is the Remote Access Service.
     * @type {Integer (Int32)}
     */
    static SERVICE_TYPE_RAS => 1

    /**
     * The service is the Remote Access Management Service.
     * @type {Integer (Int32)}
     */
    static SERVICE_TYPE_RAMGMTSVC => 2

    /**
     * Use this constant to test whether the value is in range.
     * @type {Integer (Int32)}
     */
    static SERVICE_TYPE_MAX => 3
}
