#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the POLICYPROPERTIES enumeration type enumerate properties of a Network Access Policy (NAP).
 * @remarks
 * 
 * To create a new policy, you must specify a unique name for the policy, a profile to associate with the policy, 
 *     and a collection of conditions for the policy. The name of the policy and the name of the profile should be 
 *     identical.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-policyproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class POLICYPROPERTIES extends Win32Enum{

    /**
     * String that contains all the text of the conditions.
     * 
     * Do not use this property to access the Conditions; use the 
     *        <b>PROPERTY_POLICY_CONDITIONS_COLLECTION</b> instead.
     * @type {Integer (Int32)}
     */
    static PROPERTY_POLICY_CONSTRAINT => 1024

    /**
     * Specifies the relative position of this policy with respect to other policies.
     * 
     * In the UI, the upper-most policy in the UI has a merit value of 1, the next one down has a merit value of 2, 
     *        and so on.
     * 
     * You cannot set the merit value of a policy when you first create the object. A new policy object is always 
     *        applied in the same merit location. To order your policies, create the policy object and set its values. Apply 
     *        all the changes to the object, and then set the appropriate merit value and apply the changes.
     * @type {Integer (Int32)}
     */
    static PROPERTY_POLICY_MERIT => 1025

    /**
     * This property is reserved.
     * @type {Integer (Int32)}
     */
    static PROPERTY_POLICY_UNUSED0 => 1026

    /**
     * This property is reserved.
     * @type {Integer (Int32)}
     */
    static PROPERTY_POLICY_UNUSED1 => 1027

    /**
     * Specifies the profile name. This property is used by the system to associate the policy with the 
     *       profile.
     * @type {Integer (Int32)}
     */
    static PROPERTY_POLICY_PROFILE_NAME => 1028

    /**
     * Specifies the name of the profile associated with the policy. This property is not currently used. Use 
     *       <b>PROPERTY_POLICY_PROFILE_NAME</b> instead.
     * @type {Integer (Int32)}
     */
    static PROPERTY_POLICY_ACTION => 1029

    /**
     * Specifies the conditions for this network access policy.
     * @type {Integer (Int32)}
     */
    static PROPERTY_POLICY_CONDITIONS_COLLECTION => 1030

    /**
     * Used by NPS user interface in policy evaluation. If the policy is not enabled, its configuration is present 
     *        but it is not applied.
     * @type {Integer (Int32)}
     */
    static PROPERTY_POLICY_ENABLED => 1031

    /**
     * Used by NPS user interface to tag a set of policies to be applicable only for a specified kind of RADIUS 
     *        client (or source). For example, a policy tagged by "DHCP Server."
     * @type {Integer (Int32)}
     */
    static PROPERTY_POLICY_SOURCETAG => 1032
}
