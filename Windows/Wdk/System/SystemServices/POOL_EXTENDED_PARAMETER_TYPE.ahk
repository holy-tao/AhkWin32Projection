#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POOL_EXTENDED_PARAMETER_TYPE {
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
    static PoolExtendedParameterInvalidType => 0

    /**
     * @type {Integer (Int32)}
     */
    static PoolExtendedParameterPriority => 1

    /**
     * @type {Integer (Int32)}
     */
    static PoolExtendedParameterSecurePool => 2

    /**
     * @type {Integer (Int32)}
     */
    static PoolExtendedParameterNumaNode => 3

    /**
     * @type {Integer (Int32)}
     */
    static PoolExtendedParameterMax => 4
}
