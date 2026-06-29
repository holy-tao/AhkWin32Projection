#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Contains the list of common names corresponding to the SID structures returned by ISecurityInformation2::LookupSids.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-sid_info
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct SID_INFO {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies one of the SIDs passed into 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation2-lookupsids">ISecurityInformation2::LookupSids</a>.
     */
    pSid : PSID

    /**
     * A pointer to a string containing the common name corresponding to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure specified in <b>pSid</b>.
     */
    pwzCommonName : PWSTR

    /**
     * A pointer to a string describing the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure as either a user or a group. The possible values of this string are as follows:
     * 
     * <p class="indent">"Computer"
     * 
     * <p class="indent">"Group"
     * 
     * <p class="indent">"User"
     */
    pwzClass : PWSTR

    /**
     * A pointer to the user principal name (UPN) corresponding to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure specified in <b>pSid</b>. If a UPN has not been designated for the <b>SID</b> structure, the value of this parameter is <b>NULL</b>.
     */
    pwzUPN : PWSTR

}
