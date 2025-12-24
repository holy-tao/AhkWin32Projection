#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetFwProfile.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetFwPolicy interface provides access to a firewall policy.
 * @remarks
 * 
 * Instances of this interface are
 * retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwmgr-get_localpolicy">LocalPolicy</a> property of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwmgr">INetFwMgr</a> interface.
 * 
 * All configuration changes take
 * effect immediately.
 * 
 * The Windows Firewall/Internet Connection Sharing  service must be running to access this interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwpolicy
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwPolicy extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwPolicy
     * @type {Guid}
     */
    static IID => Guid("{d46d2478-9ac9-4008-9dc7-5563ce5536cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentProfile", "GetProfileByType"]

    /**
     * @type {INetFwProfile} 
     */
    CurrentProfile {
        get => this.get_CurrentProfile()
    }

    /**
     * Retrieves the current firewall profile.
     * @remarks
     * 
     * The SharedAccess service must be running.
     * 
     * To get specific profile objects, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy-getprofilebytype">INetFwPolicy::GetProfileByType</a> instead of <b>INetFwPolicy::CurrentProfile</b>.
     * 
     * On Windows 7, the netsh context <b>current</b> maps to all currently active profiles for netsh advfirewall and netsh firewall. On earlier versions of Windows, <b>current</b> maps to the most restrictive profile.
     * 
     * 
     * @returns {INetFwProfile} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy-get_currentprofile
     */
    get_CurrentProfile() {
        result := ComCall(7, this, "ptr*", &profile := 0, "HRESULT")
        return INetFwProfile(profile)
    }

    /**
     * Retrieves the profile of the requested type.
     * @param {Integer} profileType Type of profile from <a href="https://docs.microsoft.com/windows/desktop/api/icftypes/ne-icftypes-net_fw_profile_type">NET_FW_PROFILE_TYPE</a>.
     * @returns {INetFwProfile} Retrieved profile of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwprofile">INetFwProfile</a>.
     * 
     * Retrieved profile of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwprofile">INetFwProfile</a>.
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy-getprofilebytype
     */
    GetProfileByType(profileType) {
        result := ComCall(8, this, "int", profileType, "ptr*", &profile := 0, "HRESULT")
        return INetFwProfile(profile)
    }
}
