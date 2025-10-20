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
     * 
     * @param {Pointer<Int32>} profileTypesBitmask 
     * @returns {HRESULT} 
     */
    get_CurrentProfileTypes(profileTypesBitmask) {
        result := ComCall(7, this, "int*", profileTypesBitmask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    get_FirewallEnabled(profileType, enabled) {
        result := ComCall(8, this, "int", profileType, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} enabled 
     * @returns {HRESULT} 
     */
    put_FirewallEnabled(profileType, enabled) {
        result := ComCall(9, this, "int", profileType, "short", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT>} interfaces 
     * @returns {HRESULT} 
     */
    get_ExcludedInterfaces(profileType, interfaces) {
        result := ComCall(10, this, "int", profileType, "ptr", interfaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT} interfaces 
     * @returns {HRESULT} 
     */
    put_ExcludedInterfaces(profileType, interfaces) {
        result := ComCall(11, this, "int", profileType, "ptr", interfaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT_BOOL>} Block 
     * @returns {HRESULT} 
     */
    get_BlockAllInboundTraffic(profileType, Block) {
        result := ComCall(12, this, "int", profileType, "ptr", Block, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} Block 
     * @returns {HRESULT} 
     */
    put_BlockAllInboundTraffic(profileType, Block) {
        result := ComCall(13, this, "int", profileType, "short", Block, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT_BOOL>} disabled 
     * @returns {HRESULT} 
     */
    get_NotificationsDisabled(profileType, disabled) {
        result := ComCall(14, this, "int", profileType, "ptr", disabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     */
    put_NotificationsDisabled(profileType, disabled) {
        result := ComCall(15, this, "int", profileType, "short", disabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<VARIANT_BOOL>} disabled 
     * @returns {HRESULT} 
     */
    get_UnicastResponsesToMulticastBroadcastDisabled(profileType, disabled) {
        result := ComCall(16, this, "int", profileType, "ptr", disabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {VARIANT_BOOL} disabled 
     * @returns {HRESULT} 
     */
    put_UnicastResponsesToMulticastBroadcastDisabled(profileType, disabled) {
        result := ComCall(17, this, "int", profileType, "short", disabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwRules>} rules 
     * @returns {HRESULT} 
     */
    get_Rules(rules) {
        result := ComCall(18, this, "ptr", rules, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetFwServiceRestriction>} ServiceRestriction 
     * @returns {HRESULT} 
     */
    get_ServiceRestriction(ServiceRestriction) {
        result := ComCall(19, this, "ptr", ServiceRestriction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileTypesBitmask 
     * @param {BSTR} group 
     * @param {VARIANT_BOOL} enable 
     * @returns {HRESULT} 
     */
    EnableRuleGroup(profileTypesBitmask, group, enable) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(20, this, "int", profileTypesBitmask, "ptr", group, "short", enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileTypesBitmask 
     * @param {BSTR} group 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    IsRuleGroupEnabled(profileTypesBitmask, group, enabled) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(21, this, "int", profileTypesBitmask, "ptr", group, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestoreLocalFirewallDefaults() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<Int32>} action 
     * @returns {HRESULT} 
     */
    get_DefaultInboundAction(profileType, action) {
        result := ComCall(23, this, "int", profileType, "int*", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    put_DefaultInboundAction(profileType, action) {
        result := ComCall(24, this, "int", profileType, "int", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Pointer<Int32>} action 
     * @returns {HRESULT} 
     */
    get_DefaultOutboundAction(profileType, action) {
        result := ComCall(25, this, "int", profileType, "int*", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} profileType 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    put_DefaultOutboundAction(profileType, action) {
        result := ComCall(26, this, "int", profileType, "int", action, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} group 
     * @param {Pointer<VARIANT_BOOL>} enabled 
     * @returns {HRESULT} 
     */
    get_IsRuleGroupCurrentlyEnabled(group, enabled) {
        group := group is String ? BSTR.Alloc(group).Value : group

        result := ComCall(27, this, "ptr", group, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} modifyState 
     * @returns {HRESULT} 
     */
    get_LocalPolicyModifyState(modifyState) {
        result := ComCall(28, this, "int*", modifyState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
