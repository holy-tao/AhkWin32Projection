#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct TEMPLATESPROPERTIES {
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
    static PROPERTY_TEMPLATES_POLICIES_TEMPLATES => 1024

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_PROFILES_TEMPLATES => 1025

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_PROFILES_COLLECTION => 1026

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_PROXYPOLICIES_TEMPLATES => 1027

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_PROXYPROFILES_TEMPLATES => 1028

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_PROXYPROFILES_COLLECTION => 1029

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_REMEDIATIONSERVERGROUPS_TEMPLATES => 1030

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_SHVTEMPLATES_TEMPLATES => 1031

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_CLIENTS_TEMPLATES => 1032

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_RADIUSSERVERS_TEMPLATES => 1033

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_SHAREDSECRETS_TEMPLATES => 1034

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_TEMPLATES_IPFILTERS_TEMPLATES => 1035
}
