#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The usage cases for the NPS dictionary attributes.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-attributefilter
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct ATTRIBUTEFILTER {
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
    static ATTRIBUTE_FILTER_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_FILTER_VPN_DIALUP => 1

    /**
     * @type {Integer (Int32)}
     */
    static ATTRIBUTE_FILTER_IEEE_802_1x => 2
}
