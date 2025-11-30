#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values in the RADIUSPROXYPROPERTIES enumeration type enumerate properties related to the RADIUS proxy service.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-radiusproxyproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUSPROXYPROPERTIES extends Win32Enum{

    /**
     * The collection of RADIUS proxy server groups.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSPROXY_SERVERGROUPS => 1026
}
