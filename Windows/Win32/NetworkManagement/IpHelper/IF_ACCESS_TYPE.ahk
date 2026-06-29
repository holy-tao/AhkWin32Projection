#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct IF_ACCESS_TYPE {
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
    static IF_ACCESS_LOOPBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_BROADCAST => 2

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_POINT_TO_POINT => 3

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_POINTTOPOINT => 3

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_POINT_TO_MULTI_POINT => 4

    /**
     * @type {Integer (Int32)}
     */
    static IF_ACCESS_POINTTOMULTIPOINT => 4
}
