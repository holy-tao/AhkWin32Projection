#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the list of common names corresponding to the SID structures returned by ISecurityInformation2::LookupSids.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-sid_info
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
     * @type {Pointer<Ptr>}
     */
    pSid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a string containing the common name corresponding to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure specified in <b>pSid</b>.
     * @type {Pointer<Ptr>}
     */
    pwzCommonName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a string describing the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure as either a user or a group. The possible values of this string are as follows:
     * 
     * <p class="indent">"Computer"
     * 
     * <p class="indent">"Group"
     * 
     * <p class="indent">"User"
     * @type {Pointer<Ptr>}
     */
    pwzClass {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the user principal name (UPN) corresponding to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure specified in <b>pSid</b>. If a UPN has not been designated for the <b>SID</b> structure, the value of this parameter is <b>NULL</b>.
     * @type {Pointer<Ptr>}
     */
    pwzUPN {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
