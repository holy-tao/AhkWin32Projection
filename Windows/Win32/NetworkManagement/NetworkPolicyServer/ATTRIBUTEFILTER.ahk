#Requires AutoHotkey v2.0.0 64-bit

/**
 * The usage cases for the NPS dictionary attributes.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-attributefilter
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ATTRIBUTEFILTER{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_FILTER_NONE => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_FILTER_VPN_DIALUP => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_FILTER_IEEE_802_1x => 2
}
