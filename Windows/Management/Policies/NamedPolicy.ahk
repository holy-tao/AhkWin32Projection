#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INamedPolicyStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides functionality to get Mobile Device Management (MDM) policy information. Named policies use a two-part naming system, `Area` and `Name`. The set of polcies that are supported are defined in [Policy CSP](/windows/client-management/mdm/policy-configuration-service-provider#policies).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicy
 * @namespace Windows.Management.Policies
 * @version WindowsRuntime 1.4
 */
class NamedPolicy extends IInspectable {
;@region Static Methods
    /**
     * Gets the valid MDM policy information given a specified policy name and area name.
     * @remarks
     * For a complete list of valid area names and policy names, see the Policy Tables in [Policy CSP](/windows/client-management/mdm/policy-configuration-service-provider).
     * @param {HSTRING} area A string representing the area name for a policy.
     * @param {HSTRING} name A string representing the name of the policy.
     * @returns {NamedPolicyData} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicy.getpolicyfrompath
     */
    static GetPolicyFromPath(area, name) {
        if (!NamedPolicy.HasProp("__INamedPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Policies.NamedPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INamedPolicyStatics.IID)
            NamedPolicy.__INamedPolicyStatics := INamedPolicyStatics(factoryPtr)
        }

        return NamedPolicy.__INamedPolicyStatics.GetPolicyFromPath(area, name)
    }

    /**
     * Gets a valid MDM user policy given the specified MDM policy name and area name. This gets a policy specific to a user, whereas [GetPolicyFromPath](namedpolicy_getpolicyfrompath_340705329.md) gets a global policy.
     * @param {User} user_ The user data for user policies.
     * @param {HSTRING} area A string representing the area name for a policy.
     * @param {HSTRING} name A string representing the name of the policy.
     * @returns {NamedPolicyData} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicy.getpolicyfrompathforuser
     */
    static GetPolicyFromPathForUser(user_, area, name) {
        if (!NamedPolicy.HasProp("__INamedPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Policies.NamedPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INamedPolicyStatics.IID)
            NamedPolicy.__INamedPolicyStatics := INamedPolicyStatics(factoryPtr)
        }

        return NamedPolicy.__INamedPolicyStatics.GetPolicyFromPathForUser(user_, area, name)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
