#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\PSID.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Contains the list of common names corresponding to the SID structures returned by ISecurityInformation2::LookupSids.
 * @see https://docs.microsoft.com/windows/win32/api//aclui/ns-aclui-sid_info
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class SID_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that identifies one of the SIDs passed into 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation2-lookupsids">ISecurityInformation2::LookupSids</a>.
     * @type {PSID}
     */
    pSid{
        get {
            if(!this.HasProp("__pSid"))
                this.__pSid := PSID(this.ptr + 0)
            return this.__pSid
        }
    }

    /**
     * A pointer to a string containing the common name corresponding to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure specified in <b>pSid</b>.
     * @type {PWSTR}
     */
    pwzCommonName{
        get {
            if(!this.HasProp("__pwzCommonName"))
                this.__pwzCommonName := PWSTR(this.ptr + 8)
            return this.__pwzCommonName
        }
    }

    /**
     * A pointer to a string describing the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure as either a user or a group. The possible values of this string are as follows:
     * 
     * <p class="indent">"Computer"
     * 
     * <p class="indent">"Group"
     * 
     * <p class="indent">"User"
     * @type {PWSTR}
     */
    pwzClass{
        get {
            if(!this.HasProp("__pwzClass"))
                this.__pwzClass := PWSTR(this.ptr + 16)
            return this.__pwzClass
        }
    }

    /**
     * A pointer to the user principal name (UPN) corresponding to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure specified in <b>pSid</b>. If a UPN has not been designated for the <b>SID</b> structure, the value of this parameter is <b>NULL</b>.
     * @type {PWSTR}
     */
    pwzUPN{
        get {
            if(!this.HasProp("__pwzUPN"))
                this.__pwzUPN := PWSTR(this.ptr + 24)
            return this.__pwzUPN
        }
    }
}
