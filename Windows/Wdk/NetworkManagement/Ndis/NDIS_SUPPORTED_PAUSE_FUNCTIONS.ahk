#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_SUPPORTED_PAUSE_FUNCTIONS {
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
    static NdisPauseFunctionsUnsupported => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisPauseFunctionsSendOnly => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisPauseFunctionsReceiveOnly => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisPauseFunctionsSendAndReceive => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisPauseFunctionsUnknown => 4
}
