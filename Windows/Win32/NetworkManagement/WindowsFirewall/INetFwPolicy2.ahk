#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} profileTypesBitmask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_currentprofiletypes
     */
    get_CurrentProfileTypes(profileTypesBitmask) {
        result := ComCall(7, this, "int*", profileTypesBitmask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_firewallenabled
     */
    get_FirewallEnabled(profileType, enabled) {
        result := ComCall(8, this, "int", profileType, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_firewallenabled
     */
    put_FirewallEnabled(profileType, enabled) {
        result := ComCall(9, this, "int", profileType, "short", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT>} interfaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_excludedinterfaces
     */
    get_ExcludedInterfaces(profileType, interfaces) {
        result := ComCall(10, this, "int", profileType, "ptr", interfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT} interfaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_excludedinterfaces
     */
    put_ExcludedInterfaces(profileType, interfaces) {
        result := ComCall(11, this, "int", profileType, "ptr", interfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT_BOOL>} Block 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_blockallinboundtraffic
     */
    get_BlockAllInboundTraffic(profileType, Block) {
        result := ComCall(12, this, "int", profileType, "ptr", Block, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} Block 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_blockallinboundtraffic
     */
    put_BlockAllInboundTraffic(profileType, Block) {
        result := ComCall(13, this, "int", profileType, "short", Block, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT_BOOL>} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_notificationsdisabled
     */
    get_NotificationsDisabled(profileType, disabled) {
        result := ComCall(14, this, "int", profileType, "ptr", disabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_notificationsdisabled
     */
    put_NotificationsDisabled(profileType, disabled) {
        result := ComCall(15, this, "int", profileType, "short", disabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT_BOOL>} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_unicastresponsestomulticastbroadcastdisabled
     */
    get_UnicastResponsesToMulticastBroadcastDisabled(profileType, disabled) {
        result := ComCall(16, this, "int", profileType, "ptr", disabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_unicastresponsestomulticastbroadcastdisabled
     */
    put_UnicastResponsesToMulticastBroadcastDisabled(profileType, disabled) {
        result := ComCall(17, this, "int", profileType, "short", disabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INetFwRules>} rules 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_rules
     */
    get_Rules(rules) {
        result := ComCall(18, this, "ptr*", rules, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INetFwServiceRestriction>} ServiceRestriction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_servicerestriction
     */
    get_ServiceRestriction(ServiceRestriction) {
        result := ComCall(19, this, "ptr*", ServiceRestriction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileTypesBitmask 
     * @param {BSTR} group 
     * @param {VARIANT_BOOL} enable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-enablerulegroup
     */
    EnableRuleGroup(profileTypesBitmask, group, enable) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(20, this, "int", profileTypesBitmask, "ptr", group, "short", enable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileTypesBitmask 
     * @param {BSTR} group 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-isrulegroupenabled
     */
    IsRuleGroupEnabled(profileTypesBitmask, group, enabled) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(21, this, "int", profileTypesBitmask, "ptr", group, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-restorelocalfirewalldefaults
     */
    RestoreLocalFirewallDefaults() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<Integer>} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_defaultinboundaction
     */
    get_DefaultInboundAction(profileType, action) {
        result := ComCall(23, this, "int", profileType, "int*", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Integer} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_defaultinboundaction
     */
    put_DefaultInboundAction(profileType, action) {
        result := ComCall(24, this, "int", profileType, "int", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<Integer>} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_defaultoutboundaction
     */
    get_DefaultOutboundAction(profileType, action) {
        result := ComCall(25, this, "int", profileType, "int*", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Integer} action 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-put_defaultoutboundaction
     */
    put_DefaultOutboundAction(profileType, action) {
        result := ComCall(26, this, "int", profileType, "int", action, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} group 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_isrulegroupcurrentlyenabled
     */
    get_IsRuleGroupCurrentlyEnabled(group, enabled) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(27, this, "ptr", group, "ptr", enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} modifyState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwpolicy2-get_localpolicymodifystate
     */
    get_LocalPolicyModifyState(modifyState) {
        result := ComCall(28, this, "int*", modifyState, "HRESULT")
        return result
    }
}
