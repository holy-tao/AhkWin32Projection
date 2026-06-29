#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\INetFwServiceRestriction.ahk" { INetFwServiceRestriction }
#Import ".\INetFwRules.ahk" { INetFwRules }
#Import ".\NET_FW_ACTION.ahk" { NET_FW_ACTION }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\NET_FW_PROFILE_TYPE2.ahk" { NET_FW_PROFILE_TYPE2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NET_FW_MODIFY_STATE.ahk" { NET_FW_MODIFY_STATE }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * To access the firewall policy.
 * @remarks
 * All configuration changes take effect immediately.
 * 
 * The Windows Firewall/Internet Connection Sharing  service must be running to access this interface.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwpolicy2
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwPolicy2 extends IDispatch {
    /**
     * The interface identifier for INetFwPolicy2
     * @type {Guid}
     */
    static IID := Guid("{98325047-c671-4174-8d81-defcd3f03186}")

    /**
     * The class identifier for NetFwPolicy2
     * @type {Guid}
     */
    static CLSID := Guid("{e2b3c97f-6ae1-41ac-817a-f6f92166d7dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwPolicy2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CurrentProfileTypes                          : IntPtr
        get_FirewallEnabled                              : IntPtr
        put_FirewallEnabled                              : IntPtr
        get_ExcludedInterfaces                           : IntPtr
        put_ExcludedInterfaces                           : IntPtr
        get_BlockAllInboundTraffic                       : IntPtr
        put_BlockAllInboundTraffic                       : IntPtr
        get_NotificationsDisabled                        : IntPtr
        put_NotificationsDisabled                        : IntPtr
        get_UnicastResponsesToMulticastBroadcastDisabled : IntPtr
        put_UnicastResponsesToMulticastBroadcastDisabled : IntPtr
        get_Rules                                        : IntPtr
        get_ServiceRestriction                           : IntPtr
        EnableRuleGroup                                  : IntPtr
        IsRuleGroupEnabled                               : IntPtr
        RestoreLocalFirewallDefaults                     : IntPtr
        get_DefaultInboundAction                         : IntPtr
        put_DefaultInboundAction                         : IntPtr
        get_DefaultOutboundAction                        : IntPtr
        put_DefaultOutboundAction                        : IntPtr
        get_IsRuleGroupCurrentlyEnabled                  : IntPtr
        get_LocalPolicyModifyState                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwPolicy2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CurrentProfileTypes {
        get => this.get_CurrentProfileTypes()
    }

    /**
     * @type {INetFwRules} 
     */
    Rules {
        get => this.get_Rules()
    }

    /**
     * @type {INetFwServiceRestriction} 
     */
    ServiceRestriction {
        get => this.get_ServiceRestriction()
    }

    /**
     * @type {NET_FW_MODIFY_STATE} 
     */
    LocalPolicyModifyState {
        get => this.get_LocalPolicyModifyState()
    }

    /**
     * Retrieves the currently active firewall profile.
     * @remarks
     * Multiple profiles can be returned in the profiles bitmask.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes
     */
    get_CurrentProfileTypes() {
        result := ComCall(7, this, "int*", &profileTypesBitmask := 0, "HRESULT")
        return profileTypesBitmask
    }

    /**
     * Indicates whether a firewall is enabled locally (the effective result may differ due to group policy settings). (Get)
     * @remarks
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_FirewallEnabled</b> and <b>put_FirewallEnabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_firewallenabled
     */
    get_FirewallEnabled(profileType) {
        result := ComCall(8, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether a firewall is enabled locally (the effective result may differ due to group policy settings). (Put)
     * @remarks
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_FirewallEnabled</b> and <b>put_FirewallEnabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_firewallenabled
     */
    put_FirewallEnabled(profileType, enabled) {
        result := ComCall(9, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT_BOOL, enabled, "HRESULT")
        return result
    }

    /**
     * Specifies a list of interfaces on which firewall settings are excluded. (Get)
     * @remarks
     * An excluded interface is an interface to which the firewall is not applicable.  The firewall is not applicable to any traffic received from or sent to an excluded interface. An empty list indicates that there are no excluded interfaces.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_ExcludedInterfaces</b> and <b>put_ExcludedInterfaces</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_excludedinterfaces
     */
    get_ExcludedInterfaces(profileType) {
        interfaces := VARIANT()
        result := ComCall(10, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT.Ptr, interfaces, "HRESULT")
        return interfaces
    }

    /**
     * Specifies a list of interfaces on which firewall settings are excluded. (Put)
     * @remarks
     * An excluded interface is an interface to which the firewall is not applicable.  The firewall is not applicable to any traffic received from or sent to an excluded interface. An empty list indicates that there are no excluded interfaces.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_ExcludedInterfaces</b> and <b>put_ExcludedInterfaces</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @param {VARIANT} interfaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_excludedinterfaces
     */
    put_ExcludedInterfaces(profileType, interfaces) {
        result := ComCall(11, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT, interfaces, "HRESULT")
        return result
    }

    /**
     * Indicates whether the firewall should not allow inbound traffic. (Get)
     * @remarks
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_BlockAllInboundTraffic</b> and <b>put_BlockAllInboundTraffic</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_blockallinboundtraffic
     */
    get_BlockAllInboundTraffic(profileType) {
        result := ComCall(12, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT_BOOL.Ptr, &Block := 0, "HRESULT")
        return Block
    }

    /**
     * Indicates whether the firewall should not allow inbound traffic. (Put)
     * @remarks
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_BlockAllInboundTraffic</b> and <b>put_BlockAllInboundTraffic</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @param {VARIANT_BOOL} Block 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_blockallinboundtraffic
     */
    put_BlockAllInboundTraffic(profileType, Block) {
        result := ComCall(13, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT_BOOL, Block, "HRESULT")
        return result
    }

    /**
     * Indicates whether interactive firewall notifications are disabled. (INetFwPolicy2.get_NotificationsDisabled)
     * @remarks
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_NotificationsDisabled</b> and <b>put_NotificationsDisabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_notificationsdisabled
     */
    get_NotificationsDisabled(profileType) {
        result := ComCall(14, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT_BOOL.Ptr, &disabled := 0, "HRESULT")
        return disabled
    }

    /**
     * Indicates whether interactive firewall notifications are disabled. (INetFwPolicy2.put_NotificationsDisabled)
     * @remarks
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_NotificationsDisabled</b> and <b>put_NotificationsDisabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_notificationsdisabled
     */
    put_NotificationsDisabled(profileType, disabled) {
        result := ComCall(15, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT_BOOL, disabled, "HRESULT")
        return result
    }

    /**
     * Indicates whether the firewall should not allow unicast responses to multicast and broadcast traffic. (INetFwPolicy2.get_UnicastResponsesToMulticastBroadcastDisabled)
     * @remarks
     * If a computer sends a broadcast packet, a unicast response is allowed for three seconds. Use this property to change this behavior.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property (<b>get_CurrentProfileTypes</b>), make sure that you pass only one profile type to <b>get_UnicastResponsesToMulticastBroadcastDisabled</b> and <b>put_UnicastResponsesToMulticastBroadcastDisabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_unicastresponsestomulticastbroadcastdisabled
     */
    get_UnicastResponsesToMulticastBroadcastDisabled(profileType) {
        result := ComCall(16, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT_BOOL.Ptr, &disabled := 0, "HRESULT")
        return disabled
    }

    /**
     * Indicates whether the firewall should not allow unicast responses to multicast and broadcast traffic. (INetFwPolicy2.put_UnicastResponsesToMulticastBroadcastDisabled)
     * @remarks
     * If a computer sends a broadcast packet, a unicast response is allowed for three seconds. Use this property to change this behavior.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property (<b>get_CurrentProfileTypes</b>), make sure that you pass only one profile type to <b>get_UnicastResponsesToMulticastBroadcastDisabled</b> and <b>put_UnicastResponsesToMulticastBroadcastDisabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_unicastresponsestomulticastbroadcastdisabled
     */
    put_UnicastResponsesToMulticastBroadcastDisabled(profileType, disabled) {
        result := ComCall(17, this, NET_FW_PROFILE_TYPE2, profileType, VARIANT_BOOL, disabled, "HRESULT")
        return result
    }

    /**
     * Retrieves the collection of firewall rules.
     * @returns {INetFwRules} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_rules
     */
    get_Rules() {
        result := ComCall(18, this, "ptr*", &rules := 0, "HRESULT")
        return INetFwRules(rules)
    }

    /**
     * Retrieves the interface used to access the Windows Service Hardening store.
     * @returns {INetFwServiceRestriction} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_servicerestriction
     */
    get_ServiceRestriction() {
        result := ComCall(19, this, "ptr*", &ServiceRestriction := 0, "HRESULT")
        return INetFwServiceRestriction(ServiceRestriction)
    }

    /**
     * Enables or disables a specified group of firewall rules.
     * @remarks
     * When indirect strings in the form of "@C:\Program Files\Contoso Storefront\StorefrontRes.dll,-1234" are passed as parameters to the Windows Firewall with Advanced Security APIs, they should be specified by a full path.  The file should have a secure access that permits the Local Service account read access to allow the Windows Firewall Service to read the strings.  To avoid non-privileged security principals from modifying the strings, the DLLs should only allow write access to the Administrator account.
     * @param {Integer} profileTypesBitmask A bitmask of profiles from <a href="https://docs.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_profile_type2">NET_FW_PROFILE_TYPE2</a>.
     * @param {BSTR} group A string that was used to group rules together.  It can be the group name or an indirect string to the group name in the form of "@C:\Program Files\Contoso Storefront\StorefrontRes.dll,-1234".  Rules belonging to this group would be enabled or disabled.
     * @param {VARIANT_BOOL} enable Indicates whether the group of rules identified by the <i>group</i> parameter are to be enabled or disabled.
     * 
     * If this value is set to true (<b>VARIANT_TRUE</b>), the group of rules will be enabled; otherwise the group is disabled.
     * @returns {HRESULT} <h3>C++</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested group does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested group does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-enablerulegroup
     */
    EnableRuleGroup(profileTypesBitmask, group, enable) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(20, this, "int", profileTypesBitmask, BSTR, group, VARIANT_BOOL, enable, "HRESULT")
        return result
    }

    /**
     * Determines whether a specified group of firewall rules are enabled or disabled. (INetFwPolicy2.IsRuleGroupEnabled)
     * @remarks
     * When indirect strings in the form of "@yourresourcedll.dll,-23255" are passed as parameters to the Windows Firewall with Advanced Security APIs, they should either be placed under the System32 Windows directory or specified by a full path.  Further the file should have a secure access that permits the Local Service account read access to allow the Windows Firewall Service to read the strings.  To avoid non-privileged security principals from modifying the strings, the DLLs should only allow write access to the Administrator account.
     * @param {Integer} profileTypesBitmask A bitmask of profiles from <a href="https://docs.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_profile_type2">NET_FW_PROFILE_TYPE2</a>.
     * @param {BSTR} group A string that was used to group rules together.  It can be the group name or an indirect string to the group name in the form of "@yourresourcedll.dll,-23255".  Rules belonging to this group would be queried.
     * @returns {VARIANT_BOOL} Indicates whether the group of rules identified by the <i>group</i> parameter are enabled or disabled.  
     * 
     * If this value is set to true (<b>VARIANT_TRUE</b>), the group of rules is enabled; otherwise the group is disabled.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-isrulegroupenabled
     */
    IsRuleGroupEnabled(profileTypesBitmask, group) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(21, this, "int", profileTypesBitmask, BSTR, group, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Restores the local firewall configuration to its default state.
     * @returns {HRESULT} <h3>C++</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-restorelocalfirewalldefaults
     */
    RestoreLocalFirewallDefaults() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * Specifies the default action for inbound traffic. These settings are Block by default. (Get)
     * @remarks
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile, are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_DefaultInboundAction</b> and <b>put_DefaultInboundAction</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @returns {NET_FW_ACTION} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_defaultinboundaction
     */
    get_DefaultInboundAction(profileType) {
        result := ComCall(23, this, NET_FW_PROFILE_TYPE2, profileType, "int*", &action := 0, "HRESULT")
        return action
    }

    /**
     * Specifies the default action for inbound traffic. These settings are Block by default. (Put)
     * @remarks
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile, are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_DefaultInboundAction</b> and <b>put_DefaultInboundAction</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @param {NET_FW_ACTION} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_defaultinboundaction
     */
    put_DefaultInboundAction(profileType, action) {
        result := ComCall(24, this, NET_FW_PROFILE_TYPE2, profileType, NET_FW_ACTION, action, "HRESULT")
        return result
    }

    /**
     * Specifies the default action for outbound traffic. These settings are Allow by default. (Get)
     * @remarks
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_DefaultOutboundAction</b> and <b>put_DefaultOutboundAction</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @returns {NET_FW_ACTION} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_defaultoutboundaction
     */
    get_DefaultOutboundAction(profileType) {
        result := ComCall(25, this, NET_FW_PROFILE_TYPE2, profileType, "int*", &action := 0, "HRESULT")
        return action
    }

    /**
     * Specifies the default action for outbound traffic. These settings are Allow by default. (Put)
     * @remarks
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_DefaultOutboundAction</b> and <b>put_DefaultOutboundAction</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * @param {NET_FW_PROFILE_TYPE2} profileType 
     * @param {NET_FW_ACTION} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_defaultoutboundaction
     */
    put_DefaultOutboundAction(profileType, action) {
        result := ComCall(26, this, NET_FW_PROFILE_TYPE2, profileType, NET_FW_ACTION, action, "HRESULT")
        return result
    }

    /**
     * Determines whether a specified group of firewall rules are enabled or disabled. (INetFwPolicy2.get_IsRuleGroupCurrentlyEnabled)
     * @remarks
     * When indirect strings in the form of "@C:\Program Files\Contoso Storefront\StorefrontRes.dll,-1234" are passed as parameters to the Windows Firewall with Advanced Security APIs, they should be specified by a full path.  The file should have a secure access that permits the Local Service account read access to allow the Windows Firewall Service to read the strings.  To avoid non-privileged security principals from modifying the strings, the DLLs should only allow write access to the Administrator account.
     * @param {BSTR} group A string that was used to group rules together.  It can be the group name or an indirect string to the group name in the form of "@C:\Program Files\Contoso Storefront\StorefrontRes.dll,-1234".  Rules belonging to this group would be queried.
     * @returns {VARIANT_BOOL} Indicates whether the group of rules identified by the <i>group</i> parameter are enabled or disabled.  
     * 
     * If this value is set to true (<b>VARIANT_TRUE</b>), the group of rules is enabled; otherwise the group is disabled.
     * 
     * For Windows 7 and later, this value will be set to true (<b>VARIANT_TRUE</b>) if the rule group is enabled on at least one active profile.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_isrulegroupcurrentlyenabled
     */
    get_IsRuleGroupCurrentlyEnabled(group) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(27, this, BSTR, group, VARIANT_BOOL.Ptr, &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Determines if adding or setting a rule or group of rules will take effect in the current firewall profile.
     * @returns {NET_FW_MODIFY_STATE} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_localpolicymodifystate
     */
    get_LocalPolicyModifyState() {
        result := ComCall(28, this, "int*", &modifyState := 0, "HRESULT")
        return modifyState
    }

    Query(iid) {
        if (INetFwPolicy2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentProfileTypes := CallbackCreate(GetMethod(implObj, "get_CurrentProfileTypes"), flags, 2)
        this.vtbl.get_FirewallEnabled := CallbackCreate(GetMethod(implObj, "get_FirewallEnabled"), flags, 3)
        this.vtbl.put_FirewallEnabled := CallbackCreate(GetMethod(implObj, "put_FirewallEnabled"), flags, 3)
        this.vtbl.get_ExcludedInterfaces := CallbackCreate(GetMethod(implObj, "get_ExcludedInterfaces"), flags, 3)
        this.vtbl.put_ExcludedInterfaces := CallbackCreate(GetMethod(implObj, "put_ExcludedInterfaces"), flags, 3)
        this.vtbl.get_BlockAllInboundTraffic := CallbackCreate(GetMethod(implObj, "get_BlockAllInboundTraffic"), flags, 3)
        this.vtbl.put_BlockAllInboundTraffic := CallbackCreate(GetMethod(implObj, "put_BlockAllInboundTraffic"), flags, 3)
        this.vtbl.get_NotificationsDisabled := CallbackCreate(GetMethod(implObj, "get_NotificationsDisabled"), flags, 3)
        this.vtbl.put_NotificationsDisabled := CallbackCreate(GetMethod(implObj, "put_NotificationsDisabled"), flags, 3)
        this.vtbl.get_UnicastResponsesToMulticastBroadcastDisabled := CallbackCreate(GetMethod(implObj, "get_UnicastResponsesToMulticastBroadcastDisabled"), flags, 3)
        this.vtbl.put_UnicastResponsesToMulticastBroadcastDisabled := CallbackCreate(GetMethod(implObj, "put_UnicastResponsesToMulticastBroadcastDisabled"), flags, 3)
        this.vtbl.get_Rules := CallbackCreate(GetMethod(implObj, "get_Rules"), flags, 2)
        this.vtbl.get_ServiceRestriction := CallbackCreate(GetMethod(implObj, "get_ServiceRestriction"), flags, 2)
        this.vtbl.EnableRuleGroup := CallbackCreate(GetMethod(implObj, "EnableRuleGroup"), flags, 4)
        this.vtbl.IsRuleGroupEnabled := CallbackCreate(GetMethod(implObj, "IsRuleGroupEnabled"), flags, 4)
        this.vtbl.RestoreLocalFirewallDefaults := CallbackCreate(GetMethod(implObj, "RestoreLocalFirewallDefaults"), flags, 1)
        this.vtbl.get_DefaultInboundAction := CallbackCreate(GetMethod(implObj, "get_DefaultInboundAction"), flags, 3)
        this.vtbl.put_DefaultInboundAction := CallbackCreate(GetMethod(implObj, "put_DefaultInboundAction"), flags, 3)
        this.vtbl.get_DefaultOutboundAction := CallbackCreate(GetMethod(implObj, "get_DefaultOutboundAction"), flags, 3)
        this.vtbl.put_DefaultOutboundAction := CallbackCreate(GetMethod(implObj, "put_DefaultOutboundAction"), flags, 3)
        this.vtbl.get_IsRuleGroupCurrentlyEnabled := CallbackCreate(GetMethod(implObj, "get_IsRuleGroupCurrentlyEnabled"), flags, 3)
        this.vtbl.get_LocalPolicyModifyState := CallbackCreate(GetMethod(implObj, "get_LocalPolicyModifyState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentProfileTypes)
        CallbackFree(this.vtbl.get_FirewallEnabled)
        CallbackFree(this.vtbl.put_FirewallEnabled)
        CallbackFree(this.vtbl.get_ExcludedInterfaces)
        CallbackFree(this.vtbl.put_ExcludedInterfaces)
        CallbackFree(this.vtbl.get_BlockAllInboundTraffic)
        CallbackFree(this.vtbl.put_BlockAllInboundTraffic)
        CallbackFree(this.vtbl.get_NotificationsDisabled)
        CallbackFree(this.vtbl.put_NotificationsDisabled)
        CallbackFree(this.vtbl.get_UnicastResponsesToMulticastBroadcastDisabled)
        CallbackFree(this.vtbl.put_UnicastResponsesToMulticastBroadcastDisabled)
        CallbackFree(this.vtbl.get_Rules)
        CallbackFree(this.vtbl.get_ServiceRestriction)
        CallbackFree(this.vtbl.EnableRuleGroup)
        CallbackFree(this.vtbl.IsRuleGroupEnabled)
        CallbackFree(this.vtbl.RestoreLocalFirewallDefaults)
        CallbackFree(this.vtbl.get_DefaultInboundAction)
        CallbackFree(this.vtbl.put_DefaultInboundAction)
        CallbackFree(this.vtbl.get_DefaultOutboundAction)
        CallbackFree(this.vtbl.put_DefaultOutboundAction)
        CallbackFree(this.vtbl.get_IsRuleGroupCurrentlyEnabled)
        CallbackFree(this.vtbl.get_LocalPolicyModifyState)
    }
}
