#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct NETWORK_OPEN_INTEGRITY_QUALIFIER {
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
    static NetworkOpenIntegrityAny => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenIntegrityNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenIntegritySigned => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenIntegrityEncrypted => 3

    /**
     * @type {Integer (Int32)}
     */
    static NetworkOpenIntegrityMaximum => 4
}
