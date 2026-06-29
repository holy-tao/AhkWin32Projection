#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the ATTRIBUTERESTRICTIONS enumeration type specify restrictions on how a particular attribute can be used.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-attributerestrictions
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct ATTRIBUTERESTRICTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies whether the attribute is multivalued.
     * @type {Integer (Int32)}
     */
    static MULTIVALUED => 1

    /**
     * Specifies whether the attribute is allowed in a Network Access Policy (NAP) profile.
     * @type {Integer (Int32)}
     */
    static ALLOWEDINPROFILE => 2

    /**
     * Specifies whether the attribute is allowed in an NAP condition.
     * @type {Integer (Int32)}
     */
    static ALLOWEDINCONDITION => 4

    /**
     * Specifies whether the attribute is allowed in an NAP profile for a network request proxy.
     * @type {Integer (Int32)}
     */
    static ALLOWEDINPROXYPROFILE => 8

    /**
     * Specifies whether the attribute is allowed in an NAP condition for a network request proxy.
     * @type {Integer (Int32)}
     */
    static ALLOWEDINPROXYCONDITION => 16

    /**
     * Specifies whether the attribute is allowed in a VPN dialup connection.
     * @type {Integer (Int32)}
     */
    static ALLOWEDINVPNDIALUP => 32

    /**
     * Specifies whether the attribute is allowed in an 8021x connection.
     * @type {Integer (Int32)}
     */
    static ALLOWEDIN8021X => 64
}
