#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the NAPPROPERTIES enumeration type specify properties for Network Access Policies (NAP).
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-napproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class NAPPROPERTIES extends Win32Enum{

    /**
     * The network access policies collection.
     * @type {Integer (Int32)}
     */
    static PROPERTY_NAP_POLICIES_COLLECTION => 1026

    /**
     * Collection of System Health Validator (SHV) templates. See <a href="https://docs.microsoft.com/windows/desktop/NAP/network-access-protection-start-page">NAP documentation</a> for more information on SHV.
     * @type {Integer (Int32)}
     */
    static PROPERTY_SHV_TEMPLATES_COLLECTION => 1027
}
