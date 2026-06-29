#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the SHVTEMPLATEPROPERTIES enumeration type enumerate the properties of a System Health Validator (SHV) template.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-shvtemplateproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct SHVTEMPLATEPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_SHV_COMBINATION_TYPE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_SHV_LIST => 1025

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_SHVCONFIG_LIST => 1026
}
