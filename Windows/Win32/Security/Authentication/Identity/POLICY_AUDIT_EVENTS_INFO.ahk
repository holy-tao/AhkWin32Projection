#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The POLICY_AUDIT_EVENTS_INFO structure is used to set and query the system's auditing rules.
 * @remarks
 * 
  * LSA Policy defines a mask for the valid event auditing options. The POLICY_AUDIT_EVENT_MASK mask evaluates to <b>TRUE</b> if it is set equal to any of the preceding event auditing options.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-policy_audit_events_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_AUDIT_EVENTS_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Indicates whether auditing is enabled. 
     * 
     * 
     * 
     * 
     * If this flag is <b>TRUE</b>, the system generates audit records according to the event auditing options specified in the <b>EventAuditingOptions</b> member.
     * 
     * If this flag is <b>FALSE</b>, the system does not generate audit records. However, note that set operations update the event auditing options as specified in the <b>EventAuditingOptions</b> member even when <b>AuditingMode</b> is <b>FALSE</b>.
     * @type {BOOLEAN}
     */
    AuditingMode {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Pointer to an array of POLICY_AUDIT_EVENT_OPTIONS variables. Each element in this array specifies the auditing options for an audit event type. The index of each array element corresponds to an audit event type value in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-policy_audit_event_type">POLICY_AUDIT_EVENT_TYPE</a> enumeration type. 
     * 
     * 
     * 
     * 
     * Each POLICY_AUDIT_EVENT_OPTIONS variable in the array can specify the following auditing options. You can also combine the success and failure options, POLICY_AUDIT_EVENT_SUCCESS and POLICY_AUDIT_EVENT_FAILURE.
     * 
     * When <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsasetinformationpolicy">LSASetInformationPolicy</a> is called to change the audit policy, any new POLICY_AUDIT_EVENT_OPTIONS array elements are added to any existing audit options. Adding a new POLICY_AUDIT_EVENT_OPTIONS element combined with the POLICY_AUDIT_EVENT_NONE audit option cancels all previous audit options and begins a new set of options.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_AUDIT_EVENT_UNCHANGED"></a><a id="policy_audit_event_unchanged"></a><dl>
     * <dt><b>POLICY_AUDIT_EVENT_UNCHANGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * For set operations, specify this value to leave the current options unchanged. For read operations, this value means that no audit records for this type are generated. This is the default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_AUDIT_EVENT_SUCCESS"></a><a id="policy_audit_event_success"></a><dl>
     * <dt><b>POLICY_AUDIT_EVENT_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Generate audit records for successful events of this type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_AUDIT_EVENT_FAILURE"></a><a id="policy_audit_event_failure"></a><dl>
     * <dt><b>POLICY_AUDIT_EVENT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Generate audit records for failed attempts to cause an event of this type to occur.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="POLICY_AUDIT_EVENT_NONE"></a><a id="policy_audit_event_none"></a><dl>
     * <dt><b>POLICY_AUDIT_EVENT_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not generate audit records for events of this type.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<UInt32>}
     */
    EventAuditingOptions {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the number of elements in the <b>EventAuditingOptions</b> array. For set operations, if this value is less than the number of audit event types supported by the system, the system does not change the auditing options for event types with indexes equal to or higher than the value specified in <b>MaximumAuditEventCount</b>.
     * @type {Integer}
     */
    MaximumAuditEventCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
