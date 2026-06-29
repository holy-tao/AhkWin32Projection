#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUTHZ_GENERATE_RESULTS.ahk" { AUTHZ_GENERATE_RESULTS }

/**
 * Defines an access check reply.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_access_reply
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_ACCESS_REPLY {
    #StructPack 8

    /**
     * The number of elements in the <b>GrantedAccessMask</b>, <b>SaclEvaluationResults</b>, and <b>Error</b> arrays. This number matches the number of entries in the object type list structure used in the access check.
     * 						 If no object type is used to represent the object, then set <b>ResultListLength</b> to one.
     */
    ResultListLength : UInt32

    /**
     * An array of granted access masks. Memory for this array is allocated by the application before calling <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheck">AccessCheck</a>.
     */
    GrantedAccessMask : IntPtr

    SaclEvaluationResults : AUTHZ_GENERATE_RESULTS.Ptr

    /**
     * An array of results for each element of the array. Memory for this array is allocated by the application before calling <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheck">AccessCheck</a>. 
     * 
     * 
     * 
     * 
     * The following table lists the possible error values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_SUCCESS"></a><a id="error_success"></a><dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All the access bits, not including MAXIMUM_ALLOWED, are granted and the <b>GrantedAccessMask</b> member is not zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_PRIVILEGE_NOT_HELD"></a><a id="error_privilege_not_held"></a><dl>
     * <dt><b>ERROR_PRIVILEGE_NOT_HELD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DesiredAccess includes ACCESS_SYSTEM_SECURITY and the client does not have SeSecurityPrivilege.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_ACCESS_DENIED"></a><a id="error_access_denied"></a><dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Includes each of the following: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>The requested bits are not granted.</li>
     * <li>MaximumAllowed bit is on and granted access is zero.</li>
     * <li>DesiredAccess is zero.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     */
    Error : IntPtr

}
