#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PROFILEPROPERTIES enumeration type enumerates properties associated with a profile.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-profileproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct PROFILEPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The attributes associated with the profile.
     * @type {Integer (Int32)}
     */
    static PROPERTY_PROFILE_ATTRIBUTES_COLLECTION => 1024

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_PROFILE_IPFILTER_TEMPLATE_GUID => 1025
}
