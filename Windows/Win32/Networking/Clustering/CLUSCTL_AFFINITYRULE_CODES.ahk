#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSCTL_AFFINITYRULE_CODES {
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
    static CLUSCTL_AFFINITYRULE_GET_COMMON_PROPERTIES => 150995033

    /**
     * @type {Integer (Int32)}
     */
    static CLUSCTL_AFFINITYRULE_GET_RO_COMMON_PROPERTIES => 150995029

    /**
     * @type {Integer (Int32)}
     */
    static CLUSCTL_AFFINITYRULE_SET_COMMON_PROPERTIES => 155189342

    /**
     * @type {Integer (Int32)}
     */
    static CLUSCTL_AFFINITYRULE_GET_ID => 150995001

    /**
     * @type {Integer (Int32)}
     */
    static CLUSCTL_AFFINITYRULE_GET_GROUPNAMES => 151006577
}
