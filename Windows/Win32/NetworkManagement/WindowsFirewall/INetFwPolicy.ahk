#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\NET_FW_PROFILE_TYPE.ahk" { NET_FW_PROFILE_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetFwProfile.ahk" { INetFwProfile }

/**
 * The INetFwPolicy interface provides access to a firewall policy.
 * @remarks
 * Instances of this interface are
 * retrieved through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwmgr-get_localpolicy">LocalPolicy</a> property of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwmgr">INetFwMgr</a> interface.
 * 
 * All configuration changes take
 * effect immediately.
 * 
 * The Windows Firewall/Internet Connection Sharing  service must be running to access this interface.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwpolicy
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwPolicy extends IDispatch {
    /**
     * The interface identifier for INetFwPolicy
     * @type {Guid}
     */
    static IID := Guid("{d46d2478-9ac9-4008-9dc7-5563ce5536cc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwPolicy interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CurrentProfile : IntPtr
        GetProfileByType   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwPolicy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {INetFwProfile} 
     */
    CurrentProfile {
        get => this.get_CurrentProfile()
    }

    /**
     * Retrieves the current firewall profile.
     * @remarks
     * The SharedAccess service must be running.
     * 
     * To get specific profile objects, use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy-getprofilebytype">INetFwPolicy::GetProfileByType</a> instead of <b>INetFwPolicy::CurrentProfile</b>.
     * 
     * On Windows 7, the netsh context <b>current</b> maps to all currently active profiles for netsh advfirewall and netsh firewall. On earlier versions of Windows, <b>current</b> maps to the most restrictive profile.
     * @returns {INetFwProfile} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy-get_currentprofile
     */
    get_CurrentProfile() {
        result := ComCall(7, this, "ptr*", &_profile := 0, "HRESULT")
        return INetFwProfile(_profile)
    }

    /**
     * Retrieves the profile of the requested type.
     * @param {NET_FW_PROFILE_TYPE} profileType Type of profile from <a href="https://docs.microsoft.com/windows/desktop/api/icftypes/ne-icftypes-net_fw_profile_type">NET_FW_PROFILE_TYPE</a>.
     * @returns {INetFwProfile} Retrieved profile of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwprofile">INetFwProfile</a>.
     * 
     * Retrieved profile of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwprofile">INetFwProfile</a>.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy-getprofilebytype
     */
    GetProfileByType(profileType) {
        result := ComCall(8, this, NET_FW_PROFILE_TYPE, profileType, "ptr*", &_profile := 0, "HRESULT")
        return INetFwProfile(_profile)
    }

    Query(iid) {
        if (INetFwPolicy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentProfile := CallbackCreate(GetMethod(implObj, "get_CurrentProfile"), flags, 2)
        this.vtbl.GetProfileByType := CallbackCreate(GetMethod(implObj, "GetProfileByType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentProfile)
        CallbackFree(this.vtbl.GetProfileByType)
    }
}
