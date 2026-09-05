#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the SERVICE_TYPE enumeration type specify the type of service administered from the SDO API.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-service_type
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
class SERVICE_TYPE extends Win32Enum {

    /**
     * The service is Internet Authentication Service (IAS) or Network Policy Server (NPS).
     * 
     * <div class="alert"><b>Note</b>  Internet Authentication Service was renamed Network Policy Server starting with Windows Server 2008.</div>
     * <div> </div>
     * Native name: SERVICE_TYPE_IAS
     * @type {Integer (Int32)}
     */
    static IAS => 0

    /**
     * The service is the Remote Access Service.
     * Native name: SERVICE_TYPE_RAS
     * @type {Integer (Int32)}
     */
    static RAS => 1

    /**
     * The service is the Remote Access Management Service.
     * Native name: SERVICE_TYPE_RAMGMTSVC
     * @type {Integer (Int32)}
     */
    static RAMGMTSVC => 2

    /**
     * Use this constant to test whether the value is in range.
     * Native name: SERVICE_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
