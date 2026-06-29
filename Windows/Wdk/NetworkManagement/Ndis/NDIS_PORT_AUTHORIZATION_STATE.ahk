#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PORT_AUTHORIZATION_STATE {
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
    static NdisPortAuthorizationUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisPortAuthorized => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisPortUnauthorized => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisPortReauthorizing => 3
}
