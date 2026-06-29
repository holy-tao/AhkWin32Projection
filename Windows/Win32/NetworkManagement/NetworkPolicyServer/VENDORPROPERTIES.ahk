#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the VENDORPROPERTIES enumeration type specify properties of objects in the vendors collection.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-vendorproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct VENDORPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The SMI Network Management Private Enterprise Code assigned to this vendor by the Internet Assigned Numbers Authority (IANA).
     * @type {Integer (Int32)}
     */
    static PROPERTY_NAS_VENDOR_ID => 1024
}
