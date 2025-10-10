#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies a security event type and when to audit that type.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-audit_policy_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class AUDIT_POLICY_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <b>GUID</b> structure that specifies an audit subcategory.
     * @type {Pointer<Guid>}
     */
    AuditSubCategoryGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A set of bit flags that specify the conditions under which  the security event type specified by the <b>AuditSubCategoryGuid</b> and <b>AuditCategoryGuid</b> members are audited. The following values are defined.
     * 
     * <div class="alert"><b>Important</b>  Note that the meaning of these values differs depending on which function is using this structure.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_AUDIT_EVENT_UNCHANGED"></a><a id="policy_audit_event_unchanged"></a><dl>
     * <dt><b>POLICY_AUDIT_EVENT_UNCHANGED</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not change auditing options for the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetsystempolicy">AuditSetSystemPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditquerysystempolicy">AuditQuerySystemPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_AUDIT_EVENT_SUCCESS"></a><a id="policy_audit_event_success"></a><dl>
     * <dt><b>POLICY_AUDIT_EVENT_SUCCESS</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audit successful occurrences of the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetsystempolicy">AuditSetSystemPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditquerysystempolicy">AuditQuerySystemPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_AUDIT_EVENT_FAILURE"></a><a id="policy_audit_event_failure"></a><dl>
     * <dt><b>POLICY_AUDIT_EVENT_FAILURE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audit failed attempts to cause the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetsystempolicy">AuditSetSystemPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditquerysystempolicy">AuditQuerySystemPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_AUDIT_EVENT_NONE"></a><a id="policy_audit_event_none"></a><dl>
     * <dt><b>POLICY_AUDIT_EVENT_NONE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not audit the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetsystempolicy">AuditSetSystemPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditquerysystempolicy">AuditQuerySystemPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PER_USER_POLICY_UNCHANGED"></a><a id="per_user_policy_unchanged"></a><dl>
     * <dt><b>PER_USER_POLICY_UNCHANGED</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not change auditing options for the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetperuserpolicy">AuditSetPerUserPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditqueryperuserpolicy">AuditQueryPerUserPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PER_USER_AUDIT_SUCCESS_INCLUDE"></a><a id="per_user_audit_success_include"></a><dl>
     * <dt><b>PER_USER_AUDIT_SUCCESS_INCLUDE</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audit successful occurrences of the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetperuserpolicy">AuditSetPerUserPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditqueryperuserpolicy">AuditQueryPerUserPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PER_USER_AUDIT_SUCCESS_EXCLUDE"></a><a id="per_user_audit_success_exclude"></a><dl>
     * <dt><b>PER_USER_AUDIT_SUCCESS_EXCLUDE</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not audit successful occurrences of the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetperuserpolicy">AuditSetPerUserPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditqueryperuserpolicy">AuditQueryPerUserPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PER_USER_AUDIT_FAILURE_INCLUDE"></a><a id="per_user_audit_failure_include"></a><dl>
     * <dt><b>PER_USER_AUDIT_FAILURE_INCLUDE</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Audit failed attempts to cause the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetperuserpolicy">AuditSetPerUserPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditqueryperuserpolicy">AuditQueryPerUserPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PER_USER_AUDIT_FAILURE_EXCLUDE"></a><a id="per_user_audit_failure_exclude"></a><dl>
     * <dt><b>PER_USER_AUDIT_FAILURE_EXCLUDE</b></dt>
     * <dt>0x08</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not audit failed attempts to cause the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetperuserpolicy">AuditSetPerUserPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditqueryperuserpolicy">AuditQueryPerUserPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PER_USER_AUDIT_NONE"></a><a id="per_user_audit_none"></a><dl>
     * <dt><b>PER_USER_AUDIT_NONE</b></dt>
     * <dt>0x10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not audit the specified event type.
     * 
     * This value is valid for the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditsetperuserpolicy">AuditSetPerUserPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-auditqueryperuserpolicy">AuditQueryPerUserPolicy</a> functions.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AuditingInformation {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <b>GUID</b> structure that specifies an audit-policy category.
     * @type {Pointer<Guid>}
     */
    AuditCategoryGuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
