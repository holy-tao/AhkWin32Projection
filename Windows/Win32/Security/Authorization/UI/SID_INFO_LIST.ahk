#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\PSID.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\SID_INFO.ahk

/**
 * Contains a list of SID_INFO structures.
 * @see https://docs.microsoft.com/windows/win32/api//aclui/ns-aclui-sid_info_list
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class SID_INFO_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-sid_info">SID_INFO</a> structures contained in the <b>aSidInfo</b> member.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-sid_info">SID_INFO</a> structures that is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation2-lookupsids">ISecurityInformation2::LookupSids</a> method.
     * @type {Array<SID_INFO>}
     */
    aSidInfo{
        get {
            if(!this.HasProp("__aSidInfoProxyArray"))
                this.__aSidInfoProxyArray := Win32FixedArray(this.ptr + 8, 1, SID_INFO, "")
            return this.__aSidInfoProxyArray
        }
    }
}
