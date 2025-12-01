#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\LUID.ahk
#Include .\LUID_AND_ATTRIBUTES.ahk

/**
 * Specifies a set of privileges.
 * @remarks
 * A privilege is used to control access to an object or service more strictly than is typical with discretionary access control. A system manager uses privileges to control which users are able to manipulate system resources. An application uses privileges when it changes a system-wide resource, such as when it changes the system time or shuts down the system.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-privilege_set
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class PRIVILEGE_SET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of privileges in the privilege set.
     * @type {Integer}
     */
    PrivilegeCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a control flag related to the privileges. The PRIVILEGE_SET_ALL_NECESSARY control flag is currently defined. It indicates that all of the specified privileges must be held by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a> requesting access. If this flag is not set, the presence of any privileges in the user's <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access token</a> grants the access.
     * @type {Integer}
     */
    Control {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid_and_attributes">LUID_AND_ATTRIBUTES</a> structures describing the set's privileges. The following attributes are defined for privileges. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_PRIVILEGE_ENABLED_BY_DEFAULT"></a><a id="se_privilege_enabled_by_default"></a><dl>
     * <dt><b>SE_PRIVILEGE_ENABLED_BY_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The privilege is enabled by default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_PRIVILEGE_ENABLED"></a><a id="se_privilege_enabled"></a><dl>
     * <dt><b>SE_PRIVILEGE_ENABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The privilege is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SE_PRIVILEGE_USED_FOR_ACCESS"></a><a id="se_privilege_used_for_access"></a><dl>
     * <dt><b>SE_PRIVILEGE_USED_FOR_ACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The privilege was used to gain access to an object or service. This flag is used to identify the relevant privileges in a set passed by a client application that may contain unnecessary privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Array<LUID_AND_ATTRIBUTES>}
     */
    Privilege{
        get {
            if(!this.HasProp("__PrivilegeProxyArray"))
                this.__PrivilegeProxyArray := Win32FixedArray(this.ptr + 8, 1, LUID_AND_ATTRIBUTES, "")
            return this.__PrivilegeProxyArray
        }
    }
}
