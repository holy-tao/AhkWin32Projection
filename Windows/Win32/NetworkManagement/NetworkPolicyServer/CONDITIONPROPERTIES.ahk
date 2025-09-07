#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the CONDITIONPROPERTIES enumeration type specify the properties of a Network Access Policy (NAP) condition.
 * @remarks
 * The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/ne-sdoias-policyproperties">POLICYPROPERTIES</a> enumeration type contains the value PROPERTY_POLICY_CONDITIONS_COLLECTION, which is the property for the conditions collection.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-conditionproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class CONDITIONPROPERTIES{

    /**
     * The text of the NAP condition.
     * @type {Integer (Int32)}
     */
    static PROPERTY_CONDITION_TEXT => 1024
}
