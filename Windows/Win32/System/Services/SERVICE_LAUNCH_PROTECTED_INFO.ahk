#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates a service protection type.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a> function to specify the protection type of the service, and it is used with <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfig2a">QueryServiceConfig2</a> to retrieve service configuration information for protected services. In order to apply any protection type to a service, the service must be signed with an appropriate certificate.
 * 
 * The <b>SERVICE_LAUNCH_PROTECTED_WINDOWS</b> and <b>SERVICE_LAUNCH_PROTECTED_WINDOWS_LIGHT</b> protection types are reserved for internal Windows use only.
 * 
 * The <b>SERVICE_LAUNCH_PROTECTED_ANTIMALWARE_LIGHT</b> protection type can be used by the anti-malware vendors to launch their anti-malware service as protected. See <a href="https://docs.microsoft.com/windows/desktop/Services/protecting-anti-malware-services-">Protecting Anti-Malware Services</a> for more info.
 * 
 * Once the service is launched as protected, other unprotected processes will not be able to call the following APIs on the protected service.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlservice">ControlService</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlserviceexa">ControlServiceEx</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-deleteservice">DeleteService</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setserviceobjectsecurity">SetServiceObjectSecurity</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_launch_protected_info
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_LAUNCH_PROTECTED_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    dwLaunchProtected {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
