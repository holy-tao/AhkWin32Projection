#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }
#Import ".\SID_INFO.ahk" { SID_INFO }

/**
 * Contains a list of SID_INFO structures.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-sid_info_list
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct SID_INFO_LIST {
    #StructPack 8

    /**
     * The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-sid_info">SID_INFO</a> structures contained in the <b>aSidInfo</b> member.
     */
    cItems : UInt32

    /**
     * A pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-sid_info">SID_INFO</a> structures that is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation2-lookupsids">ISecurityInformation2::LookupSids</a> method.
     */
    aSidInfo : SID_INFO[1]

}
