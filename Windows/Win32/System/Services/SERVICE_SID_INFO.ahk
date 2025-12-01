#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a service security identifier (SID).
 * @remarks
 * The change takes effect the next time the system is started.
 * 
 * The SCM adds the specified service SIDs to the process token, plus the following additional SIDs.
 * 
 * <table>
 * <tr>
 * <th>SID</th>
 * <th>Attributes</th>
 * </tr>
 * <tr>
 * <td>Logon SID</td>
 * <td>SE_GROUP_ENABLED | SE_GROUP_ENABLED_BY_DEFAULT | SE_GROUP_LOGON_ID | SE_GROUP_MANDATORY</td>
 * </tr>
 * <tr>
 * <td>Local SID</td>
 * <td>SE_GROUP_MANDATORY | SE_GROUP_ENABLED | SE_GROUP_ENABLED_BY_DEFAULT</td>
 * </tr>
 * </table>
 *  
 * 
 * This enables developers to control access to the objects a service uses, instead of relying on the use of the LocalSystem account to obtain access.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountnamea">LookupAccountName</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountsida">LookupAccountSid</a> functions to convert between a service name and a service SID. The account name is of the following form:
 * 
 * NT SERVICE&#92;<i>SvcName</i>
 * 
 * Note that NT SERVICE is the domain name.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_sid_info
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_SID_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The service SID type.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_SID_TYPE_NONE"></a><a id="service_sid_type_none"></a><dl>
     * <dt><b>SERVICE_SID_TYPE_NONE</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use this type to reduce application compatibility issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_SID_TYPE_RESTRICTED"></a><a id="service_sid_type_restricted"></a><dl>
     * <dt><b>SERVICE_SID_TYPE_RESTRICTED</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This type includes SERVICE_SID_TYPE_UNRESTRICTED. The service SID is also added to the restricted SID list of the process token. Three additional SIDs are also added to the restricted SID list: 
     * 
     * <ul>
     * <li>World SID S-1-1-0</li>
     * <li>Service logon SID</li>
     * <li>Write-restricted SID S-1-5-33</li>
     * </ul>
     * One ACE that allows GENERIC_ALL access for the service logon SID is also added to the service process token object.
     * 
     * If there are multiple services hosted in the same process and one service has SERVICE_SID_TYPE_RESTRICTED, all services must have SERVICE_SID_TYPE_RESTRICTED.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_SID_TYPE_UNRESTRICTED"></a><a id="service_sid_type_unrestricted"></a><dl>
     * <dt><b>SERVICE_SID_TYPE_UNRESTRICTED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the service process is created, the service SID is added to the service process token with the following attributes: SE_GROUP_ENABLED_BY_DEFAULT | SE_GROUP_OWNER.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwServiceSidType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
