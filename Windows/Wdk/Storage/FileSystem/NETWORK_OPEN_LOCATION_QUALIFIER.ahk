#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct NETWORK_OPEN_LOCATION_QUALIFIER {
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
    static NetworkOpenLocationAny => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenLocationRemote => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenLocationLoopback => 2
}
