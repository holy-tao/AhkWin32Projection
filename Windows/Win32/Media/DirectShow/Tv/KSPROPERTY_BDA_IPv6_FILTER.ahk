#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_IPv6_FILTER {
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
    static KSPROPERTY_BDA_IPv6_FILTER_MULTICAST_LIST_SIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_IPv6_FILTER_MULTICAST_LIST => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_IPv6_FILTER_MULTICAST_MODE => 2
}
