#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The values of the RADIUSPROPERTIES enumeration type enumerate properties of the Microsoft RADIUS protocol SDO.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-radiusproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
export default struct RADIUSPROPERTIES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The TCP port used for RADIUS accounting.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUS_ACCOUNTING_PORT => 1027

    /**
     * The TCP port used for RADIUS authentication.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUS_AUTHENTICATION_PORT => 1028

    /**
     * The collection of clients for this RADIUS server.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUS_CLIENTS_COLLECTION => 1029

    /**
     * The collection of vendors for this RADIUS server.
     * @type {Integer (Int32)}
     */
    static PROPERTY_RADIUS_VENDORS_COLLECTION => 1030
}
