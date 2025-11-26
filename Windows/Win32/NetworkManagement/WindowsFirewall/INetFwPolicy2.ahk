#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\INetFwRules.ahk
#Include .\INetFwServiceRestriction.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * To access the firewall policy.
 * @remarks
 * 
 * All configuration changes take effect immediately.
 * 
 * The Windows Firewall/Internet Connection Sharing  service must be running to access this interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwpolicy2
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwPolicy2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwPolicy2
     * @type {Guid}
     */
    static IID => Guid("{98325047-c671-4174-8d81-defcd3f03186}")

    /**
     * The class identifier for NetFwPolicy2
     * @type {Guid}
     */
    static CLSID => Guid("{e2b3c97f-6ae1-41ac-817a-f6f92166d7dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentProfileTypes", "get_FirewallEnabled", "put_FirewallEnabled", "get_ExcludedInterfaces", "put_ExcludedInterfaces", "get_BlockAllInboundTraffic", "put_BlockAllInboundTraffic", "get_NotificationsDisabled", "put_NotificationsDisabled", "get_UnicastResponsesToMulticastBroadcastDisabled", "put_UnicastResponsesToMulticastBroadcastDisabled", "get_Rules", "get_ServiceRestriction", "EnableRuleGroup", "IsRuleGroupEnabled", "RestoreLocalFirewallDefaults", "get_DefaultInboundAction", "put_DefaultInboundAction", "get_DefaultOutboundAction", "put_DefaultOutboundAction", "get_IsRuleGroupCurrentlyEnabled", "get_LocalPolicyModifyState"]

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
     * @type {Integer} 
     */
    LocalPolicyModifyState {
        get => this.get_LocalPolicyModifyState()
    }

    /**
     * Retrieves the currently active firewall profile.
     * @remarks
     * 
     * Multiple profiles can be returned in the profiles bitmask.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes
     */
    get_CurrentProfileTypes() {
        result := ComCall(7, this, "int*", &profileTypesBitmask := 0, "HRESULT")
        return profileTypesBitmask
    }

    /**
     * Indicates whether a firewall is enabled locally (the effective result may differ due to group policy settings).
     * @remarks
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_FirewallEnabled</b> and <b>put_FirewallEnabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_firewallenabled
     */
    get_FirewallEnabled(profileType) {
        result := ComCall(8, this, "int", profileType, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Indicates whether a firewall is enabled locally (the effective result may differ due to group policy settings).
     * @remarks
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_FirewallEnabled</b> and <b>put_FirewallEnabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-put_firewallenabled
     */
    put_FirewallEnabled(profileType, enabled) {
        result := ComCall(9, this, "int", profileType, "short", enabled, "HRESULT")
        return result
    }

    /**
     * Specifies a list of interfaces on which firewall settings are excluded.
     * @remarks
     * 
     * An excluded interface is an interface to which the firewall is not applicable.  The firewall is not applicable to any traffic received from or sent to an excluded interface. An empty list indicates that there are no excluded interfaces.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_ExcludedInterfaces</b> and <b>put_ExcludedInterfaces</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_excludedinterfaces
     */
    get_ExcludedInterfaces(profileType) {
        interfaces := VARIANT()
        result := ComCall(10, this, "int", profileType, "ptr", interfaces, "HRESULT")
        return interfaces
    }

    /**
     * Specifies a list of interfaces on which firewall settings are excluded.
     * @remarks
     * 
     * An excluded interface is an interface to which the firewall is not applicable.  The firewall is not applicable to any traffic received from or sent to an excluded interface. An empty list indicates that there are no excluded interfaces.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_ExcludedInterfaces</b> and <b>put_ExcludedInterfaces</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @param {VARIANT} interfaces 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-put_excludedinterfaces
     */
    put_ExcludedInterfaces(profileType, interfaces) {
        result := ComCall(11, this, "int", profileType, "ptr", interfaces, "HRESULT")
        return result
    }

    /**
     * Indicates whether the firewall should not allow inbound traffic.
     * @remarks
     * 
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_BlockAllInboundTraffic</b> and <b>put_BlockAllInboundTraffic</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_blockallinboundtraffic
     */
    get_BlockAllInboundTraffic(profileType) {
        result := ComCall(12, this, "int", profileType, "short*", &Block := 0, "HRESULT")
        return Block
    }

    /**
     * Indicates whether the firewall should not allow inbound traffic.
     * @remarks
     * 
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_BlockAllInboundTraffic</b> and <b>put_BlockAllInboundTraffic</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} Block 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-put_blockallinboundtraffic
     */
    put_BlockAllInboundTraffic(profileType, Block) {
        result := ComCall(13, this, "int", profileType, "short", Block, "HRESULT")
        return result
    }

    /**
     * Indicates whether interactive firewall notifications are disabled.
     * @remarks
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_NotificationsDisabled</b> and <b>put_NotificationsDisabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_notificationsdisabled
     */
    get_NotificationsDisabled(profileType) {
        result := ComCall(14, this, "int", profileType, "short*", &disabled := 0, "HRESULT")
        return disabled
    }

    /**
     * Indicates whether interactive firewall notifications are disabled.
     * @remarks
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_NotificationsDisabled</b> and <b>put_NotificationsDisabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-put_notificationsdisabled
     */
    put_NotificationsDisabled(profileType, disabled) {
        result := ComCall(15, this, "int", profileType, "short", disabled, "HRESULT")
        return result
    }

    /**
     * Indicates whether the firewall should not allow unicast responses to multicast and broadcast traffic.
     * @remarks
     * 
     * If a computer sends a broadcast packet, a unicast response is allowed for three seconds. Use this property to change this behavior.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property (<b>get_CurrentProfileTypes</b>), make sure that you pass only one profile type to <b>get_UnicastResponsesToMulticastBroadcastDisabled</b> and <b>put_UnicastResponsesToMulticastBroadcastDisabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_unicastresponsestomulticastbroadcastdisabled
     */
    get_UnicastResponsesToMulticastBroadcastDisabled(profileType) {
        result := ComCall(16, this, "int", profileType, "short*", &disabled := 0, "HRESULT")
        return disabled
    }

    /**
     * Indicates whether the firewall should not allow unicast responses to multicast and broadcast traffic.
     * @remarks
     * 
     * If a computer sends a broadcast packet, a unicast response is allowed for three seconds. Use this property to change this behavior.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property (<b>get_CurrentProfileTypes</b>), make sure that you pass only one profile type to <b>get_UnicastResponsesToMulticastBroadcastDisabled</b> and <b>put_UnicastResponsesToMulticastBroadcastDisabled</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-put_unicastresponsestomulticastbroadcastdisabled
     */
    put_UnicastResponsesToMulticastBroadcastDisabled(profileType, disabled) {
        result := ComCall(17, this, "int", profileType, "short", disabled, "HRESULT")
        return result
    }

    /**
     * Retrieves the collection of firewall rules.
     * @returns {INetFwRules} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_rules
     */
    get_Rules() {
        result := ComCall(18, this, "ptr*", &rules := 0, "HRESULT")
        return INetFwRules(rules)
    }

    /**
     * Retrieves the interface used to access the Windows Service Hardening store.
     * @returns {INetFwServiceRestriction} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_servicerestriction
     */
    get_ServiceRestriction() {
        result := ComCall(19, this, "ptr*", &ServiceRestriction := 0, "HRESULT")
        return INetFwServiceRestriction(ServiceRestriction)
    }

    /**
     * Enables or disables a specified group of firewall rules.
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
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-enablerulegroup
     */
    EnableRuleGroup(profileTypesBitmask, group, enable) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(20, this, "int", profileTypesBitmask, "ptr", group, "short", enable, "HRESULT")
        return result
    }

    /**
     * Determines whether a specified group of firewall rules are enabled or disabled.
     * @param {Integer} profileTypesBitmask A bitmask of profiles from <a href="https://docs.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_profile_type2">NET_FW_PROFILE_TYPE2</a>.
     * @param {BSTR} group A string that was used to group rules together.  It can be the group name or an indirect string to the group name in the form of "@yourresourcedll.dll,-23255".  Rules belonging to this group would be queried.
     * @returns {VARIANT_BOOL} Indicates whether the group of rules identified by the <i>group</i> parameter are enabled or disabled.  
     * 
     * If this value is set to true (<b>VARIANT_TRUE</b>), the group of rules is enabled; otherwise the group is disabled.
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-isrulegroupenabled
     */
    IsRuleGroupEnabled(profileTypesBitmask, group) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(21, this, "int", profileTypesBitmask, "ptr", group, "short*", &enabled := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-restorelocalfirewalldefaults
     */
    RestoreLocalFirewallDefaults() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * Specifies the default action for inbound traffic. These settings are Block by default.
     * @remarks
     * 
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile, are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_DefaultInboundAction</b> and <b>put_DefaultInboundAction</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_defaultinboundaction
     */
    get_DefaultInboundAction(profileType) {
        result := ComCall(23, this, "int", profileType, "int*", &action := 0, "HRESULT")
        return action
    }

    /**
     * Specifies the default action for inbound traffic. These settings are Block by default.
     * @remarks
     * 
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile, are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_DefaultInboundAction</b> and <b>put_DefaultInboundAction</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @param {Integer} action 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-put_defaultinboundaction
     */
    put_DefaultInboundAction(profileType, action) {
        result := ComCall(24, this, "int", profileType, "int", action, "HRESULT")
        return result
    }

    /**
     * Specifies the default action for outbound traffic. These settings are Allow by default.
     * @remarks
     * 
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_DefaultOutboundAction</b> and <b>put_DefaultOutboundAction</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_defaultoutboundaction
     */
    get_DefaultOutboundAction(profileType) {
        result := ComCall(25, this, "int", profileType, "int*", &action := 0, "HRESULT")
        return action
    }

    /**
     * Specifies the default action for outbound traffic. These settings are Allow by default.
     * @remarks
     * 
     * All interfaces are firewall-enabled. This means that all the exceptions (such as GloballyOpenPorts, Applications, or Services) which are  specified in the profile are ignored
     *    and only locally-initiated traffic is allowed.
     * 
     * When you pass a profile type obtained from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes">CurrentProfileTypes</a> property, make sure that you pass only one profile type to <b>get_DefaultOutboundAction</b> and <b>put_DefaultOutboundAction</b>. Note that <b>get_CurrentProfileTypes</b> can return multiple profiles.
     * 
     * 
     * @param {Integer} profileType 
     * @param {Integer} action 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-put_defaultoutboundaction
     */
    put_DefaultOutboundAction(profileType, action) {
        result := ComCall(26, this, "int", profileType, "int", action, "HRESULT")
        return result
    }

    /**
     * Determines whether a specified group of firewall rules are enabled or disabled.
     * @param {BSTR} group A string that was used to group rules together.  It can be the group name or an indirect string to the group name in the form of "@C:\Program Files\Contoso Storefront\StorefrontRes.dll,-1234".  Rules belonging to this group would be queried.
     * @returns {VARIANT_BOOL} Indicates whether the group of rules identified by the <i>group</i> parameter are enabled or disabled.  
     * 
     * If this value is set to true (<b>VARIANT_TRUE</b>), the group of rules is enabled; otherwise the group is disabled.
     * 
     * For Windows 7 and later, this value will be set to true (<b>VARIANT_TRUE</b>) if the rule group is enabled on at least one active profile.
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_isrulegroupcurrentlyenabled
     */
    get_IsRuleGroupCurrentlyEnabled(group) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(27, this, "ptr", group, "short*", &enabled := 0, "HRESULT")
        return enabled
    }

    /**
     * Determines if adding or setting a rule or group of rules will take effect in the current firewall profile.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwpolicy2-get_localpolicymodifystate
     */
    get_LocalPolicyModifyState() {
        result := ComCall(28, this, "int*", &modifyState := 0, "HRESULT")
        return modifyState
    }
}
