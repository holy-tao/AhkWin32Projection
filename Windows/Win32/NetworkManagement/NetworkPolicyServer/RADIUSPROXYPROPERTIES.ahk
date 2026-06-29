#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values in the RADIUSPROXYPROPERTIES enumeration type enumerate properties related to the RADIUS proxy service.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-radiusproxyproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct RADIUSPROXYPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The collection of RADIUS proxy server groups.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUSPROXY_SERVERGROUPS => 1026
}
