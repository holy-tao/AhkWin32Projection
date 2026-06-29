#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PARAMETER_TYPE {
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
    static NdisParameterInteger => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisParameterHexInteger => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisParameterString => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisParameterMultiString => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisParameterBinary => 4
}
